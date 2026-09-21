module T_FF_Sync_Reset(t,clk,rst,q);
  input t,clk,rst;
  output reg q = 1'b0;

  always @(posedge clk)
    begin
      if(rst)
        q <= 1'b0;
      else if(t)
        q <= ~q;
    end
endmodule
