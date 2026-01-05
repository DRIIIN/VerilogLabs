`timescale 1ns/100ps

module tb_result;

localparam T = 200;

reg clk_in;
reg [3:0] data_in;
reg reset_in;

wire [6:0] data_0;
wire [6:0] data_1;
wire [6:0] data_2;
wire [6:0] data_3;
wire [6:0] data_4;
wire [6:0] data_5;

result test(
    .clk  (clk_in),
    .reset(reset_in),
    .d_in (data_in),
    .seg0 (data_0),
    .seg1 (data_1),
    .seg2 (data_2),
    .seg3 (data_3),
    .seg4 (data_4),
    .seg5 (data_5)
);

always 
begin
    clk_in = 1'b0; #(T / 2);
    clk_in = 1'b1; #(T / 2);
end

initial 
begin
    reset_in = 1'b1; #(T);
    reset_in = 0;

    d_in = 4'd1;
    repeat(4) @(negedge clk_in);

    d_in = 4'd2;
    repeat(4) @(negedge clk_in);

    d_in = 4'd3;
    repeat(4) @(negedge clk_in);

    d_in = 4'd4;
    repeat(4) @(negedge clk_in);

    d_in = 4'd5;
    repeat(4) @(negedge clk_in);

    d_in = 4'd6;
    repeat(4) @(negedge clk_in);

    $stop;
end

endmodule
