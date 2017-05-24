
`timescale 1 ns / 1 ps

module m_axi_lite(/*AUTOARG*/
   // Outputs
   ack, err, probe, awvalid, awaddr, awprot, wvalid, wdata, wstrb,
   bready, arvalid, araddr, arprot, rready,
   // Inputs
   clk, xrst, req, awready, wready, bresp, bvalid, arready, rdata,
   rresp, rvalid
   );
`include "parameters.vh"

  parameter TXN_NUM = 4;
  parameter TXN_BIT = clogb2(TXN_NUM);

  localparam  S_IDLE  = 'd0,
              S_WRITE = 'd1,
              S_READ  = 'd2,
              S_COMP  = 'd3;

  /*AUTOINPUT*/
  input               clk;
  input               xrst;
  input               req;

  input               awready;
  input               wready;
  input [1:0]         bresp;
  input               bvalid;
  input               arready;
  input [DWIDTH-1:0]  rdata;
  input [1:0]         rresp;
  input               rvalid;

  /*AUTOOUTPUT*/
  output                  ack;
  output                  err;
  output [DWIDTH-1:0]     probe;

  output                  awvalid;
  output [REG_WIDTH-1:0]  awaddr;
  output [2:0]            awprot;
  output                  wvalid;
  output [DWIDTH-1:0]     wdata;
  output [DWIDTH/8-1:0]   wstrb;
  output                  bready;
  output                  arvalid;
  output [REG_WIDTH-1:0]  araddr;
  output [2:0]            arprot;
  output                  rready;

  /*AUTOWIRE*/
  wire req_pulse;
  wire s_write_end;
  wire s_read_end;
  wire s_comp_end;
  wire last_write;
  wire last_read;
  wire not_writing;
  wire not_reading;
  wire err_wresp;
  wire err_rresp;
  wire err_diff;

  /*AUTOREG*/
  reg [1:0]         r_state;
  reg               r_req;
  reg               r_ack;
  reg               r_err;
  reg               r_awvalid;
  reg               r_awaddr;
  reg               r_wvalid;
  reg               r_wdata;
  reg               r_bready;
  reg               r_arvalid;
  reg               r_araddr;
  reg               r_rready;
  reg               r_write_single;
  reg               r_write_issued;
  reg               r_read_single;
  reg               r_read_issued;
  reg [DWIDTH-1:0]  r_exp_rdata;
  reg               r_last_write;
  reg               r_last_read;
  reg [TXN_BIT-1:0] r_write_idx;
  reg [TXN_BIT-1:0] r_read_idx;

