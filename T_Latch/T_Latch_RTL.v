module t_latch(t,en,q);
  input t,en;
  output reg q;
  always @(t)
    begin
      if(en)
        q <= ~t;
    end
endmodule
