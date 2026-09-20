module tb; 
  reg d,clk; 
  wire q; 
 
  D_FF_Basic abc(d,clk,q); 
 
  always #5 clk = ~clk; 
 
  initial begin 
    clk = 0; 
    d = 0; 
 
    $monitor("Time = %0t, clk = %b, d = %b, q = %b", $time, clk, d, q); 
 
    for(int i = 0; i < 3; i++)
      begin
        d = i;
        #10;
      end
    $finish; 
  end 
 
  initial begin 
    $dumpfile("dump.vcd"); 
    $dumpvars(0,tb); 
  end 
endmodule
