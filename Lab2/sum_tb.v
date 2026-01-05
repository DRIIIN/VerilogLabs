`timescale 1ns/10ps

module sum_tb;

reg  a, b, cr;
wire s, crp;

sum test (
	.a(a),
	.b(b),
	.cr(cr),
	.s(s),
	.crp(crp)
);

initial begin
	a = 0; b = 0; cr = 0; #5;
	a = 0; b = 0; cr = 1; #5;
	a = 0; b = 1; cr = 0; #5;
	a = 0; b = 1; cr = 1; #5;
	a = 1; b = 0; cr = 0; #5;
	a = 1; b = 0; cr = 1; #5;
	a = 1; b = 1; cr = 0; #5;
	a = 1; b = 1; cr = 1; #5;
	$stop;
end

endmodule