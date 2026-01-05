module sum (
	input  wire a,b,cr,
	output wire s,crp
);

assign s=(a^b)^cr;
assign crp=(a&b) | ((a^b)&cr);

endmodule