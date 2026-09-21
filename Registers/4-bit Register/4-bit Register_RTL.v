module register_4_bit(clk,rst,clr,ld,en,d,q);
  input [3:0]d;
  input clk,rst,clr,ld,en;
  output reg [3:0]q;

  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        q <= 4'b0000;
      else if(clr)
        q <= 4'b0000;
      else if(en && ld)
        q <= d;
      else
        q <= q;
    end
endmodule
