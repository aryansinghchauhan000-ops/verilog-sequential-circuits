module Asynchronous_Down_Conter(tff, clk, rst, q);
  input [2:0] tff;
  input clk, rst;
  
  output reg [2:0] q;
  
  wire [1:0] q_bar;
  
  assign q_bar = ~q;
  
  always @(negedge clk or negedge rst)
    begin
      if(!rst)
        q[0] <= 1'b0;
      else if(tff[0])
        q[0] <= ~q[0];
    end
  
  always @(negedge q_bar[0] or negedge rst)
    begin
      if(!rst)
        q[1] <= 1'b0;
      else if(tff[1])
        q[1] <= ~q[1];
    end
  
  always @(negedge q_bar[1] or negedge rst)
    begin
      if(!rst)
        q[2] <= 1'b0;
      else if(tff[2])
        q[2] <= ~q[2];
    end
endmodule
