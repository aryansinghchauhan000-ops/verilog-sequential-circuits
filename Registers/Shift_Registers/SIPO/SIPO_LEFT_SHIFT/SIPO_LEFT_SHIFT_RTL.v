module SIPO_LEFT_SHIFT(clk,rst,clr,ld,en,d,s_in,p_out,q);

  input [3:0] d;
  input clk, rst, clr, ld, en, s_in;

  output reg [3:0] q;
  output [3:0] p_out;

  assign p_out = q;

  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        q <= 4'b0000;
      else if(clr)
        q <= 4'b0000;
      else if(en && ld)
        q <= d;
      else if(en)
        q <= {q[2:0], s_in};
    end

endmodule
