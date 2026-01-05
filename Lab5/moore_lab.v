module moore_lab (
    input clk,flag,
    input reset,
    input [2:0] a,
    input [2:0] b,
    output reg [2:0] out
);

reg [2:0] state;
reg [1:0] cnt;
parameter Res = 0, Weit = 1, Flag_read= 2, A_out = 3, B_out = 4, Fin = 5;

always @ (posedge clk or posedge reset)

begin
if(reset)
    state <= Res;
else
    begin
    case (state)
        Res:
            state <= Weit;
        Weit:
            if(cnt == 2'd3)
                state <= Flag_read;
        Flag_read:
            if(!flag)
                state <= A_out;
            else
                state <= B_out;
        A_out:
            if(cnt == 2'd2)
                state <= Fin;
        B_out:
            if(cnt == 2'd2)
                state <= Fin;
        Fin:
            state <= Weit;
        default:
            state <= Res;
    endcase
    end
end

always @ (posedge clk)

begin
case(state)
    Res:
        begin
        cnt <= 2'd0;
        out <= 3'b000;
        end
    Weit:
        begin
        if(cnt == 2'd3)
            cnt <= 2'd0;
        else
            cnt <= cnt + 2'd1;
            out <= 3'b000;
        end
    A_out:
        begin
        if (cnt == 2'd2)
            cnt <= 2'd0;
        else
            cnt <= cnt + 2'd1;
            out <= a;
        end
    B_out:
        begin
        if (cnt == 2'd2)
            cnt <= 2'd0;
        else
            cnt <= cnt + 2'd1;
            out <= b;
        end
endcase
end

endmodule