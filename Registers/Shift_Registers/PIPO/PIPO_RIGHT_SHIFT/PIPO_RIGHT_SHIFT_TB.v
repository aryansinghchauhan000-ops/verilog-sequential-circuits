module tb;
  reg clk, rst, clr, ld, en;
  reg [3:0] P_in;
  wire [3:0] P_out;
  wire [3:0] q;
  
  PIPO_RIGHT_SHIFT abc(clk, rst, clr, ld, en, P_in, P_out, q);
  
  always #5 clk = ~clk;
  
  initial begin
    clk  = 0;
    rst  = 0;
    clr  = 0;
    ld   = 0;
    en   = 0;
    P_in = 4'b0000;
    
    $monitor("Time = %0t, clk = %b, rst = %b, clr = %b, ld = %b, en = %b, P_in = %b, P_out =%b, q =%b", $time, clk, rst, clr, ld, en, P_in, P_out, q);
    
    #7;
    rst = 1;
    
    #3;
    
    @(negedge clk);
    ld   = 1;
    en   = 1;
    P_in = 4'b1111;
    
    @(negedge clk);
    ld = 0;
    
    repeat(4)
      @(negedge clk);
    clr = 1;
    
    @(negedge clk);
    clr = 0;
    ld  = 1;
    P_in = 1011;
    
    @(negedge clk);
    ld = 0;
    
    repeat(4)
      @(negedge clk);
    
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule
