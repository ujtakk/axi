#define REGSIZE 5
#define MEMSIZE 10
#define BUFSIZE 7

#include <stdio.h>
#include <stdlib.h>

#include "sleep.h"
#include "xil_io.h"
#include "xil_printf.h"
#include "xtime_l.h"
#include "xaxidma.h"

#define REG_WIDTH (1 << REGSIZE)
#define MEM_WIDTH (1 << MEMSIZE)
#define BUF_WIDTH (1 << BUFSIZE)

#define port(n)         (XPAR_AXI_TOP_0_BASEADDR + 4*(n))
static u32 *_port     = (u32 *)0x43C10000;

static u32 *mem       = (u32 *)0x43C00000;
static u32  mem_we    = 0;
static u32  mem_addr  = 0;
static u32  mem_wdata = 0;
static u32  mem_rdata = 0;

static XAxiDma dma;
static XAxiDma_Config *dma_cfg;
const int dma_id = XPAR_AXIDMA_0_DEVICE_ID;
#define buf_re      _port[2]
#define buf_isempty _port[23]
#define buf_isfull  _port[22]
#define buf_rdata   _port[21]

#define DDR_BASE_ADDR XPAR_PS7_DDR_0_S_AXI_BASEADDR
#ifndef DDR_BASE_ADDR
#warning CHECK FOR THE VALID DDR ADDRESS IN XPARAMETERS.H, \
     DEFAULT SET TO 0x01000000
#define MEM_BASE_ADDR   0x01000000
#else
#define MEM_BASE_ADDR   (DDR_BASE_ADDR + 0x1000000)
#endif

#define TX_BUFFER_BASE    (MEM_BASE_ADDR + 0x00100000)
#define RX_BUFFER_BASE    (MEM_BASE_ADDR + 0x00300000)
#define RX_BUFFER_HIGH    (MEM_BASE_ADDR + 0x004FFFFF)

#define assert_eq(a, b) do {                                        \
  if ((a) != (b)) {                                                 \
    printf("Assertion failed: %s == %s, file %s, line %d\n",        \
            #a, #b, __FILE__, __LINE__);                            \
    printf("\t%s == %lx, %s == %lx\n", #a, (u32)(a), #b, (u32)(b)); \
    printf("%s: FAIL\n", __func__);                                 \
    return EXIT_FAILURE;                                            \
  }                                                                 \
} while (0)

#define assert_not(cond, fail_msg) do {                 \
  if ((cond)) {                                         \
    printf("Assertion failed: %s, file %s, line %d\n",  \
            (fail_msg), __FILE__, __LINE__);            \
    printf("%s: FAIL\n", __func__);                     \
    return EXIT_FAILURE;                                \
  }                                                     \
} while (0)

#define test_return() do {          \
  printf("%s: PASS\n", __func__);   \
  return EXIT_SUCCESS;              \
} while (0)

typedef int test;

int init_reg(void)
{
  for (int i = 0; i < REG_WIDTH/2; i++)
    Xil_Out32(port(i), 0x0);

  return EXIT_SUCCESS;
}

int init_mem(void)
{
  memset(mem, 0, sizeof(u32)*MEM_WIDTH);

  return EXIT_SUCCESS;
}

