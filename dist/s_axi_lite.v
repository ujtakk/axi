
`timescale 1 ns / 1 ps

module s_axi_lite(/*AUTOARG*/
   // Outputs
   awready, wready, bvalid, bresp, arready, rvalid, rdata, rresp,
   port0, port1, port2, port3, port4, port5, port6, port7, port8,
   port9, port10, port11, port12, port13, port14, port15,
   // Inputs
   clk, xrst, awaddr, awprot, awvalid, wdata, wstrb, wvalid, bready,
   arvalid, araddr, arprot, rready, port31, port30, port29, port28,
   port27, port26, port25, port24, port23, port22, port21, port20,
   port19, port18, port17, port16
   );
`include "parameters.vh"

  /*AUTOINPUT*/
  input                 clk;
  input                 xrst;
  input [REG_WIDTH-1:0] awaddr;
  input [2:0]           awprot;
  input                 awvalid;
  input [DWIDTH-1:0]    wdata;
  input [DWIDTH/8-1:0]  wstrb;
  input                 wvalid;
  input                 bready;
  input                 arvalid;
  input [REG_WIDTH-1:0] araddr;
  input [2:0]           arprot;
  input                 rready;
  input [DWIDTH-1:0]    port31;
  input [DWIDTH-1:0]    port30;
  input [DWIDTH-1:0]    port29;
  input [DWIDTH-1:0]    port28;
  input [DWIDTH-1:0]    port27;
  input [DWIDTH-1:0]    port26;
  input [DWIDTH-1:0]    port25;
  input [DWIDTH-1:0]    port24;
  input [DWIDTH-1:0]    port23;
  input [DWIDTH-1:0]    port22;
  input [DWIDTH-1:0]    port21;
  input [DWIDTH-1:0]    port20;
  input [DWIDTH-1:0]    port19;
  input [DWIDTH-1:0]    port18;
  input [DWIDTH-1:0]    port17;
  input [DWIDTH-1:0]    port16;

  /*AUTOOUTPUT*/
  output              awready;
  output              wready;
  output              bvalid;
  output [1:0]        bresp;
  output              arready;
  output              rvalid;
  output [DWIDTH-1:0] rdata;
  output [1:0]        rresp;
  output [DWIDTH-1:0] port0;
  output [DWIDTH-1:0] port1;
  output [DWIDTH-1:0] port2;
  output [DWIDTH-1:0] port3;
  output [DWIDTH-1:0] port4;
  output [DWIDTH-1:0] port5;
  output [DWIDTH-1:0] port6;
  output [DWIDTH-1:0] port7;
  output [DWIDTH-1:0] port8;
  output [DWIDTH-1:0] port9;
  output [DWIDTH-1:0] port10;
  output [DWIDTH-1:0] port11;
  output [DWIDTH-1:0] port12;
  output [DWIDTH-1:0] port13;
  output [DWIDTH-1:0] port14;
  output [DWIDTH-1:0] port15;

  /*AUTOWIRE*/
  wire port_we;
  wire port_re;

  /*AUTOREG*/
  reg                 r_awready;
  reg [REG_WIDTH-1:0] r_awaddr;
  reg                 r_wready;
  reg                 r_bvalid;
  reg [1:0]           r_bresp;
  reg                 r_arready;
  reg [REG_WIDTH-1:0] r_araddr;
  reg                 r_rvalid;
  reg [DWIDTH-1:0]    r_rdata;
  reg [1:0]           r_rresp;
  reg [DWIDTH-1:0]    r_port0;
  reg [DWIDTH-1:0]    r_port1;
  reg [DWIDTH-1:0]    r_port2;
  reg [DWIDTH-1:0]    r_port3;
  reg [DWIDTH-1:0]    r_port4;
  reg [DWIDTH-1:0]    r_port5;
  reg [DWIDTH-1:0]    r_port6;
  reg [DWIDTH-1:0]    r_port7;
  reg [DWIDTH-1:0]    r_port8;
  reg [DWIDTH-1:0]    r_port9;
  reg [DWIDTH-1:0]    r_port10;
  reg [DWIDTH-1:0]    r_port11;
  reg [DWIDTH-1:0]    r_port12;
  reg [DWIDTH-1:0]    r_port13;
  reg [DWIDTH-1:0]    r_port14;
  reg [DWIDTH-1:0]    r_port15;
  reg [DWIDTH-1:0]    r_port16;
  reg [DWIDTH-1:0]    r_port17;
  reg [DWIDTH-1:0]    r_port18;
  reg [DWIDTH-1:0]    r_port19;
  reg [DWIDTH-1:0]    r_port20;
  reg [DWIDTH-1:0]    r_port21;
  reg [DWIDTH-1:0]    r_port22;
  reg [DWIDTH-1:0]    r_port23;
  reg [DWIDTH-1:0]    r_port24;
  reg [DWIDTH-1:0]    r_port25;
  reg [DWIDTH-1:0]    r_port26;
  reg [DWIDTH-1:0]    r_port27;
  reg [DWIDTH-1:0]    r_port28;
  reg [DWIDTH-1:0]    r_port29;
  reg [DWIDTH-1:0]    r_port30;
  reg [DWIDTH-1:0]    r_port31;

//==========================================================
// write address control
//==========================================================

  assign awready = r_awready;

  always @(posedge clk)
    if (!xrst)
      r_awready <= 0;
    else
      if (!r_awready && awvalid && wvalid)
        r_awready <= 1;
      else
        r_awready <= 0;

  always @(posedge clk)
    if (!xrst)
      r_awaddr <= 0;
    else
      if (!r_awready && awvalid && wvalid)
        r_awaddr <= awaddr;

//==========================================================
// write data control
//==========================================================

  assign wready = r_wready;

  always @(posedge clk)
    if (!xrst)
      r_wready <= 0;
    else
      if (!r_wready && awvalid && wvalid)
        r_wready <= 1;
      else
        r_wready <= 0;

//==========================================================
// write response control
//==========================================================

  assign bvalid = r_bvalid;
  assign bresp  = r_bresp;

  always @(posedge clk)
    if (!xrst)
      r_bvalid <= 0;
    else
      if (r_awready && awvalid && !r_bvalid && r_wready && wvalid)
        r_bvalid <= 1;
      else if (bready && r_bvalid)
        r_bvalid <= 0;

  always @(posedge clk)
    if (!xrst)
      r_bresp <= 0;
    else
      if (r_awready && awvalid && !r_bvalid && r_wready && wvalid)
        r_bresp <= 0; // "OKAY" response

//==========================================================
// read address control
//==========================================================

  assign arready = r_arready;

  always @(posedge clk)
    if (!xrst)
      r_arready <= 0;
    else
      if (!r_arready && arvalid)
        r_arready <= 1;
      else
        r_arready <= 0;

  always @(posedge clk)
    if (!xrst)
      r_araddr <= 0;
    else
      if (!r_arready && arvalid)
        r_araddr <= araddr;

//==========================================================
// read data control
//==========================================================

  assign rvalid = r_rvalid;
  assign rdata  = r_rdata;
  assign rresp  = r_rresp;

  always @(posedge clk)
    if (!xrst)
      r_rvalid <= 0;
    else
      if (r_arready && arvalid && !r_rvalid)
        r_rvalid <= 1;
      else if (rvalid && rready)
        r_rvalid <= 0;

  always @(posedge clk)
    if (!xrst)
      r_rdata <= 0;
    else
      if (port_re)
        case (r_araddr[REG_WIDTH-1:LSB])
          0:  r_rdata <= r_port0;
          1:  r_rdata <= r_port1;
          2:  r_rdata <= r_port2;
          3:  r_rdata <= r_port3;
          4:  r_rdata <= r_port4;
          5:  r_rdata <= r_port5;
          6:  r_rdata <= r_port6;
          7:  r_rdata <= r_port7;
          8:  r_rdata <= r_port8;
          9:  r_rdata <= r_port9;
          10:  r_rdata <= r_port10;
          11:  r_rdata <= r_port11;
          12:  r_rdata <= r_port12;
          13:  r_rdata <= r_port13;
          14:  r_rdata <= r_port14;
          15:  r_rdata <= r_port15;
          16:  r_rdata <= r_port16;
          17:  r_rdata <= r_port17;
          18:  r_rdata <= r_port18;
          19:  r_rdata <= r_port19;
          20:  r_rdata <= r_port20;
          21:  r_rdata <= r_port21;
          22:  r_rdata <= r_port22;
          23:  r_rdata <= r_port23;
          24:  r_rdata <= r_port24;
          25:  r_rdata <= r_port25;
          26:  r_rdata <= r_port26;
          27:  r_rdata <= r_port27;
          28:  r_rdata <= r_port28;
          29:  r_rdata <= r_port29;
          30:  r_rdata <= r_port30;
          31:  r_rdata <= r_port31;
          default: r_rdata <= 0;
        endcase


  always @(posedge clk)
    if (!xrst)
      r_rresp <= 0;
    else
      if (r_arready && arvalid && !r_rvalid)
        r_rresp <= 0; // "OKAY" response

//==========================================================
// port control
//==========================================================

  assign port_we = r_wready && wvalid && r_awready && awvalid;
  assign port_re = r_arready && arvalid && !r_rvalid;

  // PS->PL ports
  assign port0 = r_port0;
  assign port1 = r_port1;
  assign port2 = r_port2;
  assign port3 = r_port3;
  assign port4 = r_port4;
  assign port5 = r_port5;
  assign port6 = r_port6;
  assign port7 = r_port7;
  assign port8 = r_port8;
  assign port9 = r_port9;
  assign port10 = r_port10;
  assign port11 = r_port11;
  assign port12 = r_port12;
  assign port13 = r_port13;
  assign port14 = r_port14;
  assign port15 = r_port15;

  integer byte_idx;
  always @(posedge clk)
    if (!xrst) begin
      r_port0 <= 0;
      r_port1 <= 0;
      r_port2 <= 0;
      r_port3 <= 0;
      r_port4 <= 0;
      r_port5 <= 0;
      r_port6 <= 0;
      r_port7 <= 0;
      r_port8 <= 0;
      r_port9 <= 0;
      r_port10 <= 0;
      r_port11 <= 0;
      r_port12 <= 0;
      r_port13 <= 0;
      r_port14 <= 0;
      r_port15 <= 0;
      r_port16 <= 0;
      r_port17 <= 0;
      r_port18 <= 0;
      r_port19 <= 0;
      r_port20 <= 0;
      r_port21 <= 0;
      r_port22 <= 0;
      r_port23 <= 0;
      r_port24 <= 0;
      r_port25 <= 0;
      r_port26 <= 0;
      r_port27 <= 0;
      r_port28 <= 0;
      r_port29 <= 0;
      r_port30 <= 0;
      r_port31 <= 0;
    end
    else
      if (port_we)
        case (r_awaddr[REG_WIDTH-1:LSB])
          0:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port0[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          1:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port1[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          2:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port2[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          3:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port3[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          4:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port4[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          5:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port5[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          6:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port6[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          7:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port7[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          8:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port8[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          9:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port9[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          10:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port10[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          11:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port11[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          12:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port12[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          13:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port13[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          14:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port14[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          15:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port15[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          16:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port16[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          17:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port17[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          18:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port18[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          19:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port19[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          20:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port20[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          21:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port21[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          22:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port22[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          23:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port23[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          24:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port24[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          25:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port25[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          26:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port26[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          27:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port27[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          28:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port28[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          29:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port29[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          30:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port30[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          31:
            for (byte_idx = 0; byte_idx < DWIDTH/8; byte_idx = byte_idx + 1)
              if (wstrb[byte_idx])
                r_port31[byte_idx*8 +: 8] <= wdata[byte_idx*8 +: 8];
          default: begin
            r_port0 <= r_port0;
            r_port1 <= r_port1;
            r_port2 <= r_port2;
            r_port3 <= r_port3;
            r_port4 <= r_port4;
            r_port5 <= r_port5;
            r_port6 <= r_port6;
            r_port7 <= r_port7;
            r_port8 <= r_port8;
            r_port9 <= r_port9;
            r_port10 <= r_port10;
            r_port11 <= r_port11;
            r_port12 <= r_port12;
            r_port13 <= r_port13;
            r_port14 <= r_port14;
            r_port15 <= r_port15;
            r_port16 <= r_port16;
            r_port17 <= r_port17;
            r_port18 <= r_port18;
            r_port19 <= r_port19;
            r_port20 <= r_port20;
            r_port21 <= r_port21;
            r_port22 <= r_port22;
            r_port23 <= r_port23;
            r_port24 <= r_port24;
            r_port25 <= r_port25;
            r_port26 <= r_port26;
            r_port27 <= r_port27;
            r_port28 <= r_port28;
            r_port29 <= r_port29;
            r_port30 <= r_port30;
            r_port31 <= r_port31;
          end
        endcase
      else begin
        // PL->PS ports
        r_port31 <= port31;
        r_port30 <= port30;
        r_port29 <= port29;
        r_port28 <= port28;
        r_port27 <= port27;
        r_port26 <= port26;
        r_port25 <= port25;
        r_port24 <= port24;
        r_port23 <= port23;
        r_port22 <= port22;
        r_port21 <= port21;
        r_port20 <= port20;
        r_port19 <= port19;
        r_port18 <= port18;
        r_port17 <= port17;
        r_port16 <= port16;
      end

endmodule

