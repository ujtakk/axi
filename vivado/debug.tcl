#!/usr/bin/env xsct

set origin_dir .
set proj_name zedboard

set sdk_ws_dir $origin_dir/$proj_name/$proj_name.sdk

set hdf_filename [lindex [glob -dir $sdk_ws_dir *.hdf] 0]
set hdf_filename_only [lindex [split $hdf_filename /] end]
set top_module_name [lindex [split $hdf_filename_only .] 0]
set hw_project_name ${top_module_name}_hw_platform_0

connect

targets -set -nocase -filter {name =~ "ARM*#0"}
rst
fpga $sdk_ws_dir/$hw_project_name/design_1_wrapper.bit
loadhw $sdk_ws_dir/$hw_project_name/system.hdf
source $sdk_ws_dir/$hw_project_name/ps7_init.tcl
ps7_init
ps7_post_config
dow $sdk_ws_dir/hello/Debug/hello.elf

con
