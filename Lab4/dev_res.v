module result #(parameter N = 4) (
    input  wire clk, 
    input  wire reset,
    input  wire [3:0] data_in, 
    output wire [6:0] seg0, 
    output wire [6:0] seg1, 
    output wire [6:0] seg2, 
    output wire [6:0] seg3, 
    output wire [6:0] seg4, 
    output wire [6:0] seg5
);

wire clk_lw;
wire [3:0] out_0, out_1, out_2, out_3, out_4, out_5;

count_div2 counter(
    .clk (clk), 
    .sync(clk_lw),
	.q   ()
);

shift_reg_array shift(
    .clk    (clk_lw), 
	.reset  (reset), 
    .data_in(data_in), 
    .s0     (out_0), 
    .s1     (out_1), 
    .s2     (out_2), 
    .s3     (out_3), 
    .s4     (out_4), 
    .s5     (out_5)
);

coder coder0(
	.data(out_0), 
	.seg (seg0)
);

coder coder1(
	.data(out_1), 
	.seg (seg1)
);

coder coder2(
	.data(out_2), 
	.seg (seg2)
);

coder coder3(
	.data(out_3), 
	.seg (seg3)
);

coder coder4(
	.data(out_4), 
	.seg (seg4)
);

coder coder5(
	.data(out_5), 
	.seg (seg5)
);

endmodule
