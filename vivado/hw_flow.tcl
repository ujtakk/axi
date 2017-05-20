#!/usr/bin/env vivado -mode batch -source

# ref: http://www.fpgadeveloper.com/2016/11/tcl-automation-tips-for-vivado-xilinx-sdk.html

set origin_dir .
set proj_name zedboard

open_project $origin_dir/$proj_name/$proj_name.xpr

reset_run   synth_1
launch_runs synth_1
wait_on_run synth_1

reset_run   impl_1
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1

# Export project to SDK
set bit_filename \
  [lindex [glob -dir $origin_dir/$proj_name/$proj_name.runs/impl_1 *.bit] 0]
set bit_filename_only [lindex [split $bit_filename /] end]
set top_module_name [lindex [split $bit_filename_only .] 0]
set export_dir $origin_dir/$proj_name/$proj_name.sdk
file mkdir $export_dir

write_sysdef -force \
  -hwdef $origin_dir/$proj_name/$proj_name.runs/impl_1/$top_module_name.hwdef \
  -bitfile $origin_dir/$proj_name/$proj_name.runs/impl_1/$top_module_name.bit \
  -meminfo $origin_dir/$proj_name/$proj_name.runs/impl_1/$top_module_name.mmi \
$export_dir/$top_module_name.hdf
