
module buffer(/*AUTOARG*/
   // Outputs
   buf_isempty, buf_isfull, buf_rdata, probe1,
   // Inputs
   clk, xrst, buf_we, buf_re, buf_wdata, probe0
   );
`include "parameters.vh"

  parameter WORDS = 2 ** BUFSIZE;

  /*AUTOINPUT*/
  input clk;
  input xrst;
  input buf_we;
  input buf_re;
  input [DWIDTH-1:0] buf_wdata;
  input [BUFSIZE-1:0]  probe0;

  /*AUTOOUTPUT*/
  output                buf_isempty;
  output                buf_isfull;
  output [DWIDTH-1:0]   buf_rdata;
  output [DWIDTH-1:0]  probe1;

  /*AUTOWIRE*/
  wire we_pulse;

  /*AUTOREG*/
  reg [DWIDTH-1:0]  mem [WORDS-1:0];
  reg [BUFSIZE-1:0] r_wptr;
  reg [BUFSIZE-1:0] r_rptr;
  reg               r_re;

  assign probe1 = mem[probe0];

  assign re_pulse = buf_re && !r_re;

  always @(posedge clk)
    if (!xrst)
      r_re <= 0;
    else
      r_re <= buf_re;

  assign buf_isempty = r_wptr == r_rptr;
  assign buf_isfull  = r_wptr < r_rptr ? r_wptr == r_rptr - 1
                     : r_rptr < r_wptr ? r_wptr == WORDS - 1 && r_rptr == 0
                     : 0;

  assign buf_rdata = mem[r_rptr];

  always @(posedge clk)
    if (buf_we)
      mem[r_wptr] <= buf_wdata;

  integer i;
  initial
    for (i = 0; i < WORDS; i = i+1)
      mem[i] = 0;

  always @(posedge clk)
    if (!xrst)
      r_wptr <= 0;
    else if (buf_we && !buf_isfull) begin
      if (r_wptr == WORDS - 1)
        r_wptr <= 0;
      else
        r_wptr <= r_wptr + 1;
    end

  always @(posedge clk)
    if (!xrst)
      r_rptr <= 0;
    else if (re_pulse && !buf_isempty) begin
      if (r_rptr == WORDS - 1)
        r_rptr <= 0;
      else
        r_rptr <= r_rptr + 1;
    end

endmodule

