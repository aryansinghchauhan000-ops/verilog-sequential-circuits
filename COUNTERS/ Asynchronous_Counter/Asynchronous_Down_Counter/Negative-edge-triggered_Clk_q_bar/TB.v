module tb;
  reg [2:0] tff;
  reg clk, rst;
  wire [2:0] q;

  Asynchronous_Down_Conter abc(tff, clk, rst, q);

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 0;
    tff = 3'b000;

    #7;
    rst = 1;
    tff = 3'b111;

    #80;
    $finish;
  end
  
  always @(posedge clk) begin
    #1;
    $display("Time = %0t, clk = %b, rst = %b, tff = %b, q = %b (%0d)", $time, clk, rst, tff, q, q);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  end
endmodule
