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
*
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
#include "platform.h"
#include "xil_printf.h"

#include "time.h"
#include "xil_io.h"
#define port(n) (XPAR_AXI_TOP_0_BASEADDR + 4*n)

static u32 mem[1024] = {0};

void proc(void)
{
  // printf("input your number: \n");
  // scanf("%d", &n);
  // printf("number is: %d\n", n);

  Xil_Out32(port(0), 0x1);
  Xil_Out32(port(1), 0x1);
}

void init_port(void)
{
  int i;

  for (i = 0; i < 32; i++)
    Xil_Out32(port(i), 0x0);
}

void print_port(void)
{
  int i;

  printf("port: {\n");
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

void print_mem(u32 *mem, u32 we, u32 addr, u32 wdata)
{
  printf("mem: {\n");
  printf("    mem_we:    %8x,\n", we);
  printf("    mem_addr:  %8x,\n", addr);
  printf("    mem_wdata: %8x,\n", wdata);
  printf("    mem_rdata: %8x,\n", mem[addr]);
  printf("}\n");
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
  char str[30];

  init_platform();
  init_port();
  setbuf(stdout, NULL);
  printf("\033[2J");

  printf("---------- start ----------\n");

  proc();

  do {
    printf("\033[2J");

    printf("time: %d\n", t);
    print_port();
    print_mem(&mem, 0x0, 0x0, 0x0);
    print_buf(0x0);
    sleep(2);

    n = getchar();
    t = t + 1;
  } while (n != EOF);

  printf("---------- end ----------\n");

  cleanup_platform();
  return 0;
}
