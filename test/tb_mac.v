`timescale 1ns/1ps

module tb_mac;

reg clk;
reg rst;
reg start;
reg mode;

reg [15:0] A;
reg [15:0] B;

wire ready;
wire [15:0] ACC_OUT;


//=====================================
// DUT
//=====================================

mac_mas_core DUT(

    .clk(clk),
    .rst(rst),

    .start(start),

    .mode(mode),

    .A(A),
    .B(B),

    .ready(ready),

    .ACC_OUT(ACC_OUT)

);


//=====================================
// CLOCK
//=====================================

initial begin

    clk=0;

    forever #5 clk=~clk;

end


//=====================================
// TEST
//=====================================

initial begin

    $dumpfile("tb_mac.vcd");

    $dumpvars(0,tb_mac);

    rst=1;

    start=0;

    mode=0;

    A=16'h0000;

    B=16'h0000;

    #20;

    rst=0;



    //----------------------------------
    // MAC TEST 1
    //----------------------------------

    $display("");
    $display("MAC TEST 1");
    $display("");

    mode=0;

    A=16'h4000;

    B=16'h4000;

    start=1;

    #10;

    start=0;



    wait(ready);

    #20;

    $display(
        "ACC=%h",
        ACC_OUT
    );



    //----------------------------------
    // MAC TEST 2
    //----------------------------------

    $display("");
    $display("MAC TEST 2");
    $display("");

    mode=0;

    A=16'h4040;

    B=16'h4080;

    start=1;

    #10;

    start=0;



    wait(ready);

    #20;

    $display(
        "ACC=%h",
        ACC_OUT
    );



    //----------------------------------
    // MAS TEST
    //----------------------------------

    $display("");
    $display("MAS TEST");
    $display("");

    mode=1;

    A=16'h4000;

    B=16'h4000;

    start=1;

    #10;

    start=0;



    wait(ready);

    #20;

    $display(
        "ACC=%h",
        ACC_OUT
    );



    #100;

    $finish;

end

endmodule