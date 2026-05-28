module fpdiv(

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
wire [15:0] reg_q_out;

wire q_s;

reg [7:0] q_exp;
reg [10:0] q_mant;

wire [7:0] adder_out;
wire [7:0] sub_out;

wire [11:0] div_out;

wire [15:0] result;

wire end1;
wire end2;
wire done;

wire [7:0] exp_r;
wire [7:0] mantisa_r;


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
// SIGN
//=====================================

assign q_s =
reg_a_out[15]^reg_b_out[15];


//=====================================
// EXPONENT LOGIC
//=====================================

assign sub_out =
reg_a_out[14:7]-reg_b_out[14:7];

assign adder_out =
sub_out+8'd127;


//=====================================
// FRACTIONAL DIVIDER
//=====================================

fractional_divider #(.N(12)) divider0(

    .clk(clk),

    .rst(rst),

    .start(end1),

    .dividend(
        {1'b1,reg_a_out[6:0],4'b0000}
    ),

    .divisor(
        {1'b1,reg_b_out[6:0],4'b0000}
    ),

    .quotient(div_out),

    .done(done)

);


//=====================================
// NORMALIZER
//=====================================

always @(*) begin

    if(div_out[11]) begin

        q_exp =
        adder_out;

        q_mant =
        div_out[11:1];

    end
    else begin

        q_exp =
        adder_out-8'd1;

        q_mant =
        div_out[10:0];

    end

end


//=====================================
// ROUNDER
//=====================================

rounder rounder0(

    .mant_i(q_mant),

    .exp_i(q_exp),

    .mant_o(mantisa_r),

    .exp_o(exp_r)

);


//=====================================
// RESULT LOGIC
//=====================================

assign result =

((reg_a_out[14:0]==0)&&(reg_b_out[14:0]!=0))

?

{q_s,15'd0}

:

((reg_a_out[14:0]!=0)&&(reg_b_out[14:0]==0))

?

{q_s,8'd255,7'd0}

:

((reg_a_out[14:0]==0)&&(reg_b_out[14:0]==0))

?

16'hFFFF

:

{q_s,exp_r,mantisa_r[6:0]};


//=====================================
// OUTPUT REGISTER
//=====================================

myreg #(.N(16)) yreg(

 .d(result),
 .q(reg_q_out),

 .clk(clk),

 .en(done),

 .rst(rst)

);


//=====================================
// ENABLE PIPELINE
//=====================================

myreg #(.N(1)) reg1en(

 .d(en),
 .q(end1),

 .clk(clk),

 .en(1'b1),      // FIX

 .rst(rst)

);

myreg #(.N(1)) reg2en(

 .d(done),
 .q(end2),

 .clk(clk),

 .en(1'b1),      // FIX

 .rst(rst)

);


//=====================================
// OUTPUTS
//=====================================

assign y = reg_q_out;

assign ready = end2;

endmodule