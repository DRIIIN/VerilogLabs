module shift_reg (
	input  clk, reset,
	input  [3:0] data_in,
	output [3:0] s0,
	output [3:0] s1,
	output [3:0] s2,
	output [3:0] s3,
	output [3:0] s4,
	output [3:0] s5
);

reg [3:0] shift_reg [5:0];
assign  s0 = shift_reg[0];
assign  s1 = shift_reg[1];
assign  s2 = shift_reg[2];
assign  s3 = shift_reg[3];
assign  s4 = shift_reg[4];
assign  s5 = shift_reg[5];
integer i;

always @(posedge clk, posedge reset) 

begin
	if(reset)
		begin
			for (i = 0; i < 6; i = i + 1)
				shift_reg[i] <= 0;
		end
	else
		begin
			for ( i = 1; i < 6; i = i + 1)
				shift_reg[i] <= shift_reg[i - 1];
				shift_reg[0] <= data_in;
		end
end

endmodule

