SHELL = bash
PYTHON = python3
ICARUS_SUFFIX =
IVERILOG = iverilog$(ICARUS_SUFFIX)
VVP = vvp$(ICARUS_SUFFIX)

VERILOG_OBJS = \
../src/mac_mas_core.v \
../src/fp16_sum_res_pipe.v \
../src/fpmul.v \
../src/fpdiv.v \
../src/sum_res_pp.v \
../src/add_renorm.v \
../src/exp_mant_logic.v \
../src/fractional_divider.v \
../src/leading_zero_norm.v \
../src/myreg.v \
../src/op_sign_logic.v \
../src/rounder.v


all: test_mac


#====================================
# MAC / MAS TEST
#====================================

test_mac: test_mac.vvp
	$(VVP) -N $< +vcd


test_mac.vvp: $(VERILOG_OBJS) tb_mac.v
	$(IVERILOG) -o $@ $^


#====================================
# CLEAN
#====================================

clean:
	rm -vrf *.vvp *.vcd