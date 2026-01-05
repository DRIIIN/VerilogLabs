`timescale 1ns/10ps

module count_div2_tb;

reg  clk;
wire sync;
wire [3:0] q;

count_div2 test (
    .clk (clk),
    .sync(sync),
    .q   (q)
);

always #5 clk = ~clk;

initial begin
    clk = 0; #200;
    $stop;
end

endmodule


