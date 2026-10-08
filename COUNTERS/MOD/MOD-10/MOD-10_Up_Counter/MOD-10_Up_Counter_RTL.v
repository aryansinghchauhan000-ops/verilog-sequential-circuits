module MOD_10_Up_Syn_Counter (clk, rst, q);
  input clk, rst;
  output reg [3:0]q;
  wire [3:0] d_next;
  
  assign d_next[0] = ( ~q[3] & ~q[0]) | ( ~q[2] & ~q[1] & ~q[0]);
  
  assign d_next[1] = ( ~q[3] & ~q[1] & q[0]) | ( ~q[3] & q[1] & ~q[0]);
  
  assign d_next[2] = ( ~q[3] & ~q[2] & q[1] & q[0]) | ( ~q[3] &  q[2] & ~q[1] ) |( ~q[3] & q[2] & ~q[0] );
  
  assign d_next[3] = ( ~q[3] &  q[2] & q[1] & q[0]) | (  q[3] & ~q[2] & ~q[1] & ~q[0]);
  
  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        q <= 3'b0000;
      else
        q <= d_next;
    end
endmodule
