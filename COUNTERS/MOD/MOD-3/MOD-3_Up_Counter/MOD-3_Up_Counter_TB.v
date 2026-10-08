module tb;
  reg clk, rst;
  wire [1:0] q;

  MOD_3_Up_Syn_Counter abc ( clk, rst, q );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 0;

    #7;
    rst = 1;

    #30;
    $finish;
  end

  always @(posedge clk) begin
    #1;
    $display("Time = %0t, clk = %b, rst = %b, internal dff = %b, q = %b (%0d)", $time, clk, rst, abc.dff, q, q);
end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  end
endmodule
