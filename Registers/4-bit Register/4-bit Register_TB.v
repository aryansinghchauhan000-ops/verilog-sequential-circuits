module tb;
  reg clk, rst, clr, ld, en;
  reg [3:0] d;
  wire [3:0] q;

  register_4_bit abc(clk, rst, clr, ld, en, d, q);

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 0;
    clr = 0;
    ld  = 0;
    en  = 0;
    d   = 4'b0000;

    $monitor("Time=%0t | clk=%b rst=%b clr=%b ld=%b en=%b d=%b q=%b",
             $time, clk, rst, clr, ld, en, d, q);
    
    #15;
    rst = 1;
    
    #10;
    en = 1;
    ld = 1;
    d  = 4'b1010;
    
    #10;
    d  = 4'b1100;
    
    #10;
    en = 0;
    d  = 0011;
    
    #10;
    en = 1;
    ld = 0;
    
    #10;
    ld = 1;
    
    #10;
    clr = 1;
    
    #10;
    clr = 0;
    d = 4'b0101;
    
    
    #10;
    rst = 0;
    
    #10
    rst =1;
    
    $finish;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  end

endmodule
