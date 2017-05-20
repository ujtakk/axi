.PHONY: run sw hw zedboard ip all

run:
	xsct run.tcl

sw:
	xsct sw.tcl

hw:
	vivado -nojournal -nolog -mode batch -source hw.tcl

zedboard:
	vivado -nojournal -nolog -mode batch -source zedboard.tcl

ip:
	vivado -nojournal -nolog -mode batch -source ip.tcl

all: ip zedboard hw sw debug

