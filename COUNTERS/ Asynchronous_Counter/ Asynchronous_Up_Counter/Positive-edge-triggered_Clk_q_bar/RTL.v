module Asynchronous_Up_Counter (
  input  [2:0] tff,
  input        clk, rst,
  output reg [2:0] q
);

  // Stage 0: Triggered by external clock
  always @(posedge clk or negedge rst) begin
    if (!rst)
      q[0] <= 1'b0;
    else if (tff[0])
      q[0] <= ~q[0];
  end

  // Stage 1: Triggered by falling edge of q[0] for UP-counting
  always @(negedge q[0] or negedge rst) begin
    if (!rst)
      q[1] <= 1'b0;
    else if (tff[1])
      q[1] <= ~q[1];
  end

  // Stage 2: Triggered by falling edge of q[1] for UP-counting
  always @(negedge q[1] or negedge rst) begin
    if (!rst)
      q[2] <= 1'b0;
    else if (tff[2])
      q[2] <= ~q[2];
  end

endmodule

