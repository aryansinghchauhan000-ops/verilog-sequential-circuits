module tb;
  reg d,clk,rst,en;
  wire q;

  D_FF_Enable abc(d,clk,rst,en,q);

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 0;
    d = 0;
    en = 0;
    
    $monitor("Time = %0t, clk = %b, rst = %b, en = %b, d = %b, q = %b", $time, clk,rst,en,d,q);
    #10;
    rst = 1;
    en =1;
    
    for(int i = 0; i < 2; i++)
      begin
        d = i;
        #10;
      end
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule
