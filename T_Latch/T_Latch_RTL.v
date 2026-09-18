module T_Latch (t,en,q);
  input t,en;
  output reg q;
  always @(t)
    begin
      if(en)
        q <= ~t;
      else
        q <= q;
    end
endmodule
