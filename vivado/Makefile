BOARD = zybo

.PHONY: run sw hw zedboard ip all clean

run:
	cp helloworld.c ${BOARD}/${BOARD}.sdk/hello/src
	xsct run.tcl ${BOARD}

all: clean ip ${BOARD} hw sw run

sw:
	xsct sw.tcl ${BOARD}

hw:
	vivado -nojournal -nolog -mode batch -source hw.tcl -tclargs ${BOARD}

ip:
	vivado -nojournal -nolog -mode batch -source ip.tcl

zedboard:
	vivado -nojournal -nolog -mode batch -source zedboard.tcl

zybo:
	vivado -nojournal -nolog -mode batch -source zybo.tcl

clean:
	rm -rf ip zybo zedboard .Xil
	rm -f vivado*

