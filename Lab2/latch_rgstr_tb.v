`timescale 1ns/10ps

module latch_rgstr_tb;

localparam T = 20;
reg        clk;
reg [4:0]  in_d;
wire[4:0]  out_d;

latch_rgstr test(
    .clk(clk),
    .d_in(in_d),
    .d_out(out_d)
);

always

begin
    clk=1'b0; #(T / 2);
    clk=1'b1; #(T / 2);
end

initial

begin
    in_d=5'b10101; @(negedge clk);
    in_d=5'b01100; @(negedge clk);
    in_d=5'b11001; @(negedge clk);
    in_d=5'b01011; @(negedge clk);
    $stop;
end

endmodule