`timescale 1ns/10ps

module shift_reg_tb;

reg  clk, reset;
reg  [3:0] data_in;
wire [3:0] sr0, sr1, sr2, sr3, sr4, sr5;

shift_reg test (
    .clk    (clk),
    .reset  (reset),
    .data_in(data_in),
    .s0     (sr0),
    .s1     (sr1),
    .s2     (sr2),
    .s3     (sr3),
    .s4     (sr4),
    .s5     (sr5)
);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    reset     = 1;
    data_in   = 0;
    #25 reset = 0;

    data_in = 4'b0001; #10;
    data_in = 4'b0010; #10;
    data_in = 4'b0011; #10;
    data_in = 4'b0100; #10;
    data_in = 4'b0101; #10;
    data_in = 4'b0110; #10;
    data_in = 4'b0111; #10;
    data_in = 4'b1000; #10;
    data_in = 4'b1001; #10;
    data_in = 4'b1010; #10;

    reset = 1; #10;
    reset = 0;

    data_in = 4'b1011; #10;
    data_in = 4'b1100; #10;
    data_in = 4'b1101; #10;
    data_in = 4'b1110; #10;
    data_in = 4'b1111; #10;

    $stop;
end

endmodule


