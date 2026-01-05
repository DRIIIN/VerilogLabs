module count_res (
    input  wire clk, reset,      
    input  wire res,    
    input  wire ena,      
    input  wire rev, load,
	input  [3:0] d,      
    output wire [6:0] hex     
);

    wire clk_div;      
    wire [3:0] count;
    
    count_div2 u_div (
        .clk (clk),
        .sync(clk_div),
        .q   ()
    );

    count_par u_count (
        .clk  (clk_div),
        .reset(reset),
        .res  (res),
        .ena  (ena),
        .rev  (rev),
        .load (load),
        .d    (d),
        .q    (count)
    );

    coder u_coder (
        .data(count),
        .seg (hex)
    );



endmodule


