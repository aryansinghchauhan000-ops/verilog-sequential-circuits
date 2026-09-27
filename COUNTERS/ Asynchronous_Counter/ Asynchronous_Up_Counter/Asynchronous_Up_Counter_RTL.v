// Asynchronous_Up_Counter_+ve_edge_clk_as_q'
module Asynchronous_Up_Counter(tff, clk, rst, q);
  
  input [2:0] tff;
  input clk, rst;
  
  output reg [2:0] q;
  
  wire [1:0] q_bar;
  
  assign q_bar[0] = ~q[0];
  assign q_bar[1] = ~q[1];
  
  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        q[0] <= 1'b0;
      else if(tff[0])
        q[0] <= #1 ~q[0];
    end
  
  always @(posedge q_bar[0] or negedge rst)
    begin
      if(!rst)
        q[1] <= 1'b0;
      else if(tff[1])
        q[1] <= #1 ~q[1];
    end
  
  always @(posedge q_bar[1] or negedge rst)
    begin
      if(!rst)
        q[2] <= 1'b0;
      else if(tff[2])
        q[2] <= #1 ~q[2];
    end
endmodule
