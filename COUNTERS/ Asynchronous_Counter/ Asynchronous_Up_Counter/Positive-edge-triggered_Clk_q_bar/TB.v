module tb;

  reg [2:0] tff;
  reg clk = 0;
  reg rst;

  wire [2:0] q;

  Asynchronous_Up_Counter abc (
    .tff(tff),
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  // Clock generation (10ns period)
  always #5 clk = ~clk;

  initial begin
    tff = 3'b111;
    rst = 0;

    #7 rst = 1;

    #80 $finish;
  end

  // Sample q after ripple transitions settle
  always @(negedge clk) begin
    if (rst) 
      $display("Time = %0t, Settled q = %b (%0d)", $time, q, q);
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  end

endmodule
