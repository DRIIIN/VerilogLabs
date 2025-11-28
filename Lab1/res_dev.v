module res_dev (
    input  wire [3:0] res_data,
    input  wire [1:0] res_adr,
    output wire [6:0] res_data0,
    output wire [6:0] res_data1,
    output wire [6:0] res_data2,
    output wire [6:0] res_data3
);

wire [6:0] res_seg;

coder res_coder (
	.data(res_data),
	.seg (res_seg)
);

dms7 res_dms7 (
	.line (res_seg),
	.adr  (res_adr[1:0]),
	.data0(res_data0),
	.data1(res_data1),
	.data2(res_data2),
	.data3(res_data3)
);

endmodule

