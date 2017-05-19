# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/kaftulal/axi/vivado/ip/ip.cache/wt [current_project]
set_property parent.project_path /home/kaftulal/axi/vivado/ip/ip.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
set_property ip_repo_paths /home/kaftulal/axi/dist [current_project]
set_property ip_output_repo /home/kaftulal/axi/vivado/ip/ip.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog /home/kaftulal/axi/dist/parameters.vh
read_verilog -library xil_defaultlib {
  /home/kaftulal/axi/dist/m_axi.v
  /home/kaftulal/axi/dist/m_axi_lite.v
  /home/kaftulal/axi/dist/s_axi_stream.v
  /home/kaftulal/axi/dist/s_axi.v
  /home/kaftulal/axi/dist/s_axi_lite.v
  /home/kaftulal/axi/dist/m_axi_stream.v
  /home/kaftulal/axi/dist/axi_top.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}

synth_design -top axi_top -part xc7z020clg484-1


write_checkpoint -force -noxdef axi_top.dcp

catch { report_utilization -file axi_top_utilization_synth.rpt -pb axi_top_utilization_synth.pb }
