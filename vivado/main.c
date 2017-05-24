#define REGSIZE 5
#define MEMSIZE 10
#define BUFSIZE 7

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "xil_io.h"
#include "xil_printf.h"

#define REG_WIDTH (1 << REGSIZE)
#define MEM_WIDTH (1 << MEMSIZE)
#define BUF_WIDTH (1 << BUFSIZE)

#define port(n) (XPAR_AXI_TOP_0_BASEADDR + 4*(n))
static u32 *_port = (u32 *)0x43C10000;
static u32 *mem = (u32 *)0x43C00000;
static u32 mem_we    = 0;
static u32 mem_addr  = 0;
static u32 mem_wdata = 0;
static u32 mem_rdata = 0;

#define assert_eq(a, b) do {                                  \
  if ((a) != (b)) {                                           \
    printf("Assertion failed: %s == %s, file %s, line %d\n",  \
      #a, #b, __FILE__, __LINE__);                            \
    printf("\t%s == %lx, %s == %lx\n", #a, (a), #b, (b));     \
    printf("%s: FAIL\n", __func__);                           \
    return EXIT_FAILURE;                                      \
  }                                                           \
} while (0)

#define test_return() do {          \
  printf("%s: PASS\n", __func__);   \
  return EXIT_SUCCESS;              \
} while (0)

typedef int test;

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

void init_reg(void)
{
  int i;

  for (i = 0; i < 32; i++)
    Xil_Out32(port(i), 0x0);
}

void init_mem(void)
{
  memset(mem, 0, sizeof(u32)*MEM_WIDTH);
}

void print_reg(void)
{
  int i;

  printf("reg: {\n");
  for (i = 0; i < 32; i++) {
    if (i % 4 == 0) printf("    ");
    if (i < 10)
      printf("port%1d:  %8lx, ", i, Xil_In32(port(i)));
    else
      printf("port%2d: %8lx, ", i, Xil_In32(port(i)));
    if (i % 4 == 3) printf("\n");
  }
  printf("}\n");
}

void print_mem(void)
{
  mem_rdata = mem[mem_addr];

  printf("mem: {\n");
  printf("    mem_we:    %8lx,\n", mem_we);
  printf("    mem_addr:  %8lx,\n", mem_addr);
  printf("    mem_wdata: %8lx,\n", mem_wdata);
  printf("    mem_rdata: %8lx,\n", mem_rdata);
  printf("}\n");

  if (mem_we)
    mem[mem_addr] = mem_wdata;
}

void print_buf(u32 re)
{
  printf("buf: {\n");
  printf("    buf_re:   %8lx,\n", re);
  printf("    buf_data: %8lx,\n", (u32)0x0);
  printf("}\n");
}

void probe(void)
{
  const int TIME = 10;
  int t = 0;
  /* int n = 0; */

  while (t < TIME) {
    proc(t);

    printf("time: %5d\n", t);
    print_reg();
    print_mem();
    print_buf(0x0);

    // n = getchar();
    // if (t != 0 && n != 13)
    // if (t == TIME - 1)
    //   break;
    puts("############################################################");

    t = t + 1;
  }
}

test test_s_axi_lite(void)
{
  int i;
  u32 src[REG_WIDTH/2], dst[REG_WIDTH/2];

  for (i = 0; i < REG_WIDTH/2; i++)
    src[i] = i * i;

  for (i = 0; i < REG_WIDTH/2; i++) {
    Xil_Out32(port(i), src[i]);
    dst[i] = Xil_In32(port(i));
  }

  for (i = 0; i < REG_WIDTH/2; i++) {
    assert_eq(Xil_In32(port(i)), src[i]);
    assert_eq(dst[i], src[i]);
  }

  memset(mem, 0, sizeof(u32)*REG_WIDTH/2);
  memset(dst, 0, sizeof(u32)*REG_WIDTH/2);

  memcpy(_port, src, sizeof(u32)*REG_WIDTH/2);
  memcpy(dst, _port, sizeof(u32)*REG_WIDTH/2);

  for (i = 0; i < REG_WIDTH/2; i++) {
    assert_eq(_port[i], src[i]);
    assert_eq(dst[i], src[i]);
  }

  for (i = 0; i < 32; i++)
    assert_eq(_port[i], Xil_In32(port(i)));

  test_return();
}

test test_s_axi(void)
{
  int i;
  u32 src[MEM_WIDTH], dst[MEM_WIDTH];

  for (i = 0; i < MEM_WIDTH; i++)
    src[i] = i * i;

  for (i = 0; i < MEM_WIDTH; i++) {
    mem[i] = src[i];
    dst[i] = mem[i];
  }

  for (i = 0; i < MEM_WIDTH; i++) {
    assert_eq(mem[i], src[i]);
    assert_eq(dst[i], src[i]);
  }

  memset(mem, 0, sizeof(u32)*MEM_WIDTH);
  memset(dst, 0, sizeof(u32)*MEM_WIDTH);

  memcpy(mem, src, sizeof(u32)*MEM_WIDTH);
  memcpy(dst, mem, sizeof(u32)*MEM_WIDTH);

  for (i = 0; i < MEM_WIDTH; i++) {
    assert_eq(mem[i], src[i]);
    assert_eq(dst[i], src[i]);
  }

  test_return();
}

int main(void)
{
  setbuf(stdout, NULL);
  printf("\033[2J");

  puts("### start ##################################################");

  init_reg();
  init_mem();

  // probe();

  test_s_axi_lite();
  test_s_axi();

  puts("###  end  ##################################################");

  return 0;
}
