module tb;
  reg j,k;
  wire q;

  j_k_latch abc(j,k,q);

  initial begin
    $monitor("Time =%0t; j = %b; k = %b; q = %b",$time, j,k,q);
    for(int i = 0; i<4; i++)
      begin
        {j,k} = i;
        #1;
      end
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule

  
