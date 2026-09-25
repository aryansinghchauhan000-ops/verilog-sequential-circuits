module Synchronous_Up_Counter(clk, rst, en, q);
  input clk, rst, en;
  output reg [3:0] q;
  
  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        q <= 4'b0000;
      else if(en)
        q <= q+1;
    end
endmodule
