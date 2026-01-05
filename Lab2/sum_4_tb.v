`timescale 1ns/10ps

module sum_4_tb;

reg  [3:0]a_in, b_in;
reg  cr_in;
wire [3:0]s_out;
wire crp_out;

sum_4 test (
    .a_in   (a_in),
    .b_in   (b_in),
    .cr_in  (cr_in),
    .s_out  (s_out),
    .crp_out(crp_out)
);

initial begin
    a_in = 4'b0000; b_in = 4'b0000; cr_in = 0; #10;
    a_in = 4'b0001; b_in = 4'b0001; cr_in = 0; #10;
    a_in = 4'b0010; b_in = 4'b0101; cr_in = 0; #10;
    a_in = 4'b0111; b_in = 4'b0001; cr_in = 0; #10;
    a_in = 4'b1111; b_in = 4'b0001; cr_in = 0; #10;
    a_in = 4'b1111; b_in = 4'b1111; cr_in = 0; #10;
    a_in = 4'b1010; b_in = 4'b0101; cr_in = 1; #10;
    a_in = 4'b1001; b_in = 4'b0111; cr_in = 1; #10;
    a_in = 4'b1111; b_in = 4'b1111; cr_in = 1; #10;
    $stop;
end

endmodule

