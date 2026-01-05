
`timescale 1ns/10ps

module summ_4_tb;

reg  [3:0] op_a, op_b;
reg  op_c;
reg  sync;
wire led;
wire [6:0] hex;
	
summ_4 test (
	.op_a(op_a),
	.op_b(op_b),
	.op_c(op_c),
	.sync(sync),
	.led (led),
	.hex (hex)
);


initial 
begin
    sync = 0;
    forever #5 sync = ~sync;
end

initial
begin
    op_a = 4'd00; op_b = 4'd00; op_c = 0; #10;
    op_a = 4'd01; op_b = 4'd03; op_c = 0; #10;
    op_a = 4'd05; op_b = 4'd03; op_c = 1; #10;
    op_a = 4'd15; op_b = 4'd01; op_c = 0; #10;
    op_a = 4'd10; op_b = 4'd05; op_c = 1; #10;
    op_a = 4'd15; op_b = 4'd15; op_c = 0; #10;
    $stop;
end

endmodule
