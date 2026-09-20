module T_FF_Basic(t,clk,q);
  input t, clk;
  output reg q;

  always @(posedge clk)
    begin
      if(t)
        q <= ~q;
      else
        q <= q;
    end
endmodule
