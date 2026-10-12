module Traffic_Light_Controller(
  input clk, rst,
  output reg [2:0] q
);
  
  typedef enum logic [2:0]{
    RED    = 3'b001,
    YELLOW = 3'b010,
    GREEN  = 3'b100
  } state_t;
  
  state_t state, next_state;
  
  always_comb
    begin
      case(state)
        RED     : next_state = YELLOW;
        YELLOW  : next_state = GREEN;
        GREEN   : next_state = RED;
        default : next_state = RED;
      endcase
    end
  
  always_ff @(posedge clk or negedge rst)
    begin
      if(!rst)
        state <= RED;
      else
        state <= next_state;
    end
  
  assign q = state;

endmodule

