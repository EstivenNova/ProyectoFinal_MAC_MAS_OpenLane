`timescale 1ns/1ps

module mac_mas_core(

    input clk,
    input rst,

    input start,

    input mode,

    input [15:0] A,
    input [15:0] B,

    output reg ready,

    output [15:0] ACC_OUT

);

//=====================================
// INTERNAL REGISTERS
//=====================================

reg [15:0] ACC;

reg mul_en;
reg add_en;


//=====================================
// INTERNAL WIRES
//=====================================

wire [15:0] mul_out;
wire mul_ready;

wire [15:0] add_out;
wire add_ready;


//=====================================
// FSM STATES
//=====================================

localparam IDLE       = 3'd0;
localparam START_MUL  = 3'd1;
localparam WAIT_MUL   = 3'd2;
localparam START_ADD  = 3'd3;
localparam WAIT_ADD   = 3'd4;
localparam WRITE_ACC  = 3'd5;

reg [2:0] state;


//=====================================
// MULTIPLIER
//=====================================

fpmul mul_unit(

    .x1(A),
    .x2(B),

    .clk(clk),
    .rst(rst),

    .en(mul_en),

    .ready(mul_ready),

    .y(mul_out)

);


//=====================================
// ADD / SUB UNIT
//=====================================

fp16sum_res_pipe addsub_unit(

    .x1(ACC),

    .x2(mul_out),

    .clk(clk),
    .rst(rst),

    .add_sub(mode),

    .en(add_en),

    .ready(add_ready),

    .y(add_out)

);


//=====================================
// OUTPUT
//=====================================

assign ACC_OUT = ACC;


//=====================================
// INITIAL
//=====================================

initial begin

    ACC = 16'h0000;

    mul_en = 1'b0;

    add_en = 1'b0;

    ready = 1'b0;

    state = IDLE;

end


//=====================================
// FSM
//=====================================

always @(posedge clk or posedge rst) begin

    if(rst)

        state <= IDLE;

    else begin

        case(state)

            IDLE:

                if(start)

                    state <= START_MUL;

                else

                    state <= IDLE;



            START_MUL:

                state <= WAIT_MUL;



            WAIT_MUL:

                if(mul_ready)

                    state <= START_ADD;

                else

                    state <= WAIT_MUL;



            START_ADD:

                state <= WAIT_ADD;



            WAIT_ADD:

                if(add_ready)

                    state <= WRITE_ACC;

                else

                    state <= WAIT_ADD;



            WRITE_ACC:

                state <= IDLE;



            default:

                state <= IDLE;

        endcase

    end

end


//=====================================
// CONTROL LOGIC
//=====================================

always @(*) begin

    mul_en = 1'b0;

    add_en = 1'b0;

    ready = 1'b0;

    case(state)

        START_MUL:

            mul_en = 1'b1;



        START_ADD:

            add_en = 1'b1;



        WRITE_ACC:

            ready = 1'b1;

    endcase

end


//=====================================
// ACC UPDATE
//=====================================

always @(posedge clk) begin

    if(add_ready)

        ACC <= add_out;

end


endmodule