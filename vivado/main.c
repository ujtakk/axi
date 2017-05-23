#include <stdio.h>
#include <time.h>

#include "xil_io.h"
#include "xil_printf.h"

#define port(n) (XPAR_AXI_TOP_0_BASEADDR + 4*n)
#define TIME 10

volatile u32 *mem = (volatile u32 *)0x43C00000;
static u32 mem_we    = 0;
static u32 mem_addr  = 0;
static u32 mem_wdata = 0;
static u32 mem_rdata = 0;

void proc(int t)
{
  switch (t) {
    case 0:
      mem_we = 0;
      mem_addr = 2;
      mem_wdata = 5;
      break;

    case 1:
      mem_we = 1;
      break;

    case 2:
      mem_we = 0;
      break;

    default:
      break;
  }
}

void init_port(void)
{
  int i;

  for (i = 0; i < 32; i++)
    Xil_Out32(port(i), 0x0);
}

void print_reg(void)
{
  int i;

  printf("reg: {\n");
  for (i = 0; i < 32; i++) {
    if (i % 4 == 0) printf("    ");
    if (i < 10)
      printf("port%1d:  %8x, ", i, Xil_In32(port(i)));
    else
      printf("port%2d: %8x, ", i, Xil_In32(port(i)));
    if (i % 4 == 3) printf("\n");
  }
  printf("}\n");
}

void print_mem(void)
{
  mem_rdata = mem[mem_addr];

  printf("mem: {\n");
  printf("    mem_we:    %8x,\n", mem_we);
  printf("    mem_addr:  %8x,\n", mem_addr);
  printf("    mem_wdata: %8x,\n", mem_wdata);
  printf("    mem_rdata: %8x,\n", mem_rdata);
  printf("}\n");

  if (mem_we)
    mem[mem_addr] = mem_wdata;
}

void print_buf(u32 re)
{
  printf("buf: {\n");
  printf("    buf_re:   %8x,\n", re);
  printf("    buf_data: %8x,\n", 0x0);
  printf("}\n");
}

void bulk_transfer(void)
{
  int n, t, i;

  for (n = 1; n <= 20; n++) {
    for (t = 0; t < 16; t++)
      Xil_Out32(port(t), n*t);

    for (t = 16; t < 32; t++)
      i = Xil_In32(port(t));
  }
}

int main(void)
{
  int t = 0;
  int n = 0;

  init_port();
  setbuf(stdout, NULL);
  printf("\033[2J");

  puts("### start ##################################################");

  while (t < TIME) {
    proc(t);

    printf("time: %5d\n", t);
    print_reg();
    print_mem();
    print_buf(0x0);

    // n = getchar();
    // if (t != 0 && n != 13)
    //   break;
    puts("############################################################");

    t = t + 1;
  }

  puts("###  end  ##################################################");

  return 0;
}
