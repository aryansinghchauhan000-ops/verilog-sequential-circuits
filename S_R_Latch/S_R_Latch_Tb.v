module tb;
  reg s,r;
  wire q;

  S_R_latch abc(s,r,q);

  initial begin
    $monitor("Time =%0t, s = %b, r = %b , q = %b", $time, s, r, q);
    for( int i= 0; i<4; i++)
      begin
        {s,r} = i;
        #1;
      end
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule
