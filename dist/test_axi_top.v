
`timescale 1 ns / 1 ps

module test_axi_top;
`include "parameters.vh"

  /*AUTOREGINPUT*/
  // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
  reg			m_axi_aclk;		// To dut0 of axi_top.v
  reg			m_axi_aresetn;		// To dut0 of axi_top.v
  reg			m_axi_arready;		// To dut0 of axi_top.v
  reg			m_axi_awready;		// To dut0 of axi_top.v
  reg [ID_WIDTH-1:0]	m_axi_bid;		// To dut0 of axi_top.v
  reg [1:0]		m_axi_bresp;		// To dut0 of axi_top.v
  reg [BUSER_WIDTH-1:0]	m_axi_buser;		// To dut0 of axi_top.v
  reg			m_axi_bvalid;		// To dut0 of axi_top.v
  reg			m_axi_lite_aclk;	// To dut0 of axi_top.v
  reg			m_axi_lite_aresetn;	// To dut0 of axi_top.v
  reg			m_axi_lite_arready;	// To dut0 of axi_top.v
  reg			m_axi_lite_awready;	// To dut0 of axi_top.v
  reg [1:0]		m_axi_lite_bresp;	// To dut0 of axi_top.v
  reg			m_axi_lite_bvalid;	// To dut0 of axi_top.v
  reg [DWIDTH-1:0]	m_axi_lite_rdata;	// To dut0 of axi_top.v
  reg [1:0]		m_axi_lite_rresp;	// To dut0 of axi_top.v
  reg			m_axi_lite_rvalid;	// To dut0 of axi_top.v
  reg			m_axi_lite_wready;	// To dut0 of axi_top.v
  reg [DWIDTH-1:0]	m_axi_rdata;		// To dut0 of axi_top.v
  reg [ID_WIDTH-1:0]	m_axi_rid;		// To dut0 of axi_top.v
  reg			m_axi_rlast;		// To dut0 of axi_top.v
  reg [1:0]		m_axi_rresp;		// To dut0 of axi_top.v
  reg [RUSER_WIDTH-1:0]	m_axi_ruser;		// To dut0 of axi_top.v
  reg			m_axi_rvalid;		// To dut0 of axi_top.v
  reg			m_axi_stream_aclk;	// To dut0 of axi_top.v
  reg			m_axi_stream_aresetn;	// To dut0 of axi_top.v
  reg			m_axi_stream_tready;	// To dut0 of axi_top.v
  reg			m_axi_wready;		// To dut0 of axi_top.v
  reg			s_axi_aclk;		// To dut0 of axi_top.v
  reg [MEM_WIDTH-1:0]	s_axi_araddr;		// To dut0 of axi_top.v
  reg [1:0]		s_axi_arburst;		// To dut0 of axi_top.v
  reg [3:0]		s_axi_arcache;		// To dut0 of axi_top.v
  reg			s_axi_aresetn;		// To dut0 of axi_top.v
  reg [ID_WIDTH-1:0]	s_axi_arid;		// To dut0 of axi_top.v
  reg [7:0]		s_axi_arlen;		// To dut0 of axi_top.v
  reg			s_axi_arlock;		// To dut0 of axi_top.v
  reg [2:0]		s_axi_arprot;		// To dut0 of axi_top.v
  reg [3:0]		s_axi_arqos;		// To dut0 of axi_top.v
  reg [3:0]		s_axi_arregion;		// To dut0 of axi_top.v
  reg [2:0]		s_axi_arsize;		// To dut0 of axi_top.v
  reg [ARUSER_WIDTH-1:0] s_axi_aruser;		// To dut0 of axi_top.v
  reg			s_axi_arvalid;		// To dut0 of axi_top.v
  reg [MEM_WIDTH-1:0]	s_axi_awaddr;		// To dut0 of axi_top.v
  reg [1:0]		s_axi_awburst;		// To dut0 of axi_top.v
  reg [3:0]		s_axi_awcache;		// To dut0 of axi_top.v
  reg [ID_WIDTH-1:0]	s_axi_awid;		// To dut0 of axi_top.v
  reg [7:0]		s_axi_awlen;		// To dut0 of axi_top.v
  reg			s_axi_awlock;		// To dut0 of axi_top.v
  reg [2:0]		s_axi_awprot;		// To dut0 of axi_top.v
  reg [3:0]		s_axi_awqos;		// To dut0 of axi_top.v
  reg [3:0]		s_axi_awregion;		// To dut0 of axi_top.v
  reg [2:0]		s_axi_awsize;		// To dut0 of axi_top.v
  reg [AWUSER_WIDTH-1:0] s_axi_awuser;		// To dut0 of axi_top.v
  reg			s_axi_awvalid;		// To dut0 of axi_top.v
  reg			s_axi_bready;		// To dut0 of axi_top.v
  reg			s_axi_lite_aclk;	// To dut0 of axi_top.v
  reg [REG_WIDTH-1:0]	s_axi_lite_araddr;	// To dut0 of axi_top.v
  reg			s_axi_lite_aresetn;	// To dut0 of axi_top.v
  reg [2:0]		s_axi_lite_arprot;	// To dut0 of axi_top.v
  reg			s_axi_lite_arvalid;	// To dut0 of axi_top.v
  reg [REG_WIDTH-1:0]	s_axi_lite_awaddr;	// To dut0 of axi_top.v
  reg [2:0]		s_axi_lite_awprot;	// To dut0 of axi_top.v
  reg			s_axi_lite_awvalid;	// To dut0 of axi_top.v
  reg			s_axi_lite_bready;	// To dut0 of axi_top.v
  reg			s_axi_lite_rready;	// To dut0 of axi_top.v
  reg [DWIDTH-1:0]	s_axi_lite_wdata;	// To dut0 of axi_top.v
  reg [DWIDTH/8-1:0]	s_axi_lite_wstrb;	// To dut0 of axi_top.v
  reg			s_axi_lite_wvalid;	// To dut0 of axi_top.v
  reg			s_axi_rready;		// To dut0 of axi_top.v
  reg			s_axi_stream_aclk;	// To dut0 of axi_top.v
  reg			s_axi_stream_aresetn;	// To dut0 of axi_top.v
  reg [DWIDTH-1:0]	s_axi_stream_tdata;	// To dut0 of axi_top.v
  reg			s_axi_stream_tlast;	// To dut0 of axi_top.v
  reg [DWIDTH/8-1:0]	s_axi_stream_tstrb;	// To dut0 of axi_top.v
  reg			s_axi_stream_tvalid;	// To dut0 of axi_top.v
  reg [DWIDTH-1:0]	s_axi_wdata;		// To dut0 of axi_top.v
  reg			s_axi_wlast;		// To dut0 of axi_top.v
  reg [DWIDTH/8-1:0]	s_axi_wstrb;		// To dut0 of axi_top.v
  reg [WUSER_WIDTH-1:0]	s_axi_wuser;		// To dut0 of axi_top.v
  reg			s_axi_wvalid;		// To dut0 of axi_top.v
  // End of automatics
  reg clk;
  reg xrst;

  /*AUTOWIRE*/
  // Beginning of automatic wires (for undeclared instantiated-module outputs)
  wire [MEM_WIDTH-1:0]	m_axi_araddr;		// From dut0 of axi_top.v
  wire [1:0]		m_axi_arburst;		// From dut0 of axi_top.v
  wire [3:0]		m_axi_arcache;		// From dut0 of axi_top.v
  wire [ID_WIDTH-1:0]	m_axi_arid;		// From dut0 of axi_top.v
  wire [7:0]		m_axi_arlen;		// From dut0 of axi_top.v
  wire			m_axi_arlock;		// From dut0 of axi_top.v
  wire [2:0]		m_axi_arprot;		// From dut0 of axi_top.v
  wire [3:0]		m_axi_arqos;		// From dut0 of axi_top.v
  wire [2:0]		m_axi_arsize;		// From dut0 of axi_top.v
  wire [ARUSER_WIDTH-1:0] m_axi_aruser;		// From dut0 of axi_top.v
  wire			m_axi_arvalid;		// From dut0 of axi_top.v
  wire [MEM_WIDTH-1:0]	m_axi_awaddr;		// From dut0 of axi_top.v
  wire [1:0]		m_axi_awburst;		// From dut0 of axi_top.v
  wire [3:0]		m_axi_awcache;		// From dut0 of axi_top.v
  wire [ID_WIDTH-1:0]	m_axi_awid;		// From dut0 of axi_top.v
  wire [7:0]		m_axi_awlen;		// From dut0 of axi_top.v
  wire			m_axi_awlock;		// From dut0 of axi_top.v
  wire [2:0]		m_axi_awprot;		// From dut0 of axi_top.v
  wire [3:0]		m_axi_awqos;		// From dut0 of axi_top.v
  wire [2:0]		m_axi_awsize;		// From dut0 of axi_top.v
  wire [AWUSER_WIDTH-1:0] m_axi_awuser;		// From dut0 of axi_top.v
  wire			m_axi_awvalid;		// From dut0 of axi_top.v
  wire			m_axi_bready;		// From dut0 of axi_top.v
  wire [REG_WIDTH-1:0]	m_axi_lite_araddr;	// From dut0 of axi_top.v
  wire [2:0]		m_axi_lite_arprot;	// From dut0 of axi_top.v
  wire			m_axi_lite_arvalid;	// From dut0 of axi_top.v
  wire [REG_WIDTH-1:0]	m_axi_lite_awaddr;	// From dut0 of axi_top.v
  wire [2:0]		m_axi_lite_awprot;	// From dut0 of axi_top.v
  wire			m_axi_lite_awvalid;	// From dut0 of axi_top.v
  wire			m_axi_lite_bready;	// From dut0 of axi_top.v
  wire			m_axi_lite_rready;	// From dut0 of axi_top.v
  wire [DWIDTH-1:0]	m_axi_lite_wdata;	// From dut0 of axi_top.v
  wire [DWIDTH/8-1:0]	m_axi_lite_wstrb;	// From dut0 of axi_top.v
  wire			m_axi_lite_wvalid;	// From dut0 of axi_top.v
  wire			m_axi_rready;		// From dut0 of axi_top.v
  wire [DWIDTH-1:0]	m_axi_stream_tdata;	// From dut0 of axi_top.v
  wire			m_axi_stream_tlast;	// From dut0 of axi_top.v
  wire [DWIDTH/8-1:0]	m_axi_stream_tstrb;	// From dut0 of axi_top.v
  wire			m_axi_stream_tvalid;	// From dut0 of axi_top.v
  wire [DWIDTH-1:0]	m_axi_wdata;		// From dut0 of axi_top.v
  wire			m_axi_wlast;		// From dut0 of axi_top.v
  wire [DWIDTH/8-1:0]	m_axi_wstrb;		// From dut0 of axi_top.v
  wire [WUSER_WIDTH-1:0] m_axi_wuser;		// From dut0 of axi_top.v
  wire			m_axi_wvalid;		// From dut0 of axi_top.v
  wire			s_axi_arready;		// From dut0 of axi_top.v
  wire			s_axi_awready;		// From dut0 of axi_top.v
  wire [ID_WIDTH-1:0]	s_axi_bid;		// From dut0 of axi_top.v
  wire [1:0]		s_axi_bresp;		// From dut0 of axi_top.v
  wire [BUSER_WIDTH-1:0] s_axi_buser;		// From dut0 of axi_top.v
  wire			s_axi_bvalid;		// From dut0 of axi_top.v
  wire			s_axi_lite_arready;	// From dut0 of axi_top.v
  wire			s_axi_lite_awready;	// From dut0 of axi_top.v
  wire [1:0]		s_axi_lite_bresp;	// From dut0 of axi_top.v
  wire			s_axi_lite_bvalid;	// From dut0 of axi_top.v
  wire [DWIDTH-1:0]	s_axi_lite_rdata;	// From dut0 of axi_top.v
  wire [1:0]		s_axi_lite_rresp;	// From dut0 of axi_top.v
  wire			s_axi_lite_rvalid;	// From dut0 of axi_top.v
  wire			s_axi_lite_wready;	// From dut0 of axi_top.v
  wire [DWIDTH-1:0]	s_axi_rdata;		// From dut0 of axi_top.v
  wire [ID_WIDTH-1:0]	s_axi_rid;		// From dut0 of axi_top.v
  wire			s_axi_rlast;		// From dut0 of axi_top.v
  wire [1:0]		s_axi_rresp;		// From dut0 of axi_top.v
  wire [RUSER_WIDTH-1:0] s_axi_ruser;		// From dut0 of axi_top.v
  wire			s_axi_rvalid;		// From dut0 of axi_top.v
  wire			s_axi_stream_tready;	// From dut0 of axi_top.v
  wire			s_axi_wready;		// From dut0 of axi_top.v
  // End of automatics

  //clock
  always begin
    clk = 0;
    #(STEP/2);
    clk = 1;
    #(STEP/2);
  end

  always begin
    s_axi_lite_aclk    = clk;
    m_axi_lite_aclk    = clk;
    s_axi_aclk         = clk;
    m_axi_aclk         = clk;
    s_axi_stream_aclk  = clk;
    m_axi_stream_aclk  = clk;

    s_axi_lite_aresetn   = xrst;
    m_axi_lite_aresetn   = xrst;
    s_axi_aresetn        = xrst;
    m_axi_aresetn        = xrst;
    s_axi_stream_aresetn = xrst;
    m_axi_stream_aresetn = xrst;
  end

  //flow
  initial begin

    $finish();
  end

  axi_top dut0(/*AUTOINST*/
	       // Outputs
	       .s_axi_lite_awready	(s_axi_lite_awready),
	       .s_axi_lite_wready	(s_axi_lite_wready),
	       .s_axi_lite_bresp	(s_axi_lite_bresp[1:0]),
	       .s_axi_lite_bvalid	(s_axi_lite_bvalid),
	       .s_axi_lite_arready	(s_axi_lite_arready),
	       .s_axi_lite_rdata	(s_axi_lite_rdata[DWIDTH-1:0]),
	       .s_axi_lite_rresp	(s_axi_lite_rresp[1:0]),
	       .s_axi_lite_rvalid	(s_axi_lite_rvalid),
	       .m_axi_lite_awaddr	(m_axi_lite_awaddr[REG_WIDTH-1:0]),
	       .m_axi_lite_awprot	(m_axi_lite_awprot[2:0]),
	       .m_axi_lite_awvalid	(m_axi_lite_awvalid),
	       .m_axi_lite_wdata	(m_axi_lite_wdata[DWIDTH-1:0]),
	       .m_axi_lite_wstrb	(m_axi_lite_wstrb[DWIDTH/8-1:0]),
	       .m_axi_lite_wvalid	(m_axi_lite_wvalid),
	       .m_axi_lite_bready	(m_axi_lite_bready),
	       .m_axi_lite_araddr	(m_axi_lite_araddr[REG_WIDTH-1:0]),
	       .m_axi_lite_arprot	(m_axi_lite_arprot[2:0]),
	       .m_axi_lite_arvalid	(m_axi_lite_arvalid),
	       .m_axi_lite_rready	(m_axi_lite_rready),
	       .s_axi_awready		(s_axi_awready),
	       .s_axi_wready		(s_axi_wready),
	       .s_axi_bid		(s_axi_bid[ID_WIDTH-1:0]),
	       .s_axi_bresp		(s_axi_bresp[1:0]),
	       .s_axi_buser		(s_axi_buser[BUSER_WIDTH-1:0]),
	       .s_axi_bvalid		(s_axi_bvalid),
	       .s_axi_arready		(s_axi_arready),
	       .s_axi_rid		(s_axi_rid[ID_WIDTH-1:0]),
	       .s_axi_rdata		(s_axi_rdata[DWIDTH-1:0]),
	       .s_axi_rresp		(s_axi_rresp[1:0]),
	       .s_axi_rlast		(s_axi_rlast),
	       .s_axi_ruser		(s_axi_ruser[RUSER_WIDTH-1:0]),
	       .s_axi_rvalid		(s_axi_rvalid),
	       .m_axi_awid		(m_axi_awid[ID_WIDTH-1:0]),
	       .m_axi_awaddr		(m_axi_awaddr[MEM_WIDTH-1:0]),
	       .m_axi_awlen		(m_axi_awlen[7:0]),
	       .m_axi_awsize		(m_axi_awsize[2:0]),
	       .m_axi_awburst		(m_axi_awburst[1:0]),
	       .m_axi_awlock		(m_axi_awlock),
	       .m_axi_awcache		(m_axi_awcache[3:0]),
	       .m_axi_awprot		(m_axi_awprot[2:0]),
	       .m_axi_awqos		(m_axi_awqos[3:0]),
	       .m_axi_awuser		(m_axi_awuser[AWUSER_WIDTH-1:0]),
	       .m_axi_awvalid		(m_axi_awvalid),
	       .m_axi_wdata		(m_axi_wdata[DWIDTH-1:0]),
	       .m_axi_wstrb		(m_axi_wstrb[DWIDTH/8-1:0]),
	       .m_axi_wlast		(m_axi_wlast),
	       .m_axi_wuser		(m_axi_wuser[WUSER_WIDTH-1:0]),
	       .m_axi_wvalid		(m_axi_wvalid),
	       .m_axi_bready		(m_axi_bready),
	       .m_axi_arid		(m_axi_arid[ID_WIDTH-1:0]),
	       .m_axi_araddr		(m_axi_araddr[MEM_WIDTH-1:0]),
	       .m_axi_arlen		(m_axi_arlen[7:0]),
	       .m_axi_arsize		(m_axi_arsize[2:0]),
	       .m_axi_arburst		(m_axi_arburst[1:0]),
	       .m_axi_arlock		(m_axi_arlock),
	       .m_axi_arcache		(m_axi_arcache[3:0]),
	       .m_axi_arprot		(m_axi_arprot[2:0]),
	       .m_axi_arqos		(m_axi_arqos[3:0]),
	       .m_axi_aruser		(m_axi_aruser[ARUSER_WIDTH-1:0]),
	       .m_axi_arvalid		(m_axi_arvalid),
	       .m_axi_rready		(m_axi_rready),
	       .s_axi_stream_tready	(s_axi_stream_tready),
	       .m_axi_stream_tvalid	(m_axi_stream_tvalid),
	       .m_axi_stream_tdata	(m_axi_stream_tdata[DWIDTH-1:0]),
	       .m_axi_stream_tstrb	(m_axi_stream_tstrb[DWIDTH/8-1:0]),
	       .m_axi_stream_tlast	(m_axi_stream_tlast),
	       // Inputs
	       .s_axi_lite_aclk		(s_axi_lite_aclk),
	       .s_axi_lite_aresetn	(s_axi_lite_aresetn),
	       .s_axi_lite_awaddr	(s_axi_lite_awaddr[REG_WIDTH-1:0]),
	       .s_axi_lite_awprot	(s_axi_lite_awprot[2:0]),
	       .s_axi_lite_awvalid	(s_axi_lite_awvalid),
	       .s_axi_lite_wdata	(s_axi_lite_wdata[DWIDTH-1:0]),
	       .s_axi_lite_wstrb	(s_axi_lite_wstrb[DWIDTH/8-1:0]),
	       .s_axi_lite_wvalid	(s_axi_lite_wvalid),
	       .s_axi_lite_bready	(s_axi_lite_bready),
	       .s_axi_lite_araddr	(s_axi_lite_araddr[REG_WIDTH-1:0]),
	       .s_axi_lite_arprot	(s_axi_lite_arprot[2:0]),
	       .s_axi_lite_arvalid	(s_axi_lite_arvalid),
	       .s_axi_lite_rready	(s_axi_lite_rready),
	       .m_axi_lite_aclk		(m_axi_lite_aclk),
	       .m_axi_lite_aresetn	(m_axi_lite_aresetn),
	       .m_axi_lite_awready	(m_axi_lite_awready),
	       .m_axi_lite_wready	(m_axi_lite_wready),
	       .m_axi_lite_bresp	(m_axi_lite_bresp[1:0]),
	       .m_axi_lite_bvalid	(m_axi_lite_bvalid),
	       .m_axi_lite_arready	(m_axi_lite_arready),
	       .m_axi_lite_rdata	(m_axi_lite_rdata[DWIDTH-1:0]),
	       .m_axi_lite_rresp	(m_axi_lite_rresp[1:0]),
	       .m_axi_lite_rvalid	(m_axi_lite_rvalid),
	       .s_axi_aclk		(s_axi_aclk),
	       .s_axi_aresetn		(s_axi_aresetn),
	       .s_axi_awid		(s_axi_awid[ID_WIDTH-1:0]),
	       .s_axi_awaddr		(s_axi_awaddr[MEM_WIDTH-1:0]),
	       .s_axi_awlen		(s_axi_awlen[7:0]),
	       .s_axi_awsize		(s_axi_awsize[2:0]),
	       .s_axi_awburst		(s_axi_awburst[1:0]),
	       .s_axi_awlock		(s_axi_awlock),
	       .s_axi_awcache		(s_axi_awcache[3:0]),
	       .s_axi_awprot		(s_axi_awprot[2:0]),
	       .s_axi_awqos		(s_axi_awqos[3:0]),
	       .s_axi_awregion		(s_axi_awregion[3:0]),
	       .s_axi_awuser		(s_axi_awuser[AWUSER_WIDTH-1:0]),
	       .s_axi_awvalid		(s_axi_awvalid),
	       .s_axi_wdata		(s_axi_wdata[DWIDTH-1:0]),
	       .s_axi_wstrb		(s_axi_wstrb[DWIDTH/8-1:0]),
	       .s_axi_wlast		(s_axi_wlast),
	       .s_axi_wuser		(s_axi_wuser[WUSER_WIDTH-1:0]),
	       .s_axi_wvalid		(s_axi_wvalid),
	       .s_axi_bready		(s_axi_bready),
	       .s_axi_arid		(s_axi_arid[ID_WIDTH-1:0]),
	       .s_axi_araddr		(s_axi_araddr[MEM_WIDTH-1:0]),
	       .s_axi_arlen		(s_axi_arlen[7:0]),
	       .s_axi_arsize		(s_axi_arsize[2:0]),
	       .s_axi_arburst		(s_axi_arburst[1:0]),
	       .s_axi_arlock		(s_axi_arlock),
	       .s_axi_arcache		(s_axi_arcache[3:0]),
	       .s_axi_arprot		(s_axi_arprot[2:0]),
	       .s_axi_arqos		(s_axi_arqos[3:0]),
	       .s_axi_arregion		(s_axi_arregion[3:0]),
	       .s_axi_aruser		(s_axi_aruser[ARUSER_WIDTH-1:0]),
	       .s_axi_arvalid		(s_axi_arvalid),
	       .s_axi_rready		(s_axi_rready),
	       .m_axi_aclk		(m_axi_aclk),
	       .m_axi_aresetn		(m_axi_aresetn),
	       .m_axi_awready		(m_axi_awready),
	       .m_axi_wready		(m_axi_wready),
	       .m_axi_bid		(m_axi_bid[ID_WIDTH-1:0]),
	       .m_axi_bresp		(m_axi_bresp[1:0]),
	       .m_axi_buser		(m_axi_buser[BUSER_WIDTH-1:0]),
	       .m_axi_bvalid		(m_axi_bvalid),
	       .m_axi_arready		(m_axi_arready),
	       .m_axi_rid		(m_axi_rid[ID_WIDTH-1:0]),
	       .m_axi_rdata		(m_axi_rdata[DWIDTH-1:0]),
	       .m_axi_rresp		(m_axi_rresp[1:0]),
	       .m_axi_rlast		(m_axi_rlast),
	       .m_axi_ruser		(m_axi_ruser[RUSER_WIDTH-1:0]),
	       .m_axi_rvalid		(m_axi_rvalid),
	       .s_axi_stream_aclk	(s_axi_stream_aclk),
	       .s_axi_stream_aresetn	(s_axi_stream_aresetn),
	       .s_axi_stream_tdata	(s_axi_stream_tdata[DWIDTH-1:0]),
	       .s_axi_stream_tstrb	(s_axi_stream_tstrb[DWIDTH/8-1:0]),
	       .s_axi_stream_tlast	(s_axi_stream_tlast),
	       .s_axi_stream_tvalid	(s_axi_stream_tvalid),
	       .m_axi_stream_aclk	(m_axi_stream_aclk),
	       .m_axi_stream_aresetn	(m_axi_stream_aresetn),
	       .m_axi_stream_tready	(m_axi_stream_tready));

  //display
  always begin
    #(STEP/2-1);
    $display(
      "%d: ", $time/STEP,
      "| ",
    );
    #(STEP/2+1);
  end

endmodule

// Local Variables:
// verilog-library-directories:("." "..")
// End:
