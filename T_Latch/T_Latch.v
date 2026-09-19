module tb;
  reg en, t;
  wire q;
  
  t_latch abc(t, en, q);

  initial begin
    $monitor("Time = %0t, en = %b, t = %b, q = %b", $time, en, t, q);
    for(int k = 0; k< 5; k++)
      begin
        {en, t} = k;
        #1;
      end
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule 
