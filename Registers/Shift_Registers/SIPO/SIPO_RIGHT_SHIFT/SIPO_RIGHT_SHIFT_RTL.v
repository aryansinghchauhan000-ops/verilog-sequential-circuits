module SIPO_RIGHT_SHIFT(clk, rst, clr, ld, en, d, s_in, p_out, q); 
  input [3:0]d;
  input clk, rst, clr, ld, en, s_in;
  
  output reg [3:0]q; 
  output p_out;
  
  assign p_out = q[0];
  
  always @(posedge clk or negedge rst)
    begin
      if(~rst)
        q <= 4'b0000;
      
      else if (clr)
        q <= 4'b0000;
      
      else if( ld && en)
        q <= d;
      
      else if (en)
        q <= { s_in, q[3:1]};
    end
endmodule
