module T_FF_Basic(t, clk,q);
  input t, clk;
  output reg q = 1'b0;

  always @(posedge clk)
    begin
      if(t)
        q <= ~q;
    end
endmodule
