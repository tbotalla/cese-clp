# Arty Z7-10 xdc 
# top alu_vio (entradas ALU desde VIO)

############################
# System clock (125 MHz)   #
############################
set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { clk_pin }];
create_clock -add -name sys_clk_pin -period 8.000 -waveform {0 4.000} [get_ports { clk_pin }]; # 8ns

############################
# On-board led             #
############################
set_property -dict { PACKAGE_PIN R14    IOSTANDARD LVCMOS33 } [get_ports { led[0] }];
set_property -dict { PACKAGE_PIN P14    IOSTANDARD LVCMOS33 } [get_ports { led[1] }];
set_property -dict { PACKAGE_PIN N16    IOSTANDARD LVCMOS33 } [get_ports { led[2] }];
set_property -dict { PACKAGE_PIN M14    IOSTANDARD LVCMOS33 } [get_ports { led[3] }];
