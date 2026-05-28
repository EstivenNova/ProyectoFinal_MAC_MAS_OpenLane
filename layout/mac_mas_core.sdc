###############################################################################
# Created by write_sdc
###############################################################################
current_design mac_mas_core
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 10.0000 [get_ports {clk}]
set_propagated_clock [get_clocks {clk}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[0]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[10]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[11]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[12]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[13]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[14]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[15]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[1]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[2]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[3]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[4]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[5]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[6]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[7]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[8]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[9]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[0]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[10]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[11]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[12]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[13]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[14]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[15]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[1]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[2]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[3]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[4]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[5]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[6]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[7]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[8]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[9]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {mode}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rst}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {start}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ACC_OUT[0]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ACC_OUT[10]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ACC_OUT[11]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ACC_OUT[12]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ACC_OUT[13]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ACC_OUT[14]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ACC_OUT[15]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ACC_OUT[1]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ACC_OUT[2]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ACC_OUT[3]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ACC_OUT[4]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ACC_OUT[5]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ACC_OUT[6]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ACC_OUT[7]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ACC_OUT[8]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ACC_OUT[9]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {ready}]
###############################################################################
# Environment
###############################################################################
###############################################################################
# Design Rules
###############################################################################
