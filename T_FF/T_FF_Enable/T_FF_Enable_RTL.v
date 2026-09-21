module T_FF_Enable(t,clk,rst,en,q);
  input t,clk,rst,en;
  output reg q = 1'b0;

  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        q <= 1'b0;
      else if(en && t)
        q <= ~q;
    end
endmodule
