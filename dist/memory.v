
module memory(/*AUTOARG*/
   // Outputs
   mem_rdata,
   // Inputs
   clk, xrst, mem_we, mem_addr, mem_wdata
   );
`include "parameters.vh"

  parameter WORDS = 2 ** MEMSIZE;

  /*AUTOINPUT*/
  input               clk;
  input               xrst;
  input               mem_we;
  input [MEMSIZE-1:0] mem_addr;
  input [DWIDTH-1:0]  mem_wdata;

  /*AUTOOUTPUT*/
  output [DWIDTH-1:0] mem_rdata;

  /*AUTOWIRE*/

  /*AUTOREG*/
  reg [DWIDTH-1:0]  mem [WORDS-1:0];
  reg [MEMSIZE-1:0] r_addr;

  assign mem_rdata = mem[r_addr];

  always @(posedge clk)
    if (mem_we)
      mem[mem_addr] <= mem_wdata;

  always @(posedge clk)
    if (!xrst)
      r_addr <= 0;
    else
      r_addr <= mem_addr;

endmodule

