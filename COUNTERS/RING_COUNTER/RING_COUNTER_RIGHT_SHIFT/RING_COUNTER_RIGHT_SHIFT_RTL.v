module Ring_Counter (clk, rst, clr, le, en, dff, s_in, s_out, q);
  input [2:0]dff;
  input clk, rst, clr, ld, en;

  output reg [2:0]q;

  wire [2:0] d_next;

  assign d_next[0] = q[2];
  assign d_next[1] = q[0];
  assign d_next[2] = q[1];
  
  assign s_out = q[2];

  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        q <= 3'b000;
      
      else if (clr)
        q <= 3'b000;

      else if (ld && en)
        q <= dff;

      else if(en)
        q <= {[1:0], s_in };

    end
endmodule
  
      
