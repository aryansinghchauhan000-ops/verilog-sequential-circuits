module MOD_3_Up_Syn_Counter (clk, rst, q);
  input clk, rst;
  output reg [1:0]q;
  wire [1:0] dff;
  
  assign dff[0] = ~q[1] & ~q[0];
  assign dff[1] = ~q[1] &  q[0];
  
  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        q <= 2'b00;
      else
        q <= dff;
    end
endmodule
