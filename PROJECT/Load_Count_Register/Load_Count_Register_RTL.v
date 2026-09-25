module Load_Count_Register(t,clk, rst, clr, ld, en, dir_count, dir_s_in, s_in, s_out,q,count);
  
  input [3:0]t;
  input clk, rst, clr, ld, en;
  input dir_count, dir_s_in ,s_in;
  
  output reg [3:0]q;
  output reg [3:0]count;
  output s_out;
  
  assign s_out = (dir_s_in) ? q[3] : q[0];
  
  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        begin
          q     <= 4'b0000;
          count <= 4'b0000;
        end
      
      else if (clr)
        begin
          q     <= 4'b0000;
          count <= 4'b0000;
        end
      
      else if(ld && en)
        begin
          q <= t;
          
          if (dir_count)
                count <= count + 1;
            else
                count <= count - 1;
        end
      
      else if (en)
        begin
            if (dir_s_in)
              begin
                q <= {q[2:0], s_in};

                if (dir_count)
                    count <= count + 1;
                else
                    count <= count - 1;
            end
          
            else
              begin
                q <= {s_in, q[3:1]};

                if (dir_count)
                    count <= count + 1;
                else
                    count <= count - 1;
            end
        end
    end
endmodule
