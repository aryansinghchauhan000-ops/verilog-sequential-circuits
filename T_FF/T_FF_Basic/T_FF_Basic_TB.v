module tb;
  reg t,clk;
  wire q;

  T_FF_Basic abc(t,clk,q);

  always #5 clk = ~clk;
  initial begin
    clk = 0;
    t = 0;

    $monitor("Time = %0t, clk = %b, t = %b, q =%b", $time, clk, t, q);
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
