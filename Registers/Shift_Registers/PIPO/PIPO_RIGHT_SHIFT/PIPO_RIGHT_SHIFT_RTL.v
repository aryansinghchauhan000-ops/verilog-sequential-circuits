module PIPO_RIGHT_SHIFT(clk, rst, clr, ld, en, P_in, P_out, q);
  
  input [3:0] P_in;
  input clk, rst, clr, ld, en;
  
  output reg [3:0] q;
  output [3:0] P_out;
  
  assign P_out = q;
  
  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        q <= 4'b0000;
      
      else if(clr)
        q <= 4'b0000;
      
      else if( ld && en)
        q <= P_in;
      
    end
endmodule
