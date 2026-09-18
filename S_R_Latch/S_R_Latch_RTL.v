module s_r_latch (s,r,q);
  input s,r;
  output reg q;

  always @(s,r)
    begin
      case({s,r})
        2'b 00 : q <=q;
        2'b 01 : q <=0;
        2'b 10 : q <=1;
        2'b 11 : q <=1'bx;
      endcase
    end
endmodule
