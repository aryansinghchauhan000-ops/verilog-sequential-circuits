module D_FF_Async_Reset(d,clk,rst,q);
  input d,clk,rst;
  output reg q;

  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        q <= 1'b0;
      else
        q <= d;
    end
endmodule
