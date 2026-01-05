`timescale 1ns/10ps

module count_par_tb;

reg  clk, reset, res, ena, rev, load;
reg  [3:0] d;
wire [3:0] q;

count_par test (
    .clk  (clk),
    .reset(reset),
    .res  (res),
    .ena  (ena),
    .rev  (rev),
    .load (load),
    .d    (d),
    .q    (q)
);

always #5 clk = ~clk;

initial begin
    clk   = 0; 
    reset = 0; 
    res   = 0; 
    ena   = 0; 
    rev   = 0; 

    load  = 0; d = 4'd0;
    #10 reset = 1; 

    load = 1; d = 4'd5; #10;
    load = 0;

    ena = 1; rev = 0; #40;
    rev = 1; #40;

    res = 1; #10;
    res = 0; #10;

    load = 1; d = 4'd9; #10;
    load = 0; ena = 1; rev = 0; #30;

    $stop;
end

endmodule

