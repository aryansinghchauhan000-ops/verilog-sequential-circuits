module tb;
  reg s,r,clk,rst;
  wire q;

  SR_FF_Sync_Reset abc(s,r,clk,rst,q);

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    s = 0;
    r = 0;

    $monitor("Time = %0t, s = %b, r = %b, clk = %b, rst = %b, q = %b", $time, s,r,clk,rst,q);

    #10;
    rst = 0;
    
    for(int k =0; k <4; k++)
      begin
        {s,r} = k;
        #10;
      end
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule
