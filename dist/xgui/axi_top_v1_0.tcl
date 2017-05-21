# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ARUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AWUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "BUFSIZE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "BUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DWIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ID_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MEMSIZE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "REGSIZE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "STEP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WUSER_WIDTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.ARUSER_WIDTH { PARAM_VALUE.ARUSER_WIDTH } {
	# Procedure called to update ARUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ARUSER_WIDTH { PARAM_VALUE.ARUSER_WIDTH } {
	# Procedure called to validate ARUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.AWUSER_WIDTH { PARAM_VALUE.AWUSER_WIDTH } {
	# Procedure called to update AWUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AWUSER_WIDTH { PARAM_VALUE.AWUSER_WIDTH } {
	# Procedure called to validate AWUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.BUFSIZE { PARAM_VALUE.BUFSIZE } {
	# Procedure called to update BUFSIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BUFSIZE { PARAM_VALUE.BUFSIZE } {
	# Procedure called to validate BUFSIZE
	return true
}

proc update_PARAM_VALUE.BUSER_WIDTH { PARAM_VALUE.BUSER_WIDTH } {
	# Procedure called to update BUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BUSER_WIDTH { PARAM_VALUE.BUSER_WIDTH } {
	# Procedure called to validate BUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.DWIDTH { PARAM_VALUE.DWIDTH } {
	# Procedure called to update DWIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DWIDTH { PARAM_VALUE.DWIDTH } {
	# Procedure called to validate DWIDTH
	return true
}

proc update_PARAM_VALUE.ID_WIDTH { PARAM_VALUE.ID_WIDTH } {
	# Procedure called to update ID_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ID_WIDTH { PARAM_VALUE.ID_WIDTH } {
	# Procedure called to validate ID_WIDTH
	return true
}

proc update_PARAM_VALUE.LSB { PARAM_VALUE.LSB } {
	# Procedure called to update LSB when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LSB { PARAM_VALUE.LSB } {
	# Procedure called to validate LSB
	return true
}

proc update_PARAM_VALUE.MEMSIZE { PARAM_VALUE.MEMSIZE } {
	# Procedure called to update MEMSIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MEMSIZE { PARAM_VALUE.MEMSIZE } {
	# Procedure called to validate MEMSIZE
	return true
}

proc update_PARAM_VALUE.MEM_WIDTH { PARAM_VALUE.MEM_WIDTH } {
	# Procedure called to update MEM_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MEM_WIDTH { PARAM_VALUE.MEM_WIDTH } {
	# Procedure called to validate MEM_WIDTH
	return true
}

proc update_PARAM_VALUE.REGSIZE { PARAM_VALUE.REGSIZE } {
	# Procedure called to update REGSIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REGSIZE { PARAM_VALUE.REGSIZE } {
	# Procedure called to validate REGSIZE
	return true
}

proc update_PARAM_VALUE.REG_WIDTH { PARAM_VALUE.REG_WIDTH } {
	# Procedure called to update REG_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG_WIDTH { PARAM_VALUE.REG_WIDTH } {
	# Procedure called to validate REG_WIDTH
	return true
}

proc update_PARAM_VALUE.RUSER_WIDTH { PARAM_VALUE.RUSER_WIDTH } {
	# Procedure called to update RUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RUSER_WIDTH { PARAM_VALUE.RUSER_WIDTH } {
	# Procedure called to validate RUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.STEP { PARAM_VALUE.STEP } {
	# Procedure called to update STEP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.STEP { PARAM_VALUE.STEP } {
	# Procedure called to validate STEP
	return true
}

proc update_PARAM_VALUE.WUSER_WIDTH { PARAM_VALUE.WUSER_WIDTH } {
	# Procedure called to update WUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WUSER_WIDTH { PARAM_VALUE.WUSER_WIDTH } {
	# Procedure called to validate WUSER_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.STEP { MODELPARAM_VALUE.STEP PARAM_VALUE.STEP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.STEP}] ${MODELPARAM_VALUE.STEP}
}

proc update_MODELPARAM_VALUE.DWIDTH { MODELPARAM_VALUE.DWIDTH PARAM_VALUE.DWIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DWIDTH}] ${MODELPARAM_VALUE.DWIDTH}
}

proc update_MODELPARAM_VALUE.REGSIZE { MODELPARAM_VALUE.REGSIZE PARAM_VALUE.REGSIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REGSIZE}] ${MODELPARAM_VALUE.REGSIZE}
}

proc update_MODELPARAM_VALUE.MEMSIZE { MODELPARAM_VALUE.MEMSIZE PARAM_VALUE.MEMSIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MEMSIZE}] ${MODELPARAM_VALUE.MEMSIZE}
}

proc update_MODELPARAM_VALUE.BUFSIZE { MODELPARAM_VALUE.BUFSIZE PARAM_VALUE.BUFSIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BUFSIZE}] ${MODELPARAM_VALUE.BUFSIZE}
}

proc update_MODELPARAM_VALUE.ID_WIDTH { MODELPARAM_VALUE.ID_WIDTH PARAM_VALUE.ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ID_WIDTH}] ${MODELPARAM_VALUE.ID_WIDTH}
}

proc update_MODELPARAM_VALUE.AWUSER_WIDTH { MODELPARAM_VALUE.AWUSER_WIDTH PARAM_VALUE.AWUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AWUSER_WIDTH}] ${MODELPARAM_VALUE.AWUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.ARUSER_WIDTH { MODELPARAM_VALUE.ARUSER_WIDTH PARAM_VALUE.ARUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ARUSER_WIDTH}] ${MODELPARAM_VALUE.ARUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.WUSER_WIDTH { MODELPARAM_VALUE.WUSER_WIDTH PARAM_VALUE.WUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WUSER_WIDTH}] ${MODELPARAM_VALUE.WUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.RUSER_WIDTH { MODELPARAM_VALUE.RUSER_WIDTH PARAM_VALUE.RUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RUSER_WIDTH}] ${MODELPARAM_VALUE.RUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.BUSER_WIDTH { MODELPARAM_VALUE.BUSER_WIDTH PARAM_VALUE.BUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BUSER_WIDTH}] ${MODELPARAM_VALUE.BUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.LSB { MODELPARAM_VALUE.LSB PARAM_VALUE.LSB } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LSB}] ${MODELPARAM_VALUE.LSB}
}

proc update_MODELPARAM_VALUE.REG_WIDTH { MODELPARAM_VALUE.REG_WIDTH PARAM_VALUE.REG_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG_WIDTH}] ${MODELPARAM_VALUE.REG_WIDTH}
}

proc update_MODELPARAM_VALUE.MEM_WIDTH { MODELPARAM_VALUE.MEM_WIDTH PARAM_VALUE.MEM_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MEM_WIDTH}] ${MODELPARAM_VALUE.MEM_WIDTH}
}

