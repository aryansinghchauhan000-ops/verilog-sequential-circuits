module MOD_3_Down_Syn_Counter (clk, rst, q);
  input clk, rst;
  output reg [1:0]q;
  wire [1:0] d_next;
  
  assign d_next[0] =  q[1] & ~q[0];
  assign d_next[1] = ~q[1] & ~q[0];
  
  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        q <= 2'b00;
      else
        q <= d_next;
    end
endmodule
