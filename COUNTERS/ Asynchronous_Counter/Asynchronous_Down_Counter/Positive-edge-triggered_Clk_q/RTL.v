
module Asynchronous_Down_Conter(tff, clk, rst, q);
  input [2:0] tff;
  input clk, rst;
  
  output reg [2:0] q;
  
  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        q[0] <= 1'b0;
      else if(tff[0])
        q[0] <= ~q[0];
    end
  
  always @(posedge q[0] or negedge rst)
    begin
      if(!rst)
        q[1] <= 1'b0;
      else if(tff[1])
        q[1] <= ~q[1];
    end
  
  always @(posedge q[1] or negedge rst)
    begin
      if(!rst)
        q[2] <= 1'b0;
      else if(tff[2])
        q[2] <= ~q[2];
    end
endmodule
