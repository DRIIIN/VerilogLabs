module dev_res(
    input  wire clk, reset,
    input  wire flag,
    input  wire [2:0] a, b,
    output wire [6:0] seg
);

wire [3:0] moore_out;
wire sync;
 
count_div2 u_counter (
    .clk (clk),
    .sync(sync),
    .q   ()
);

moore_lab u_moore (
    .clk  (sync),
    .flag (flag),
    .reset(reset),
    .a    (a),
    .b    (b),
    .out  (moore_out)
);

coder u_coder (
    .data(moore_out),
    .seg (seg)
);

endmodule
