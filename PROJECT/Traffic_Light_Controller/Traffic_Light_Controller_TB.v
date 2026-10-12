module tb;

  logic clk, rst;
  wire [2:0] q;

  Traffic_Light_Controller dut (clk, rst,q);

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    $display("======================================================");
    $display("          TRAFFIC LIGHT CONTROLLER TESTBENCH");
    $display("======================================================");
    $display(" TIME | CLK | RST |  Q   | TRAFFIC LIGHT");
    $display("------------------------------------------------------");

    rst = 0;   
    #12 rst = 1;  

    #30;
    $display("------------------------------------------------------");
    $display("Simulation completed.");
    $finish;
  end

  always @(q) begin
    case (q)
      3'b001: $display("%4t  |  %b  |  %b  | %03b  | RED (STOP)",
                       $time, clk, rst, q);
      3'b010: $display("%4t  |  %b  |  %b  | %03b  | YELLOW (WAIT)",
                       $time, clk, rst, q);
      3'b100: $display("%4t  |  %b  |  %b  | %03b  | GREEN (GO)",
                       $time, clk, rst, q);
      default: $display("%4t |  %b  |  %b  | %03b  | INVALID STATE",
                        $time, clk, rst, q);
    endcase
  end

endmodule
