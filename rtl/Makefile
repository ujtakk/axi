VERBOSE   = 0
SIMULATOR = vsim
MODULE    = axi_top.v.erb
TARGET    = test/test_$(MODULE)
INCLUDE   =

LINK_DIR  = .
DIST      = ../dist

include Makefile.dep
include VERBMakefile

.PHONY: file test clean log edit diff

file: $(TARGET:.v.erb=.com)
test: $(TARGET:.v.erb=.log)

clean: clean-common

log:
	@nvim $(TARGET:.v.erb=.log)

com:
	@nvim $(TARGET:.v.erb=.com)

edit:
	@nvim -O $(TARGET) $(MODULE)

diff:
	@nvim -d output_$(shell echo $(MODULE) | cut -d. -f1).dat \
		 true_$(shell echo $(MODULE) | cut -d. -f1).dat

define DEP_IN
## -*- text -*-
## ignore list

ignore_file {
}

ignore_com {
}
endef
export DEP_IN
