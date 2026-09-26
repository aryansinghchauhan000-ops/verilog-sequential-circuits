module Asynchronous_Up_Counter(tff, clk, q);
  input [3:0]tff;
  input clk;
  output reg [3:0] q;

  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        q <= 4'b000;
      else
        q <= ~t;
    end

  always @(negedge q[0] or negedge rst)
    begin
      if(
