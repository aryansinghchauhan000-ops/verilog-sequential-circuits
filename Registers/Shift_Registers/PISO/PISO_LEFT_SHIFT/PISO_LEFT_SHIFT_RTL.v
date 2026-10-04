module PISO_LEFT_SHIFT(clk, rst, clr, ld, en, d, P_in, S_out, q);
  input [3:0] d;
  input [3:0] P_in;
  input clk, rst, clr, ld, en;
  
  output reg [3:0] q;
  output S_out;
  
  assign S_out = q[3];
  
  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        q <= 4'b0000;
      
      else if(clr)
        q <= 4'b0000;
      
      else if( ld && en)
        q <= d;
      
      else if(en)
        begin
          q[0]  <= P_out[0];
          q[1]  <= P_out[1];
          q[2]  <= P_out[2];
          q[3]  <= P_out[3];
        end
    end
endmodule
