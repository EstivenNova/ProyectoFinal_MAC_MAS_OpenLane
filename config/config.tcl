set ::env(DESIGN_NAME) mac_mas_core

set ::env(VERILOG_FILES) "\
$::env(DESIGN_DIR)/src/mac_mas_core.v\
$::env(DESIGN_DIR)/src/fpmul.v\
$::env(DESIGN_DIR)/src/fp16_sum_res_pipe.v\
$::env(DESIGN_DIR)/src/myreg.v\
$::env(DESIGN_DIR)/src/rounder.v\
$::env(DESIGN_DIR)/src/exp_mant_logic.v\
$::env(DESIGN_DIR)/src/sum_res_pp.v\
$::env(DESIGN_DIR)/src/op_sign_logic.v\
$::env(DESIGN_DIR)/src/leading_zero_norm.v\
$::env(DESIGN_DIR)/src/add_renorm.v"

# OPTIMIZACION DE AREA

set ::env(SYNTH_STRATEGY) "AREA 0"

set ::env(SYNTH_SHARE_RESOURCES) 1

set ::env(PL_TARGET_DENSITY) 0.65
