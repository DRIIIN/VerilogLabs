module moore_lab_tb;

reg  clk, flag;
reg  reset;
reg  [2:0] a;
reg  [2:0] b;
wire [2:0] out;

moore_lab test (
    .clk  (clk),
    .flag (flag),
    .reset(reset),
    .a    (a),
    .b    (b),
    .out  (out)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    flag  = 0;
    a     = 5;
    b     = 6;
    
    #10 reset = 0;
    #100 flag = 1;
    #100 flag = 0;
    #200 $stop;
end

endmodule