//==========================================================
// core control
//==========================================================

  assign probe = {30'h0, r_state};

  assign req_pulse = req && !r_req;

  assign s_write_end = r_last_write && r_bready && bvalid;
  assign s_read_end  = r_last_read  && r_rready && rvalid;
  assign s_comp_end  = r_state == S_COMP;

  assign last_write = r_write_idx == TXN_NUM && awready;
  assign last_read  = r_read_idx == TXN_NUM && arready;

  assign not_writing = !r_last_write && !r_write_single && !r_write_issued;
  assign not_reading = !r_last_read && !r_read_single && !r_read_issued;

  always @(posedge clk)
    if (!xrst)
      r_req <= 0;
    else
      r_req <= req;

  always @(posedge clk)
    if (!xrst) begin
      r_state <= S_IDLE;

      r_write_single <= 0;
      r_write_issued <= 0;

      r_read_single <= 0;
      r_read_issued <= 0;
    end
    else
      case (r_state)
        S_IDLE:
          if (req_pulse)
            r_state <= S_WRITE;

        S_WRITE:
          if (s_write_end)
            r_state <= S_READ;
          else
            if (!r_awvalid && !r_wvalid && !bvalid && not_writing) begin
              r_write_single <= 1;
              r_write_issued <= 1;
            end
            else if (r_bready)
              r_write_issued <= 0;
            else
              r_write_single <= 0;

        S_READ:
          if (s_read_end)
            r_state <= S_READ;
          else
            if (!r_arvalid && !rvalid && not_reading) begin
              r_read_issued <= 1;
              r_read_single <= 1;
            end
            else if (r_rready)
              r_read_issued <= 0;
            else
              r_read_single <= 0;

        S_COMP:
          if (s_comp_end)
            r_state <= S_IDLE;

        default:
          r_state <= S_IDLE;
      endcase

  always @(posedge clk)
    if (!xrst)
      r_write_idx <= 0;
    else if (req_pulse)
      r_write_idx <= 0;
    else if (r_write_single)
      r_write_idx <= r_write_idx + 1;

  always @(posedge clk)
    if (!xrst)
      r_last_write <= 0;
    else if (req_pulse)
      r_last_write <= 0;
    else if (r_write_idx == TXN_NUM && awready)
      r_last_write <= 1;

  always @(posedge clk)
    if (!xrst)
      r_read_idx <= 0;
    else if (req_pulse)
      r_read_idx <= 0;
    else if (r_read_single)
      r_read_idx <= r_read_idx + 1;

  always @(posedge clk)
    if (!xrst)
      r_last_read <= 0;
    else if (req_pulse)
      r_last_read <= 0;
    else if (r_read_idx == TXN_NUM && arready)
      r_last_read <= 1;

//==========================================================
// write address control
//==========================================================

  assign awvalid = r_awvalid;
  assign awaddr  = r_awaddr;
  assign awprot  = 3'b000;

  always @(posedge clk)
    if (!xrst)
      r_awvalid <= 0;
    else if (req_pulse)
      r_awvalid <= 0;
    else if (r_write_single)
      r_awvalid <= 1;
    else if (awready && r_awvalid)
      r_awvalid <= 0;

  // NOTE: User Logic
  always @(posedge clk)
    if (!xrst)
      r_awaddr <= 0;
    else if (awready && r_awvalid)
      r_awaddr <= r_awaddr + 4;

//==========================================================
// write data control
//==========================================================

  assign wvalid = r_wvalid;
  assign wdata = r_wdata;
  assign wstrb = 4'b1111;

  always @(posedge clk)
    if (!xrst)
      r_wvalid <= 0;
    else if (req_pulse)
      r_wvalid <= 0;
    else if (r_write_single)
      r_wvalid <= 1;
    else if (wready && r_wvalid)
      r_wvalid <= 0;

  // NOTE: User Logic
  always @(posedge clk)
    if (!xrst)
      r_wdata <= 0;
    else if (wready && r_wvalid)
      r_wdata <= r_wdata + r_write_idx;

//==========================================================
// write response control
//==========================================================

  assign bready = r_bready;
  assign err_wresp = r_bready && bvalid && bresp[1];

  always @(posedge clk)
    if (!xrst)
      r_bready <= 0;
    else if (req_pulse)
      r_bready <= 0;
    else if (bvalid && !r_bready)
      r_bready <= 1;
    else if (r_bready)
      r_bready <= 0;

//==========================================================
// read address control
//==========================================================

  assign arvalid = r_arvalid;
  assign araddr  = r_araddr;
  assign arprot  = 3'b001;

  always @(posedge clk)
    if (!xrst)
      r_arvalid <= 0;
    else if (req_pulse)
      r_arvalid <= 0;
    else if (r_read_single)
      r_arvalid <= 1;
    else if (arready && r_arvalid)
      r_arvalid <= 0;

  // NOTE: User Logic
  always @(posedge clk)
    if (!xrst)
      r_araddr <= 0;
    else if (arready && r_arvalid)
      r_araddr <= r_araddr + 4;

//==========================================================
// read data control
//==========================================================

  assign rready = r_rready;
  assign err_rresp = r_rready && rvalid && rresp[1];

  always @(posedge clk)
    if (!xrst)
      r_rready <= 0;
    else if (req_pulse)
      r_rready <= 0;
    else if (rvalid && !r_rready)
      r_rready <= 1;
    else if (r_rready)
      r_rready <= 0;

//==========================================================
// ack / err control
//==========================================================

  assign ack = r_ack;
  assign err = r_err;

  assign err_diff = rvalid && r_rready
                 && rdata != r_exp_rdata;

  always @(posedge clk)
    if (!xrst)
      r_ack <= 0;
    else if (req_pulse)
      r_ack <= 0;
    else if (s_comp_end)
      r_ack <= 1;

  always @(posedge clk)
    if (!xrst)
      r_err <= 0;
    else if (req_pulse)
      r_err <= 0;
    else if (err_diff || err_wresp || err_rresp)
      r_err <= 1;

  // NOTE: User Logic
  always @(posedge clk)
    if (!xrst)
      r_exp_rdata <= 0;
    else if (rvalid && r_rready)
      r_exp_rdata <= r_exp_rdata + r_read_idx;

endmodule

