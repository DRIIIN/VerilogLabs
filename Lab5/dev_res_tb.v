`timescale 1ns/100ps
module dev_res_tb;

localparam T = 200;

reg clk_in, reset_in;
reg flag_in;
reg [2:0] a_in, b_in;
reg [3:0] data_in;

wire [2:0] moore_out;
wire [6:0] seg_out;
wire tick;

dev_res test (
    .clk  (clk_in),
    .reset(reset_in),
    .flag (flag_in),
    .a    (a_in),
    .b    (b_in),
    .seg  (seg_out)
);

always begin
    clk_in = 0; #(T / 2);
    clk_in = 1; #(T / 2);
end

initial begin
    reset_in = 1;
    flag_in  = 0;
    a_in     = 5;
    b_in     = 6;
    data_in  = 2;

    #(T);
    reset_in = 0;

    repeat(8) @(negedge clk_in);
    flag_in = 1;

    repeat(8) @(negedge clk_in);
    flag_in = 0;

    data_in = 4'd7;
    repeat(8) @(negedge clk_in);

    $stop;
end

endmodule
