/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.  
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include <time.h>

#include "xil_io.h"
#include "xil_printf.h"

#define port(n) (XPAR_AXI_TOP_0_BASEADDR + 4*n)

volatile u32 *mem = (volatile u32 *)0x43C00000;
static u32 mem_we = 0;
static u32 mem_addr = 0;
static u32 mem_wdata = 0;
static u32 mem_rdata = 0;

void proc(int t)
{
  switch (t) {
    case 0:
      Xil_Out32(port(0), 0x1);
      break;

    case 1:
      Xil_Out32(port(0), 0x0);
      break;

    case 2:
      mem_we = 0;
      mem_addr = 2;
      mem_wdata = 5;
      Xil_Out32(port(1), 0x1);
      break;

    case 3:
      mem_we = 1;
      Xil_Out32(port(1), 0x0);
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
      printf("port%1d:  %8x,  ", i, Xil_In32(port(i)));
    else
      printf("port%2d: %8x,  ", i, Xil_In32(port(i)));
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

int main()
{
  int t = 0;
  int n = 0;

  for (n = 1; n <= 100000; n++) {
    n * n + n * n + n * n;
  }

  for (n = 1; n <= 20; n++) {
    for (t = 0; t < 16; t++)
      Xil_Out32(port(t), n*t);

    for (t = 16; t < 32; t++)
      printf("port%d: %d\n", t, Xil_In32(port(t)));
  }
  // init_port();
  // setbuf(stdout, NULL);
  // printf("\033[2J");
  //
  // puts("### start ######################################################################");
  //
  // while (1) {
  //   proc(t);
  //
  //   printf("time: %5d\n", t);
  //   print_reg();
  //   print_mem();
  //   print_buf(0x0);
  //
  //   // n = getchar();
  //   // if (t != 0 && n != 13)
  //   //   break;
  //   puts("################################################################################");
  //
  //   t = t + 1;
  // }
  //
  // puts("###  end  ######################################################################");

  return 0;
}
