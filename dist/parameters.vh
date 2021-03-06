
parameter STEP    = 10;
parameter DWIDTH  = 32;

parameter REGSIZE = 5;
parameter MEMSIZE = 10;
parameter BUFSIZE = 7;

parameter ID_WIDTH = 12;

parameter LSB = DWIDTH/32 + 1;
parameter REG_WIDTH = REGSIZE + LSB;
parameter MEM_WIDTH = MEMSIZE + LSB;

parameter AWUSER_WIDTH = 0;
parameter ARUSER_WIDTH = 0;
parameter WUSER_WIDTH  = 0;
parameter RUSER_WIDTH  = 0;
parameter BUSER_WIDTH  = 0;

parameter DDR_BASEADDR = 1073741824;
parameter DDR_OFFSET   = 4096;

function integer clogb2 (input integer bit_depth);
  begin
    for(clogb2=0; bit_depth>0; clogb2=clogb2+1)
      bit_depth = bit_depth >> 1;
  end
endfunction

