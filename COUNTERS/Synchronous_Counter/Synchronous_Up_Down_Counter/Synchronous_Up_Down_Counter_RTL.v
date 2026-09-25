module Synchronous_Up_Down_Counter(clk, rst, en, dir, q);
  input clk, rst, en, dir;
  output reg [3:0] q;
  
  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        q <= 4'b0000;
      else if(en)
        begin
          if(dir)
            q <= q + 1;
          else
            q <= q - 1;
        end
    end
endmodule
