# Define your own block design

create_bd_design "design_1"

create_bd_cell -type ip -vlnv \
  xilinx.com:ip:processing_system7:5.5 processing_system7_0
create_bd_cell -type ip -vlnv \
  user.org:user:axi_top:1.0 axi_top_0

apply_bd_automation \
  -rule xilinx.com:bd_rule:processing_system7 \
  -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable" } \
  [get_bd_cells processing_system7_0]

apply_bd_automation \
  -rule xilinx.com:bd_rule:axi4 \
  -config {Master "/processing_system7_0/M_AXI_GP0" Clk "Auto" } \
  [get_bd_intf_pins axi_top_0/s_axi]
apply_bd_automation \
  -rule xilinx.com:bd_rule:axi4 \
  -config {Master "/processing_system7_0/M_AXI_GP0" Clk "Auto" } \
  [get_bd_intf_pins axi_top_0/s_axi_lite]

connect_bd_net [get_bd_pins axi_top_0/m_axi_lite_aclk]      [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_pins axi_top_0/m_axi_lite_aresetn]   [get_bd_pins rst_ps7_0_100M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_top_0/s_axi_aresetn]        [get_bd_pins rst_ps7_0_100M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_top_0/m_axi_aclk]           [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_pins axi_top_0/m_axi_aresetn]        [get_bd_pins rst_ps7_0_100M/peripheral_aresetn]
connect_bd_net [get_bd_pins axi_top_0/s_axi_stream_aclk]    [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_pins axi_top_0/m_axi_stream_aclk]    [get_bd_pins processing_system7_0/FCLK_CLK0]
connect_bd_net [get_bd_pins axi_top_0/m_axi_stream_aresetn] [get_bd_pins rst_ps7_0_100M/peripheral_aresetn]

regenerate_bd_layout
save_bd_design

