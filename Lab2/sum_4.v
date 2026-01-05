module sum_4(
    input  wire [3:0]a_in, b_in,
    input  wire cr_in,
    output wire [3:0]s_out,
    output wire crp_out
);

wire [2:0]crp_n;

sum sum0(
    .a (a_in[0]),
    .b (b_in[0]),
    .cr(cr_in),
    .s(s_out[0]),
    .crp(crp_n[0])
);

sum sum1(
    .a(a_in[1]),
    .b(b_in[1]),
    .cr(crp_n[0]),
    .s(s_out[1]),
    .crp(crp_n[1])
);

sum sum2(
    .a (a_in[2]),
    .b (b_in[2]),
    .cr(crp_n[1]),
    .s(s_out[2]),
    .crp(crp_n[2])
);

sum sum3(
    .a (a_in[3]),
    .b (b_in[3]),
    .cr(crp_n[2]),
    .s(s_out[3]),
    .crp(crp_out)
);

endmodule