int init_buf(void)
{
  int status;

  // Initialize the XAxiDma device.
  dma_cfg = XAxiDma_LookupConfig(dma_id);
  assert_not(!dma_cfg, "No config found");

  status = XAxiDma_CfgInitialize(&dma, dma_cfg);
  assert_not(status != XST_SUCCESS, "Initialization failed");

  assert_not(XAxiDma_HasSg(&dma), "Device configured as SG mode");

  // Disable interrupts, we use polling mode
  XAxiDma_IntrDisable(&dma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
  XAxiDma_IntrDisable(&dma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

  return EXIT_SUCCESS;
}

void print_reg(void)
{
  printf("reg: {\n");
  for (int i = 0; i < 32; i++) {
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

void print_buf(void)
{
  if (buf_re)
    buf_rdata = _port[21];

  printf("buf: {\n");
  printf("    buf_re:      %8lx,\n", buf_re);
  printf("    buf_isempty: %8lx,\n", buf_isempty);
  printf("    buf_isfull:  %8lx,\n", buf_isfull);
  printf("    buf_rdata:   %8lx,\n", buf_rdata);
  printf("    buf_wptr:    %8lx,\n", _port[17]);
  printf("    buf_rptr:    %8lx,\n", _port[16]);
  printf("}\n");
}

test test_s_axi_lite(void)
{
  u32 src[REG_WIDTH/2], dst[REG_WIDTH/2];

  init_reg();

  // NOTE: values must be shifted enough
  //       to avoid starting transactions of m_axi*
  for (int i = 0; i < REG_WIDTH/2; i++)
    src[i] = i * i << 16;

  for (int i = 0; i < REG_WIDTH/2; i++) {
    Xil_Out32(port(i), src[i]);
    dst[i] = Xil_In32(port(i));
  }

  for (int i = 0; i < REG_WIDTH/2; i++) {
    assert_eq(Xil_In32(port(i)), src[i]);
    assert_eq(dst[i], src[i]);
  }

  memset(mem, 0, sizeof(u32)*REG_WIDTH/2);
  memset(dst, 0, sizeof(u32)*REG_WIDTH/2);

  memcpy(_port, src, sizeof(u32)*REG_WIDTH/2);
  memcpy(dst, _port, sizeof(u32)*REG_WIDTH/2);

  for (int i = 0; i < REG_WIDTH/2; i++) {
    assert_eq(_port[i], src[i]);
    assert_eq(dst[i], src[i]);
  }

  for (int i = 0; i < 32; i++)
    if (_port[i] != Xil_In32(port(i)))
      printf("%d %d: %lx %lx\n", i,  _port[i] != Xil_In32(port(i)), _port[i], Xil_In32(port(i)));
    // assert_eq(_port[i], Xil_In32(port(i)));

  test_return();
}

test test_s_axi(void)
{
  u32 src[MEM_WIDTH], dst[MEM_WIDTH];

  init_mem();

  for (int i = 0; i < MEM_WIDTH; i++)
    src[i] = i * i;

  for (int i = 0; i < MEM_WIDTH; i++) {
    mem[i] = src[i];
    dst[i] = mem[i];
  }

  for (int i = 0; i < MEM_WIDTH; i++) {
    assert_eq(mem[i], src[i]);
    assert_eq(dst[i], src[i]);
  }

  memset(mem, 0, sizeof(u32)*MEM_WIDTH);
  memset(dst, 0, sizeof(u32)*MEM_WIDTH);

  memcpy(mem, src, sizeof(u32)*MEM_WIDTH);
  memcpy(dst, mem, sizeof(u32)*MEM_WIDTH);

  for (int i = 0; i < MEM_WIDTH; i++) {
    assert_eq(mem[i], src[i]);
    assert_eq(dst[i], src[i]);
  }

  test_return();
}

test test_s_axi_stream(void)
{
  int status;
  u32 *src = (u32 *)TX_BUFFER_BASE;
  u32 value;
  XTime begin, end;

  init_reg();
  init_buf();

  // Flush the SrcBuffer before the DMA transfer,
  // in case the Data Cache is enabled
  Xil_DCacheFlushRange((UINTPTR)src, sizeof(u32)*BUF_WIDTH);

  value = 0x12;

  for (int i = 0; i < BUF_WIDTH; i++) {
      src[i] = 0;
      value  = value + 1;
  }

  init_reg();

  for (int i = 1; i <= BUF_WIDTH; i++) {
    status = XAxiDma_SimpleTransfer(&dma,
              (UINTPTR)src, sizeof(u32)*i, XAXIDMA_DMA_TO_DEVICE);
    assert_not(status != XST_SUCCESS, "Transfer failed");

    XTime_GetTime(&begin);
    while (XAxiDma_Busy(&dma, XAXIDMA_DMA_TO_DEVICE)) {
      XTime_GetTime(&end);
      assert_not((double)(end-begin) / COUNTS_PER_SECOND > 1.0,
                  "More than 1sec was elapsed on dma");
      /* Blocking */
    }

    // Clear written data by reading
    // port(2): buf_re
    for (int j = 0; j < i; j++) {
      buf_re = 0x1;
      buf_re = 0x0;
      // TODO: read value is incorrect
      // _port[3] = j;
      // printf("src[%d]: %lx, mem[%d]; %lx\n", j, src[j], _port[17], _port[16]);
    }
  }

  test_return();
}

test test_m_axi_lite(void)
{
  int acc = 0;
  u32 src[4] = {0};
  // volatile u32 *src = (volatile u32 *)0x11000000;

  Xil_DCacheDisable();

  init_reg();

  // for (int i = 0; i < 4; i++)
  //   src[i] = 0;

  for (int i = 0; i < 4; i++)
    assert_eq(src[i], 0);

  Xil_Out32(port(3), (UINTPTR)src);
  Xil_Out32(port(0), 0x1);
  Xil_Out32(port(0), 0x0);

  for (int i = 0; i < 4; i++) {
    acc += i;
    assert_eq(src[i], acc);
  }

  Xil_DCacheEnable();

  test_return();
}

test test_m_axi(void)
{
  u32 src[256] = {0};
  // volatile u32 *src = (volatile u32 *)0x12000000;

  Xil_DCacheDisable();

  init_reg();

  // for (int i = 0; i < 256; i++)
  //   src[i] = 0;

  for (int i = 0; i < 256; i++)
    assert_eq(src[i], 0);

  Xil_Out32(port(4), (UINTPTR)src);
  Xil_Out32(port(1), 0x1);
  Xil_Out32(port(1), 0x0);

  for (int i = 0; i < 256; i++)
    assert_eq(src[i], i);

  Xil_DCacheEnable();

  test_return();
}

int main(void)
{
  XTime begin, end;

  setbuf(stdout, NULL);
  printf("\033[2J");

  puts("### start ##################################################");
  XTime_GetTime(&begin);

  test_s_axi_lite();
  test_s_axi();
  test_s_axi_stream();

  test_m_axi_lite();
  test_m_axi();

  XTime_GetTime(&end);

  puts("###  end  ##################################################");

  printf("elapsed time: %10.6f [ms]\n",
                  (double)(end-begin) / COUNTS_PER_SECOND * 1000);

  return 0;
}
