module SR_FF_Enable(s,r,clk,rst,en,q);
  input s,r,clk,rst,en;
  output reg q;

  alwaya @(posedge clk or negedge rst)
  begin
    if(!rst)
      q <= 1'b0;
    else if(en)
      begin
        case({s,r})
          2'b00 : q <= q;
          2'b01 : q <= 0;
          2'b10 : q <= 1;
          2'b11 : q <= 1'bx;
          default : q <= 1'bx;
        endcase
      end
  end
endmodule        
