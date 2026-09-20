module D_FF_Enable(d,clk,rst,en,q);
  input d,clk,rst,en;
  output reg q;

  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        q <= 1'b0;
      else if(en)
        q <= d;
    end
endmodule
