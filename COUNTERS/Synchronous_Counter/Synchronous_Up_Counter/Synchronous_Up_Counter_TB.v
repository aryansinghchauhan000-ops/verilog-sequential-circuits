module tb;
  reg clk, rst, en;
  wire [3:0]q;
  
  Synchronous_Up_Counter abc(clk, rst, en, q);
  
  always #5 clk = ~clk;
  initial begin
    clk = 0;
    rst = 0;
    en  = 0;
    
    $monitor("Time =%0t, clk =%b, rst =%b, en =%b, q=%b ", $time, clk, rst, en, q);
 
    #10;  
    rst = 1;

    #10;
    en = 1;
    
    #160;
    $finish;  
    
    #10;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end  
endmodule
  
