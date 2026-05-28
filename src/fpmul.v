// Half-precision (16-bit) floating point multiplier

module fpmul(

    input [15:0] x1,
    input [15:0] x2,

    output [15:0] y,

    input clk,
    input rst,
    input en,

    output ready

);

//=====================================
// INTERNAL SIGNALS
//=====================================

wire [15:0] reg_a_out;
wire [15:0] reg_b_out;
wire [15:0] reg_p_out;

wire p_s;

wire [7:0] p_exp;
wire [7:0] exp_grs;

wire [7:0] p_mant;

wire [10:0] mant_grs;

wire [7:0] adder_out;
wire [7:0] sub_out;

wire [15:0] mult_out;
wire [15:0] result;

wire [54:0] seg_reg0_out;

wire end1;
wire end2;
wire end3;


//=====================================
// INPUT REGISTERS
//=====================================

myreg #(.N(16)) x1reg(

 .d(x1),
 .q(reg_a_out),

 .clk(clk),
 .en(en),
 .rst(rst)

);

myreg #(.N(16)) x2reg(

 .d(x2),
 .q(reg_b_out),

 .clk(clk),
 .en(en),
 .rst(rst)

);


//=====================================
// MULTIPLIER CORE
//=====================================

assign p_s =
reg_a_out[15]^reg_b_out[15];

assign adder_out =
reg_a_out[14:7]+reg_b_out[14:7];

assign mult_out =
$unsigned({1'b1,reg_a_out[6:0]})
*
$unsigned({1'b1,reg_b_out[6:0]});

assign sub_out =
adder_out-8'd127;


//=====================================
// PIPELINE REGISTER
//=====================================

myreg #(.N(55)) seg_reg0(

 .d({
    p_s,
    reg_a_out[14:0],
    reg_b_out[14:0],
    sub_out,
    mult_out
 }),

 .q(seg_reg0_out),

 .clk(clk),

 .en(end1),

 .rst(rst)

);


//=====================================
// NORMALIZATION
//=====================================

assign exp_grs =

(seg_reg0_out[15])

?

seg_reg0_out[23:16]+8'd1

:

seg_reg0_out[23:16];


assign mant_grs =

(seg_reg0_out[15])

?

seg_reg0_out[15:5]

:

seg_reg0_out[14:4];


//=====================================
// ROUNDER
//=====================================

rounder rounder0(

    .mant_i(mant_grs),
    .exp_i(exp_grs),

    .mant_o(p_mant),
    .exp_o(p_exp)

);


//=====================================
// RESULT LOGIC
//=====================================

assign result =

(seg_reg0_out[53:39]==0)

?

{seg_reg0_out[54],15'd0}

:

(seg_reg0_out[38:24]==0)

?

{seg_reg0_out[54],15'd0}

:

{seg_reg0_out[54],p_exp,p_mant[6:0]};


//=====================================
// OUTPUT REGISTER
//=====================================

myreg #(.N(16)) yreg(

 .d(result),
 .q(reg_p_out),

 .clk(clk),

 .en(end2),

 .rst(rst)

);


//=====================================
// ENABLE PIPELINE
//=====================================

myreg #(.N(1)) reg1en(

 .d(en),
 .q(end1),

 .clk(clk),

 .en(1'b1),     // FIX

 .rst(rst)

);


myreg #(.N(1)) reg2en(

 .d(end1),
 .q(end2),

 .clk(clk),

 .en(1'b1),     // FIX

 .rst(rst)

);


myreg #(.N(1)) reg3en(

 .d(end2),
 .q(end3),

 .clk(clk),

 .en(1'b1),     // FIX

 .rst(rst)

);


//=====================================
// OUTPUTS
//=====================================

assign y = reg_p_out;

assign ready = end3;

endmodule