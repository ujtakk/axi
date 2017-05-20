.PHONY: debug sw hw zedboard ip all

debug:
	xsct debug.tcl

sw:
	xsct sw_flow.tcl

hw:
	vivado -nojournal -nolog -mode batch -source hw_flow.tcl

zedboard:
	vivado -nojournal -nolog -mode batch -source zedboard.tcl

ip:
	vivado -nojournal -nolog -mode batch -source ip.tcl

all: ip zedboard hw sw debug

