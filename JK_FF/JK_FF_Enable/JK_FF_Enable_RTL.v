module JK_FF_Enable(j,k,clk,rst,en,q);
  input j,k,clk,rst,en;
  output reg q;

  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        q <= 1'b0;
      else if(en)
        begin
          case({j,k})
            2'b00 : q <= q;
            2'b01 : q <= 0;
            2'b10 : q <= 1;
            2'b11 : q <= ~q;
            default : q <= 1'bx;
          endcase
        end
    end
endmodule  
