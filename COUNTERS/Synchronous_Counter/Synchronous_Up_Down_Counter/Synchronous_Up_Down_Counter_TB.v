module tb;
  reg clk, rst, en, dir;
  wire [3:0]q;
  
  Synchronous_Up_Down_Counter abc(clk, rst, en, dir, q);
  
  always #5 clk = ~clk;
  initial begin
    clk = 0;
    rst = 0;
    en  = 0;
    dir = 1;
    
    $monitor("Time =%0t, clk =%b, rst =%b, en =%b, dir = %b, q= %b ", $time, clk, rst, en, dir, q);
 
    #10;  
    rst = 1;
  
    #10;
    en = 1;
  
    #150; // Up_Counter
    
    dir = 0;
    
    #160; // Down_Counter
    $finish;  
    
    #10;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end  
endmodule
  
