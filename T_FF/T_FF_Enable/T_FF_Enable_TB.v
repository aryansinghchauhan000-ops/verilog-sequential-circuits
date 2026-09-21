module tb;
  reg t,clk,rst,en;
  wire q;

  T_FF_Enable abc(t,clk,rst,en,q);

  always #5 clk = ~clk;
  initial begin
    clk = 0;
    rst = 0;
    t = 0;
    en = 0;

    $monitor("Time = %0t, clk = %b, rst = %b, t = %b, q =%b", $time, clk, rst, t, q);
    #10;
    rst = 1;
    en = 1;
    
    for(int i = 0; i < 3; i++)
      begin
        t = i;
        #10;
      end
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule
