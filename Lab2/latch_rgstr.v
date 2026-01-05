module latch_rgstr #(parameter N=5)(
    input [N-1:0] d_in,
    input clk,
    output [N-1:0]d_out
);

reg     [N-1:0]q;
assign  d_out=q;
always@ (posedge clk)

begin
    q<=d_in;
end

endmodule
