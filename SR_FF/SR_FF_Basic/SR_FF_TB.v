module tb;
  reg s,r,clk;
  wire q;

  sr_ff_rtl abc(s,r,clk,q);

  always #5 clk = ~5;

  initial begin
     clk = 0;
    $monitor("Time = %0t, clk = %b, s = %b, r = %b, q = %b", $time, clk, s, r, q);
    for( int k = 0; k < 4; k++)
      begin
        {s,r} = k;
        #1;
      end
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule
    
