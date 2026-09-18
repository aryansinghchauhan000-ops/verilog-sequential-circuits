module d_latch (d,en,q);
  input d;
  input en;
  output q;

  always @ (d,en)
    begin
      if(en)
        q <= d;
      else 
        q <= q;
    end
  end
endmodule
