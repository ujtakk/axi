
`timescale 1 ns / 1 ps

module s_axi_stream(/*AUTOARG*/
   // Outputs
   tready, buf_data,
   // Inputs
   clk, xrst, tvalid, tdata, tstrb, tlast, buf_re
   );
`include "parameters.vh"

  parameter WORDS = 2 ** BUFSIZE;

  localparam  S_IDLE  = 'd0,
              S_WRITE = 'd1;

  /*AUTOINPUT*/
  input                 clk;
  input                 xrst;
  input                 tvalid;
  input [DWIDTH-1:0]    tdata;
  input [DWIDTH/8-1:0]  tstrb;
  input                 tlast;
  input                 buf_re;

  /*AUTOOUTPUT*/
  output tready;
  output [DWIDTH-1:0]   buf_data;

  /*AUTOWIRE*/
  wire s_write_end;
  wire fifo_we;

  /*AUTOREG*/
  reg r_state;
  reg r_tready;
  reg r_write_end;
  reg [DWIDTH-1:0] fifo [0:WORDS-1];
  reg [BUFSIZE-1:0] r_write_ptr;
  reg [BUFSIZE-1:0] r_read_ptr;

//==========================================================
// core control
//==========================================================

  always @(posedge clk)
    if (!xrst)
      r_state <= S_IDLE;
    else
      case (r_state)
        S_IDLE:
          if (tvalid)
            r_state <= S_WRITE;

        S_WRITE:
          if (s_write_end)
            r_state <= S_IDLE;
      endcase

//==========================================================
// stream control
//==========================================================

  assign tready = r_tready;

  always @(posedge clk)
    if (!xrst)
      r_tready <= 0;
    else
      r_tready <= r_state == S_WRITE && r_write_ptr <= WORDS - 1;

//==========================================================
// fifo control
//==========================================================

  assign s_write_end = r_write_end;

  assign fifo_we = tvalid && r_tready;
  assign buf_data = fifo[r_read_ptr];

  // NOTE: We kill the wstrb
  always @(posedge clk)
    if (fifo_we)
      fifo[r_write_ptr] <= tdata;

  always @(posedge clk)
    if (!xrst)
      r_write_ptr <= 0;
    else
      if (r_write_ptr <= WORDS - 1)
        if (fifo_we)
          r_write_ptr <= r_write_ptr + 1;

  always @(posedge clk)
    if (!xrst)
      r_read_ptr <= 0;
    else
      if (r_read_ptr <= WORDS - 1)
        if (buf_re)
          r_read_ptr <= r_read_ptr + 1;

  always @(posedge clk)
    if (!xrst)
      r_write_end <= 0;
    else
      if (r_write_ptr <= WORDS - 1) begin
        if (fifo_we)
          r_write_end <= 0;

        if (r_write_ptr == WORDS - 1 || tlast)
          r_write_end <= 1;
      end

endmodule

