module tb;
  reg en t;
  wire q;
  
  t_latch abc(t, en, q);

  initia begin
    $moitor("Time = %0t, en = %b, t = %b, q = %b", $time, en, t,q);
    for(int k = 0; k< 4; k++)
      begin
        {en, t} = k
        #1;
      end
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule 
