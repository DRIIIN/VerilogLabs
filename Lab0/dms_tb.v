`timescale 1ns/100ps

module dms_tb;

reg test_line;
reg [1:0] test_adr;
wire test_data0;
wire test_data1;
wire test_data2;
wire test_data3;

dms test (
	.line(test_line),
	.adr(test_adr),
	.data0(test_data0),
	.data1(test_data1),
	.data2(test_data2),
	.data3(test_data3)
);

initial begin
	test_line = 1'b1;   test_adr = 2'h0; #200;
						test_adr = 2'h1; #200;
						test_adr = 2'h3; #200;
						test_adr = 2'h0; #200;
						test_adr = 2'h2; #200;
						test_adr = 2'h1; #200;
						test_adr = 2'h3; #200;
						test_adr = 2'h0; #200;
	$stop;
end

endmodule
