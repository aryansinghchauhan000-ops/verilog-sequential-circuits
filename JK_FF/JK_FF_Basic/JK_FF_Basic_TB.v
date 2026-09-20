module tb;
  reg j,k,clk;
  wire q;

  JK_FF_Basic abc(j, k, q);

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    j = 0;
    k = 0;
    $monitor("Time = %0t, clk = %b, j = %b, k = %b, q = %b", $time, clk, j, k, q);
    for(int i = 0; i < 4; i++)
      begin
        {j,k} = i;
        #10;
      end
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule
