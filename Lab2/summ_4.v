module summ_4 (
    input wire  [3:0]op_a, op_b,
    input wire  op_c, sync,
    output wire led,
    output wire [6:0]hex
);

wire [3:0]sm;
wire c_y;
wire [4:0]y;

assign led = y[4];

sum_4 block1(
    .a_in(op_a),
    .b_in(op_b),
    .cr_in(op_c),
    .s_out(sm),
    .crp_out(c_y)
);

latch_rgstr block2(
    .d_in({c_y,sm[3:0]}),
    .clk(sync),
    .d_out(y)
);

coder block3(
    .data(y[3:0]),
    .seg(hex)
);

endmodule