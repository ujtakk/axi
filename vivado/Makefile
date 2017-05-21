.PHONY: run sw hw zedboard ip all clean

run:
	cp helloworld.c zedboard/zedboard.sdk/hello/src
	xsct run.tcl

all: clean ip zedboard hw sw run

sw:
	xsct sw.tcl

hw:
	vivado -nojournal -nolog -mode batch -source hw.tcl

zedboard:
	# vivado -nojournal -nolog -mode batch -source zedboard.tcl
	vivado -mode batch -source zedboard.tcl

ip:
	vivado -nojournal -nolog -mode batch -source ip.tcl

clean:
	rm -rf ip zedboard .Xil
	rm -f vivado*
