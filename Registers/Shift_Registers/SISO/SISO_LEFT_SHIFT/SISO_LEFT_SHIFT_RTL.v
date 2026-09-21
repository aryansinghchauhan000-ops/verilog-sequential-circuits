module SISI(clk, rst, clr, ld, en, d, s_in, s_out, q);
  input [3:0]d;
  input clk,rst,clr,ld,en, s_in;
  output reg [3:0] q;
  output s_out;
  
  assign s_out = q[0];
  
  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        begin
          q <= 4'b0000;
        end
      
      else if(clr)
        begin
          q <= 4'b0000;
        end
      
      else if(en && ld)
        q <= d;
        
      else if(en)
        q <= {s_in, q[3:1]}; 
    end
endmodule
