module tb;
  reg j,k;
  wire q;

  j_k_latch abc(s,r,q);

  initial begin
    $monitor("Time =%b; j = %b; k = %b; q = %b",$time, j,k,q);
    for(int i = 0; i<4; i++)
      begin
        {j,k} = k;
        #1;
      end
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule

  
