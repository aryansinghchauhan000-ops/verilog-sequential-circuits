module PISO_RIGHT_SHIFT(clk, rst, clr, ld, en, P_in, S_out, q);
  
  input [3:0] P_in;
  input clk, rst, clr, ld, en;
  
  output reg [3:0] q;
  output S_out;
  
  assign S_out = q[0];
  
  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        q <= 4'b0000;
      
      else if(clr)
        q <= 4'b0000;
      
      else if( ld && en)
        q <= P_in;
      
      else if(en)
        q <= { 1'b0, q[3:1]};
      
    end
endmodule
