module tb;
  reg clk, rst, clr, ld, en, s_in;
  reg [3:0] d;
  wire [3:0] q;
  wire [3:0] s_out;

  SIPO_LEFT_SHIFT abc(clk,rst,clr,ld,en,d,s_in,s_out,q);

  always #5 clk = ~clk;

  initial begin
    clk  = 0;
    rst  = 0;
    clr  = 0;
    ld   = 0;
    en   = 0;
    d    = 4'b0000;
    s_in = 0;

    $monitor("Time=%0t clk=%b rst=%b clr=%b ld=%b en=%b d=%b s_in=%b s_out=%b q=%b",$time, clk, rst, clr, ld, en, d, s_in, s_out, q);

    #10;
    rst = 1;

    #5;
    ld = 1;
    en = 1;
    d = 4'b1010;

    #10;
    ld = 0;

    s_in = 1;
    #10;

    s_in = 1;
    #10;

    s_in = 1;
    #10;

    s_in = 1;
    #10;

    $finish;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  end

endmodule
