module tb;
  reg clk, rst;
  wire [2:0] q;

  MOD_5_Down_Syn_Counter abc ( clk, rst, q );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 0;

    #7;
    rst = 1;

    #55;
    $finish;
  end

  always @(posedge clk) begin
    #1;
    $display("Time = %0t, clk = %b, rst = %b, internal d_next = %b, q = %b (%0d)", $time, clk, rst, abc.d_next, q, q);
end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  end
endmodule
