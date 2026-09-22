module tb;

  reg clk, rst, clr, ld, en, s_in;
  reg [3:0] d;

  wire [3:0] q;
  wire s_out;

  SISO_RIGHT_SHIFT abc(clk, rst, clr, ld, en, d, s_in, s_out, q);

  always #5 clk = ~clk;

  initial begin

    clk  = 0;
    rst  = 1;
    clr  = 0;
    ld   = 0;
    en   = 0;
    s_in = 0;
    d    = 4'b0000;

    $monitor("Time=%0t clk=%b rst=%b clr=%b ld=%b en=%b d=%b s_in=%b s_out=%b q=%b",$time, clk, rst, clr, ld, en, d, s_in, s_out, q);

    #10;
    ld = 1;
    en = 1;
    d = 4'b1010;

    #10;
    ld = 0;
    s_in = 1;

    #10;
    s_in = 1;

    #10;
    clr = 1;

    #10;
    clr = 0;
    ld = 1;
    d = 4'b1111;

    #10;
    ld = 0;
    s_in = 0;

    #10;
    s_in = 0;

    #10;
    rst = 0;

    #10;
    rst = 1;

    #10;
    $finish;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  end
endmodule
