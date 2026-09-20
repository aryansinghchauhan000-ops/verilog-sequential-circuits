module tb;
  reg s,r,clk,rst;
  wire q;

  SR_FF_Async_Reset abc(s,r,clk,rst,q);

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 0;
    s = 0;
    r = 0;

    $monitor("Time = %0t, clk = %b, rst = %b, s = %b, r = %b, q = %b", $time, clk, rst, s, r, q);
    #10;
    rst = 1;
    for(int k = 0; k < 4; k++)
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
