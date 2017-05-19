
`timescale 1 ns / 1 ps

// Template to ignore unnecessary output ports.
// enumerate in quoted list of verilog-regexp-words.
/* AUTO_LISP(setq verilog-auto-output-ignore-regexp
    (verilog-regexp-words `(
      "port0"
      "port1"
      "port2"
      "port3"
      "port4"
      "port5"
      "port6"
      "port7"
      "port8"
      "port9"
      "port10"
      "port11"
      "port12"
      "port13"
      "port14"
      "port15"
      "port16"
      "port17"
      "port18"
      "port19"
      "port20"
      "port21"
      "port22"
      "port23"
      "port24"
      "port25"
      "port26"
      "port27"
      "port28"
      "port29"
      "port30"
      "port31"
      "mem_we"
      "mem_addr"
      "mem_wdata"
      "mem_rdata"
      "buf_re"
      "buf_data"
   ))) */

module axi_top(/*AUTOARG*/
   // Outputs
   s_axi_lite_awready, s_axi_lite_wready, s_axi_lite_bresp,
   s_axi_lite_bvalid, s_axi_lite_arready, s_axi_lite_rdata,
   s_axi_lite_rresp, s_axi_lite_rvalid, m_axi_lite_awaddr,
   m_axi_lite_awprot, m_axi_lite_awvalid, m_axi_lite_wdata,
   m_axi_lite_wstrb, m_axi_lite_wvalid, m_axi_lite_bready,
   m_axi_lite_araddr, m_axi_lite_arprot, m_axi_lite_arvalid,
   m_axi_lite_rready, s_axi_awready, s_axi_wready, s_axi_bid,
   s_axi_bresp, s_axi_buser, s_axi_bvalid, s_axi_arready, s_axi_rid,
   s_axi_rdata, s_axi_rresp, s_axi_rlast, s_axi_ruser, s_axi_rvalid,
   m_axi_awid, m_axi_awaddr, m_axi_awlen, m_axi_awsize, m_axi_awburst,
   m_axi_awlock, m_axi_awcache, m_axi_awprot, m_axi_awqos,
   m_axi_awuser, m_axi_awvalid, m_axi_wdata, m_axi_wstrb, m_axi_wlast,
   m_axi_wuser, m_axi_wvalid, m_axi_bready, m_axi_arid, m_axi_araddr,
   m_axi_arlen, m_axi_arsize, m_axi_arburst, m_axi_arlock,
   m_axi_arcache, m_axi_arprot, m_axi_arqos, m_axi_aruser,
   m_axi_arvalid, m_axi_rready, s_axi_stream_tready,
   m_axi_stream_tvalid, m_axi_stream_tdata, m_axi_stream_tstrb,
   m_axi_stream_tlast,
   // Inputs
   s_axi_lite_aclk, s_axi_lite_aresetn, s_axi_lite_awaddr,
   s_axi_lite_awprot, s_axi_lite_awvalid, s_axi_lite_wdata,
   s_axi_lite_wstrb, s_axi_lite_wvalid, s_axi_lite_bready,
   s_axi_lite_araddr, s_axi_lite_arprot, s_axi_lite_arvalid,
   s_axi_lite_rready, m_axi_lite_aclk, m_axi_lite_aresetn,
   m_axi_lite_awready, m_axi_lite_wready, m_axi_lite_bresp,
   m_axi_lite_bvalid, m_axi_lite_arready, m_axi_lite_rdata,
   m_axi_lite_rresp, m_axi_lite_rvalid, s_axi_aclk, s_axi_aresetn,
   s_axi_awid, s_axi_awaddr, s_axi_awlen, s_axi_awsize, s_axi_awburst,
   s_axi_awlock, s_axi_awcache, s_axi_awprot, s_axi_awqos,
   s_axi_awregion, s_axi_awuser, s_axi_awvalid, s_axi_wdata,
   s_axi_wstrb, s_axi_wlast, s_axi_wuser, s_axi_wvalid, s_axi_bready,
   s_axi_arid, s_axi_araddr, s_axi_arlen, s_axi_arsize, s_axi_arburst,
   s_axi_arlock, s_axi_arcache, s_axi_arprot, s_axi_arqos,
   s_axi_arregion, s_axi_aruser, s_axi_arvalid, s_axi_rready,
   m_axi_aclk, m_axi_aresetn, m_axi_awready, m_axi_wready, m_axi_bid,
   m_axi_bresp, m_axi_buser, m_axi_bvalid, m_axi_arready, m_axi_rid,
   m_axi_rdata, m_axi_rresp, m_axi_rlast, m_axi_ruser, m_axi_rvalid,
   s_axi_stream_aclk, s_axi_stream_aresetn, s_axi_stream_tdata,
   s_axi_stream_tstrb, s_axi_stream_tlast, s_axi_stream_tvalid,
   m_axi_stream_aclk, m_axi_stream_aresetn, m_axi_stream_tready
   );
`include "parameters.vh"

  /*AUTOINPUT*/
  input                 s_axi_lite_aclk;
  input                 s_axi_lite_aresetn;
  input [REGSIZE-1:0]   s_axi_lite_awaddr;
  input [2:0]           s_axi_lite_awprot;
  input                 s_axi_lite_awvalid;
  input [DWIDTH-1:0]    s_axi_lite_wdata;
  input [DWIDTH/8-1:0]  s_axi_lite_wstrb;
  input                 s_axi_lite_wvalid;
  input                 s_axi_lite_bready;
  input [REGSIZE-1:0]   s_axi_lite_araddr;
  input [2:0]           s_axi_lite_arprot;
  input                 s_axi_lite_arvalid;
  input                 s_axi_lite_rready;

  input               m_axi_lite_aclk;
  input               m_axi_lite_aresetn;
  input               m_axi_lite_awready;
  input               m_axi_lite_wready;
  input [1:0]         m_axi_lite_bresp;
  input               m_axi_lite_bvalid;
  input               m_axi_lite_arready;
  input [DWIDTH-1:0]  m_axi_lite_rdata;
  input [1:0]         m_axi_lite_rresp;
  input               m_axi_lite_rvalid;

  input                     s_axi_aclk;
  input                     s_axi_aresetn;
  input [ID_WIDTH-1:0]      s_axi_awid;
  input [MEMSIZE-1:0]       s_axi_awaddr;
  input [7:0]               s_axi_awlen;
  input [2:0]               s_axi_awsize;
  input [1:0]               s_axi_awburst;
  input                     s_axi_awlock;
  input [3:0]               s_axi_awcache;
  input [2:0]               s_axi_awprot;
  input [3:0]               s_axi_awqos;
  input [3:0]               s_axi_awregion;
  input [AWUSER_WIDTH-1:0]  s_axi_awuser;
  input                     s_axi_awvalid;
  input [DWIDTH-1:0]        s_axi_wdata;
  input [DWIDTH/8-1:0]      s_axi_wstrb;
  input                     s_axi_wlast;
  input [WUSER_WIDTH-1:0]   s_axi_wuser;
  input                     s_axi_wvalid;
  input                     s_axi_bready;
  input [ID_WIDTH-1:0]      s_axi_arid;
  input [MEMSIZE-1:0]       s_axi_araddr;
  input [7:0]               s_axi_arlen;
  input [2:0]               s_axi_arsize;
  input [1:0]               s_axi_arburst;
  input                     s_axi_arlock;
  input [3:0]               s_axi_arcache;
  input [2:0]               s_axi_arprot;
  input [3:0]               s_axi_arqos;
  input [3:0]               s_axi_arregion;
  input [ARUSER_WIDTH-1:0]  s_axi_aruser;
  input                     s_axi_arvalid;
  input                     s_axi_rready;

  input                   m_axi_aclk;
  input                   m_axi_aresetn;
  input                   m_axi_awready;
  input                   m_axi_wready;
  input [ID_WIDTH-1:0]    m_axi_bid;
  input [1:0]             m_axi_bresp;
  input [BUSER_WIDTH-1:0] m_axi_buser;
  input                   m_axi_bvalid;
  input                   m_axi_arready;
  input [ID_WIDTH-1:0]    m_axi_rid;
  input [DWIDTH-1:0]      m_axi_rdata;
  input [1:0]             m_axi_rresp;
  input                   m_axi_rlast;
  input [RUSER_WIDTH-1:0] m_axi_ruser;
  input                   m_axi_rvalid;

  input                 s_axi_stream_aclk;
  input                 s_axi_stream_aresetn;
  input [DWIDTH-1:0]    s_axi_stream_tdata;
  input [DWIDTH/8-1:0]  s_axi_stream_tstrb;
  input                 s_axi_stream_tlast;
  input                 s_axi_stream_tvalid;

  input m_axi_stream_aclk;
  input m_axi_stream_aresetn;
  input m_axi_stream_tready;

  /*AUTOOUTPUT*/
  output              s_axi_lite_awready;
  output              s_axi_lite_wready;
  output [1:0]        s_axi_lite_bresp;
  output              s_axi_lite_bvalid;
  output              s_axi_lite_arready;
  output [DWIDTH-1:0] s_axi_lite_rdata;
  output [1:0]        s_axi_lite_rresp;
  output              s_axi_lite_rvalid;

  output [REGSIZE-1:0]  m_axi_lite_awaddr;
  output [2:0]          m_axi_lite_awprot;
  output                m_axi_lite_awvalid;
  output [DWIDTH-1:0]   m_axi_lite_wdata;
  output [DWIDTH/8-1:0] m_axi_lite_wstrb;
  output                m_axi_lite_wvalid;
  output                m_axi_lite_bready;
  output [REGSIZE-1:0]  m_axi_lite_araddr;
  output [2:0]          m_axi_lite_arprot;
  output                m_axi_lite_arvalid;
  output                m_axi_lite_rready;

  output                    s_axi_awready;
  output                    s_axi_wready;
  output [ID_WIDTH-1:0]     s_axi_bid;
  output [1:0]              s_axi_bresp;
  output [BUSER_WIDTH-1:0]  s_axi_buser;
  output                    s_axi_bvalid;
  output                    s_axi_arready;
  output [ID_WIDTH-1:0]     s_axi_rid;
  output [DWIDTH-1:0]       s_axi_rdata;
  output [1:0]              s_axi_rresp;
  output                    s_axi_rlast;
  output [RUSER_WIDTH-1:0]  s_axi_ruser;
  output                    s_axi_rvalid;

  output [ID_WIDTH-1:0]     m_axi_awid;
  output [MEMSIZE-1:0]      m_axi_awaddr;
  output [7:0]              m_axi_awlen;
  output [2:0]              m_axi_awsize;
  output [1:0]              m_axi_awburst;
  output                    m_axi_awlock;
  output [3:0]              m_axi_awcache;
  output [2:0]              m_axi_awprot;
  output [3:0]              m_axi_awqos;
  output [AWUSER_WIDTH-1:0] m_axi_awuser;
  output                    m_axi_awvalid;
  output [DWIDTH-1:0]       m_axi_wdata;
  output [DWIDTH/8-1:0]     m_axi_wstrb;
  output                    m_axi_wlast;
  output [WUSER_WIDTH-1:0]  m_axi_wuser;
  output                    m_axi_wvalid;
  output                    m_axi_bready;
  output [ID_WIDTH-1:0]     m_axi_arid;
  output [MEMSIZE-1:0]      m_axi_araddr;
  output [7:0]              m_axi_arlen;
  output [2:0]              m_axi_arsize;
  output [1:0]              m_axi_arburst;
  output                    m_axi_arlock;
  output [3:0]              m_axi_arcache;
  output [2:0]              m_axi_arprot;
  output [3:0]              m_axi_arqos;
  output [ARUSER_WIDTH-1:0] m_axi_aruser;
  output                    m_axi_arvalid;
  output                    m_axi_rready;

  output s_axi_stream_tready;

  output                m_axi_stream_tvalid;
  output [DWIDTH-1:0]   m_axi_stream_tdata;
  output [DWIDTH/8-1:0] m_axi_stream_tstrb;
  output                m_axi_stream_tlast;

  /*AUTOWIRE*/
  wire [DWIDTH-1:0]   port0;
  wire [DWIDTH-1:0]   port1;
  wire [DWIDTH-1:0]   port2;
  wire [DWIDTH-1:0]   port3;
  wire [DWIDTH-1:0]   port4;
  wire [DWIDTH-1:0]   port5;
  wire [DWIDTH-1:0]   port6;
  wire [DWIDTH-1:0]   port7;
  wire [DWIDTH-1:0]   port8;
  wire [DWIDTH-1:0]   port9;
  wire [DWIDTH-1:0]   port10;
  wire [DWIDTH-1:0]   port11;
  wire [DWIDTH-1:0]   port12;
  wire [DWIDTH-1:0]   port13;
  wire [DWIDTH-1:0]   port14;
  wire [DWIDTH-1:0]   port15;
  wire [DWIDTH-1:0]   port16;
  wire [DWIDTH-1:0]   port17;
  wire [DWIDTH-1:0]   port18;
  wire [DWIDTH-1:0]   port19;
  wire [DWIDTH-1:0]   port20;
  wire [DWIDTH-1:0]   port21;
  wire [DWIDTH-1:0]   port22;
  wire [DWIDTH-1:0]   port23;
  wire [DWIDTH-1:0]   port24;
  wire [DWIDTH-1:0]   port25;
  wire [DWIDTH-1:0]   port26;
  wire [DWIDTH-1:0]   port27;
  wire [DWIDTH-1:0]   port28;
  wire [DWIDTH-1:0]   port29;
  wire [DWIDTH-1:0]   port30;
  wire [DWIDTH-1:0]   port31;
  wire                mem_we;
  wire [MEMSIZE-1:0]  mem_addr;
  wire [DWIDTH-1:0]   mem_wdata;
  wire [DWIDTH-1:0]   mem_rdata;
  wire                buf_re;
  wire [DWIDTH-1:0]   buf_data;

  /*AUTOREG*/

  /* s_axi_lite AUTO_TEMPLATE (
      .clk      (s_axi_lite_aclk),
      .xrst     (s_axi_lite_aresetn),
      .awaddr   (s_axi_lite_awaddr),
      .awprot   (s_axi_lite_awprot),
      .awvalid  (s_axi_lite_awvalid),
      .awready  (s_axi_lite_awready),
      .wdata    (s_axi_lite_wdata),
      .wstrb    (s_axi_lite_wstrb),
      .wvalid   (s_axi_lite_wvalid),
      .wready   (s_axi_lite_wready),
      .bresp    (s_axi_lite_bresp),
      .bvalid   (s_axi_lite_bvalid),
      .bready   (s_axi_lite_bready),
      .araddr   (s_axi_lite_araddr),
      .arprot   (s_axi_lite_arprot),
      .arvalid  (s_axi_lite_arvalid),
      .arready  (s_axi_lite_arready),
      .rdata    (s_axi_lite_rdata),
      .rresp    (s_axi_lite_rresp),
      .rvalid   (s_axi_lite_rvalid),
      .rready   (s_axi_lite_rready),
  ); */
  s_axi_lite s_axi_lite_inst(/*AUTOINST*/
			     // Outputs
			     .awready		(s_axi_lite_awready), // Templated
			     .wready		(s_axi_lite_wready), // Templated
			     .bvalid		(s_axi_lite_bvalid), // Templated
			     .bresp		(s_axi_lite_bresp), // Templated
			     .arready		(s_axi_lite_arready), // Templated
			     .rvalid		(s_axi_lite_rvalid), // Templated
			     .rdata		(s_axi_lite_rdata), // Templated
			     .rresp		(s_axi_lite_rresp), // Templated
			     .port0		(port0[DWIDTH-1:0]),
			     .port1		(port1[DWIDTH-1:0]),
			     .port2		(port2[DWIDTH-1:0]),
			     .port3		(port3[DWIDTH-1:0]),
			     .port4		(port4[DWIDTH-1:0]),
			     .port5		(port5[DWIDTH-1:0]),
			     .port6		(port6[DWIDTH-1:0]),
			     .port7		(port7[DWIDTH-1:0]),
			     .port8		(port8[DWIDTH-1:0]),
			     .port9		(port9[DWIDTH-1:0]),
			     .port10		(port10[DWIDTH-1:0]),
			     .port11		(port11[DWIDTH-1:0]),
			     .port12		(port12[DWIDTH-1:0]),
			     .port13		(port13[DWIDTH-1:0]),
			     .port14		(port14[DWIDTH-1:0]),
			     .port15		(port15[DWIDTH-1:0]),
			     // Inputs
			     .clk		(s_axi_lite_aclk), // Templated
			     .xrst		(s_axi_lite_aresetn), // Templated
			     .awaddr		(s_axi_lite_awaddr), // Templated
			     .awprot		(s_axi_lite_awprot), // Templated
			     .awvalid		(s_axi_lite_awvalid), // Templated
			     .wdata		(s_axi_lite_wdata), // Templated
			     .wstrb		(s_axi_lite_wstrb), // Templated
			     .wvalid		(s_axi_lite_wvalid), // Templated
			     .bready		(s_axi_lite_bready), // Templated
			     .arvalid		(s_axi_lite_arvalid), // Templated
			     .araddr		(s_axi_lite_araddr), // Templated
			     .arprot		(s_axi_lite_arprot), // Templated
			     .rready		(s_axi_lite_rready), // Templated
			     .port31		(port31[DWIDTH-1:0]),
			     .port30		(port30[DWIDTH-1:0]),
			     .port29		(port29[DWIDTH-1:0]),
			     .port28		(port28[DWIDTH-1:0]),
			     .port27		(port27[DWIDTH-1:0]),
			     .port26		(port26[DWIDTH-1:0]),
			     .port25		(port25[DWIDTH-1:0]),
			     .port24		(port24[DWIDTH-1:0]),
			     .port23		(port23[DWIDTH-1:0]),
			     .port22		(port22[DWIDTH-1:0]),
			     .port21		(port21[DWIDTH-1:0]),
			     .port20		(port20[DWIDTH-1:0]),
			     .port19		(port19[DWIDTH-1:0]),
			     .port18		(port18[DWIDTH-1:0]),
			     .port17		(port17[DWIDTH-1:0]),
			     .port16		(port16[DWIDTH-1:0]));

  /* m_axi_lite AUTO_TEMPLATE (
      .req      (port0),
      .ack      (port31),
      .err      (port30),
      .clk      (m_axi_lite_aclk),
      .xrst     (m_axi_lite_aresetn),
      .awaddr   (m_axi_lite_awaddr),
      .awprot   (m_axi_lite_awprot),
      .awvalid  (m_axi_lite_awvalid),
      .awready  (m_axi_lite_awready),
      .wdata    (m_axi_lite_wdata),
      .wstrb    (m_axi_lite_wstrb),
      .wvalid   (m_axi_lite_wvalid),
      .wready   (m_axi_lite_wready),
      .bresp    (m_axi_lite_bresp),
      .bvalid   (m_axi_lite_bvalid),
      .bready   (m_axi_lite_bready),
      .araddr   (m_axi_lite_araddr),
      .arprot   (m_axi_lite_arprot),
      .arvalid  (m_axi_lite_arvalid),
      .arready  (m_axi_lite_arready),
      .rdata    (m_axi_lite_rdata),
      .rresp    (m_axi_lite_rresp),
      .rvalid   (m_axi_lite_rvalid),
      .rready   (m_axi_lite_rready),
  ); */
  m_axi_lite m_axi_lite_inst(/*AUTOINST*/
			     // Outputs
			     .ack		(port31),	 // Templated
			     .err		(port30),	 // Templated
			     .awvalid		(m_axi_lite_awvalid), // Templated
			     .awaddr		(m_axi_lite_awaddr), // Templated
			     .awprot		(m_axi_lite_awprot), // Templated
			     .wvalid		(m_axi_lite_wvalid), // Templated
			     .wdata		(m_axi_lite_wdata), // Templated
			     .wstrb		(m_axi_lite_wstrb), // Templated
			     .bready		(m_axi_lite_bready), // Templated
			     .arvalid		(m_axi_lite_arvalid), // Templated
			     .araddr		(m_axi_lite_araddr), // Templated
			     .arprot		(m_axi_lite_arprot), // Templated
			     .rready		(m_axi_lite_rready), // Templated
			     // Inputs
			     .clk		(m_axi_lite_aclk), // Templated
			     .xrst		(m_axi_lite_aresetn), // Templated
			     .req		(port0),	 // Templated
			     .awready		(m_axi_lite_awready), // Templated
			     .wready		(m_axi_lite_wready), // Templated
			     .bresp		(m_axi_lite_bresp), // Templated
			     .bvalid		(m_axi_lite_bvalid), // Templated
			     .arready		(m_axi_lite_arready), // Templated
			     .rdata		(m_axi_lite_rdata), // Templated
			     .rresp		(m_axi_lite_rresp), // Templated
			     .rvalid		(m_axi_lite_rvalid)); // Templated

  /* s_axi AUTO_TEMPLATE (
      .clk      (s_axi_aclk),
      .xrst     (s_axi_aresetn),
      .awid     (s_axi_awid),
      .awaddr   (s_axi_awaddr),
      .awlen    (s_axi_awlen),
      .awsize   (s_axi_awsize),
      .awburst  (s_axi_awburst),
      .awlock   (s_axi_awlock),
      .awcache  (s_axi_awcache),
      .awprot   (s_axi_awprot),
      .awqos    (s_axi_awqos),
      .awregion (s_axi_awregion),
      .awuser   (s_axi_awuser),
      .awvalid  (s_axi_awvalid),
      .awready  (s_axi_awready),
      .wdata    (s_axi_wdata),
      .wstrb    (s_axi_wstrb),
      .wlast    (s_axi_wlast),
      .wuser    (s_axi_wuser),
      .wvalid   (s_axi_wvalid),
      .wready   (s_axi_wready),
      .bid      (s_axi_bid),
      .bresp    (s_axi_bresp),
      .buser    (s_axi_buser),
      .bvalid   (s_axi_bvalid),
      .bready   (s_axi_bready),
      .arid     (s_axi_arid),
      .araddr   (s_axi_araddr),
      .arlen    (s_axi_arlen),
      .arsize   (s_axi_arsize),
      .arburst  (s_axi_arburst),
      .arlock   (s_axi_arlock),
      .arcache  (s_axi_arcache),
      .arprot   (s_axi_arprot),
      .arqos    (s_axi_arqos),
      .arregion (s_axi_arregion),
      .aruser   (s_axi_aruser),
      .arvalid  (s_axi_arvalid),
      .arready  (s_axi_arready),
      .rid      (s_axi_rid),
      .rdata    (s_axi_rdata),
      .rresp    (s_axi_rresp),
      .rlast    (s_axi_rlast),
      .ruser    (s_axi_ruser),
      .rvalid   (s_axi_rvalid),
      .rready   (s_axi_rready),
  ); */
  s_axi s_axi_inst(/*AUTOINST*/
		   // Outputs
		   .awready		(s_axi_awready),	 // Templated
		   .wready		(s_axi_wready),		 // Templated
		   .bvalid		(s_axi_bvalid),		 // Templated
		   .bid			(s_axi_bid),		 // Templated
		   .bresp		(s_axi_bresp),		 // Templated
		   .buser		(s_axi_buser),		 // Templated
		   .arready		(s_axi_arready),	 // Templated
		   .rvalid		(s_axi_rvalid),		 // Templated
		   .rid			(s_axi_rid),		 // Templated
		   .rdata		(s_axi_rdata),		 // Templated
		   .rresp		(s_axi_rresp),		 // Templated
		   .rlast		(s_axi_rlast),		 // Templated
		   .ruser		(s_axi_ruser),		 // Templated
		   .mem_we		(mem_we),
		   .mem_addr		(mem_addr[MEMSIZE-1:0]),
		   .mem_wdata		(mem_wdata[DWIDTH-1:0]),
		   // Inputs
		   .clk			(s_axi_aclk),		 // Templated
		   .xrst		(s_axi_aresetn),	 // Templated
		   .awid		(s_axi_awid),		 // Templated
		   .awaddr		(s_axi_awaddr),		 // Templated
		   .awlen		(s_axi_awlen),		 // Templated
		   .awsize		(s_axi_awsize),		 // Templated
		   .awburst		(s_axi_awburst),	 // Templated
		   .awlock		(s_axi_awlock),		 // Templated
		   .awcache		(s_axi_awcache),	 // Templated
		   .awprot		(s_axi_awprot),		 // Templated
		   .awqos		(s_axi_awqos),		 // Templated
		   .awregion		(s_axi_awregion),	 // Templated
		   .awuser		(s_axi_awuser),		 // Templated
		   .awvalid		(s_axi_awvalid),	 // Templated
		   .wdata		(s_axi_wdata),		 // Templated
		   .wstrb		(s_axi_wstrb),		 // Templated
		   .wlast		(s_axi_wlast),		 // Templated
		   .wuser		(s_axi_wuser),		 // Templated
		   .wvalid		(s_axi_wvalid),		 // Templated
		   .bready		(s_axi_bready),		 // Templated
		   .arid		(s_axi_arid),		 // Templated
		   .araddr		(s_axi_araddr),		 // Templated
		   .arlen		(s_axi_arlen),		 // Templated
		   .arsize		(s_axi_arsize),		 // Templated
		   .arburst		(s_axi_arburst),	 // Templated
		   .arlock		(s_axi_arlock),		 // Templated
		   .arcache		(s_axi_arcache),	 // Templated
		   .arprot		(s_axi_arprot),		 // Templated
		   .arqos		(s_axi_arqos),		 // Templated
		   .arregion		(s_axi_arregion),	 // Templated
		   .aruser		(s_axi_aruser),		 // Templated
		   .arvalid		(s_axi_arvalid),	 // Templated
		   .rready		(s_axi_rready),		 // Templated
		   .mem_rdata		(mem_rdata[DWIDTH-1:0]));

  /* m_axi AUTO_TEMPLATE (
      .req      (port1),
      .ack      (port29),
      .err      (port28),
      .clk      (m_axi_aclk),
      .xrst     (m_axi_aresetn),
      .awid     (m_axi_awid),
      .awaddr   (m_axi_awaddr),
      .awlen    (m_axi_awlen),
      .awsize   (m_axi_awsize),
      .awburst  (m_axi_awburst),
      .awlock   (m_axi_awlock),
      .awcache  (m_axi_awcache),
      .awprot   (m_axi_awprot),
      .awqos    (m_axi_awqos),
      .awuser   (m_axi_awuser),
      .awvalid  (m_axi_awvalid),
      .awready  (m_axi_awready),
      .wdata    (m_axi_wdata),
      .wstrb    (m_axi_wstrb),
      .wlast    (m_axi_wlast),
      .wuser    (m_axi_wuser),
      .wvalid   (m_axi_wvalid),
      .wready   (m_axi_wready),
      .bid      (m_axi_bid),
      .bresp    (m_axi_bresp),
      .buser    (m_axi_buser),
      .bvalid   (m_axi_bvalid),
      .bready   (m_axi_bready),
      .arid     (m_axi_arid),
      .araddr   (m_axi_araddr),
      .arlen    (m_axi_arlen),
      .arsize   (m_axi_arsize),
      .arburst  (m_axi_arburst),
      .arlock   (m_axi_arlock),
      .arcache  (m_axi_arcache),
      .arprot   (m_axi_arprot),
      .arqos    (m_axi_arqos),
      .aruser   (m_axi_aruser),
      .arvalid  (m_axi_arvalid),
      .arready  (m_axi_arready),
      .rid      (m_axi_rid),
      .rdata    (m_axi_rdata),
      .rresp    (m_axi_rresp),
      .rlast    (m_axi_rlast),
      .ruser    (m_axi_ruser),
      .rvalid   (m_axi_rvalid),
      .rready   (m_axi_rready),
  ); */
  m_axi m_axi_inst(/*AUTOINST*/
		   // Outputs
		   .ack			(port29),		 // Templated
		   .err			(port28),		 // Templated
		   .awid		(m_axi_awid),		 // Templated
		   .awaddr		(m_axi_awaddr),		 // Templated
		   .awlen		(m_axi_awlen),		 // Templated
		   .awsize		(m_axi_awsize),		 // Templated
		   .awburst		(m_axi_awburst),	 // Templated
		   .awlock		(m_axi_awlock),		 // Templated
		   .awcache		(m_axi_awcache),	 // Templated
		   .awprot		(m_axi_awprot),		 // Templated
		   .awqos		(m_axi_awqos),		 // Templated
		   .awuser		(m_axi_awuser),		 // Templated
		   .awvalid		(m_axi_awvalid),	 // Templated
		   .wdata		(m_axi_wdata),		 // Templated
		   .wstrb		(m_axi_wstrb),		 // Templated
		   .wlast		(m_axi_wlast),		 // Templated
		   .wuser		(m_axi_wuser),		 // Templated
		   .wvalid		(m_axi_wvalid),		 // Templated
		   .bready		(m_axi_bready),		 // Templated
		   .arid		(m_axi_arid),		 // Templated
		   .araddr		(m_axi_araddr),		 // Templated
		   .arlen		(m_axi_arlen),		 // Templated
		   .arsize		(m_axi_arsize),		 // Templated
		   .arburst		(m_axi_arburst),	 // Templated
		   .arlock		(m_axi_arlock),		 // Templated
		   .arcache		(m_axi_arcache),	 // Templated
		   .arprot		(m_axi_arprot),		 // Templated
		   .arqos		(m_axi_arqos),		 // Templated
		   .aruser		(m_axi_aruser),		 // Templated
		   .arvalid		(m_axi_arvalid),	 // Templated
		   .rready		(m_axi_rready),		 // Templated
		   // Inputs
		   .clk			(m_axi_aclk),		 // Templated
		   .xrst		(m_axi_aresetn),	 // Templated
		   .req			(port1),		 // Templated
		   .awready		(m_axi_awready),	 // Templated
		   .wready		(m_axi_wready),		 // Templated
		   .bid			(m_axi_bid),		 // Templated
		   .bresp		(m_axi_bresp),		 // Templated
		   .buser		(m_axi_buser),		 // Templated
		   .bvalid		(m_axi_bvalid),		 // Templated
		   .arready		(m_axi_arready),	 // Templated
		   .rid			(m_axi_rid),		 // Templated
		   .rdata		(m_axi_rdata),		 // Templated
		   .rresp		(m_axi_rresp),		 // Templated
		   .rlast		(m_axi_rlast),		 // Templated
		   .ruser		(m_axi_ruser),		 // Templated
		   .rvalid		(m_axi_rvalid));		 // Templated

  /* s_axi_stream AUTO_TEMPLATE (
      .clk    (s_axi_stream_aclk),
      .xrst   (s_axi_stream_aresetn),
      .tready (s_axi_stream_tready),
      .tdata  (s_axi_stream_tdata),
      .tstrb  (s_axi_stream_tstrb),
      .tlast  (s_axi_stream_tlast),
      .tvalid (s_axi_stream_tvalid),
  ); */
  s_axi_stream s_axi_stream_inst(/*AUTOINST*/
				 // Outputs
				 .tready		(s_axi_stream_tready), // Templated
				 .buf_data		(buf_data[DWIDTH-1:0]),
				 // Inputs
				 .clk			(s_axi_stream_aclk), // Templated
				 .xrst			(s_axi_stream_aresetn), // Templated
				 .tvalid		(s_axi_stream_tvalid), // Templated
				 .tdata			(s_axi_stream_tdata), // Templated
				 .tstrb			(s_axi_stream_tstrb), // Templated
				 .tlast			(s_axi_stream_tlast), // Templated
				 .buf_re		(buf_re));

  /* m_axi_stream AUTO_TEMPLATE (
    .clk    (m_axi_stream_aclk),
    .xrst   (m_axi_stream_aresetn),
    .tvalid (m_axi_stream_tvalid),
    .tdata  (m_axi_stream_tdata),
    .tstrb  (m_axi_stream_tstrb),
    .tlast  (m_axi_stream_tlast),
    .tready (m_axi_stream_tready),
  ); */
  m_axi_stream m_axi_stream_inst(/*AUTOINST*/
				 // Outputs
				 .tvalid		(m_axi_stream_tvalid), // Templated
				 .tdata			(m_axi_stream_tdata), // Templated
				 .tstrb			(m_axi_stream_tstrb), // Templated
				 .tlast			(m_axi_stream_tlast), // Templated
				 // Inputs
				 .clk			(m_axi_stream_aclk), // Templated
				 .xrst			(m_axi_stream_aresetn), // Templated
				 .tready		(m_axi_stream_tready)); // Templated

endmodule

