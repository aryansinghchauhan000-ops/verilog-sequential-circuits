module tb;
  reg j,k,clk,rst,en;
  wire q;

  JK_FF_Enable abc(j,k,clk,rst,en,q);

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 0;
    j = 0;
    k = 0;
    en = 0;

    $monitor("Time = %0t, clk = %b, rst = %b,en = %b, j = %b, k = %b, q = %b", $time, clk,rst,en,j,k,q);
    #10;
    rst = 1;
    en = 1;
    for(int i = 0; i<4; i++)
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
