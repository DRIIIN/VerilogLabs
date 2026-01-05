
`timescale 1ns/10ps

module count_res_tb;

reg  clk, reset, ena, rev, res, load;
reg  [3:0] d;
wire [6:0] hex;

count_res test (
    .clk  (clk),
    .reset(reset),
    .ena  (ena),
    .res  (res),
    .rev  (rev),
    .load (load),
    .hex  (hex),
    .d    (d)
);

initial
begin
    clk = 0;
    forever
    #5 clk = ~clk;
end

initial 
begin
    reset = 0;
    ena   = 0;
    rev   = 0;
    res   = 0; 
    load  = 1'b1;
    d     = 4'd6; #10;
    reset = 1; #80;
    load  = 0; 
    ena   = 1; #200;
    rev   = 1; #200;
    ena   = 0; #80;
    ena   = 1; 
    rev   = 0; #200;
    res   = 1; #80;
    $stop;
end

endmodule
