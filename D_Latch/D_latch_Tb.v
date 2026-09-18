module tb;
  reg en,d;
  wire q;

  d_latch abc(d,en,q);

  initial begin
    $monitor("Time =%0t, en = %b, d = %b, q = %b", $time, en, d, q);
    for(int k = 0; k <4; k++)
      begin
        {en,d} = k;
        #1;
      end
    $finish;
  end
  initial begin
    $dumplife("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule
