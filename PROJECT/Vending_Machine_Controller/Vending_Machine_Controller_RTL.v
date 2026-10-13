module vending_machine_controller (
    input  logic        clk,
    input  logic        rst,
    input  logic [3:0]  sel_inputs, // {Chips, Cake, Can, Toffee} -> [3]=D, [2]=C, [1]=B, [0]=A
    input  logic [7:0]  amount,     // inserted money
    output logic [7:0]  return_amount,
    output logic [3:0]  item_get    // output showing which item was dispensed
);

    // 1. Define FSM states
    typedef enum logic [3:0] {
        S_IDLE     = 4'b0000,
        S_CREDIT   = 4'b0001,
        S_EVAL     = 4'b0010,
        S_DISPENSE = 4'b0100,
        S_RETURN   = 4'b0101
    } state_t;

    state_t current_state, next_state;

    // 2. Price Array Look-up Table
    // Index 0 = Toffee ($5), Index 1 = Can ($10), Index 2 = Cake ($15), Index 3 = Chips ($20)
    localparam int NUM_ITEMS = 4;
    localparam logic [7:0] ITEM_PRICES [0:NUM_ITEMS-1] = '{
        8'd5,   // Toffee (A)
        8'd10,  // Can (B)
        8'd15,  // Cake (C)
        8'd20   // Chips (D)
    };

    // 3. Sequential Block (State Register)
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= S_IDLE;
        end else begin
            current_state <= next_state;
        end
    end

    // 4. Combinational Next-State & Output Logic
    always_comb begin
        // Default values to prevent latches
        next_state    = current_state;
        item_get      = 4'b0000;
        return_amount = 8'd0;

        case(current_state)
            S_IDLE: begin
                if (amount > 0) 
                    next_state = S_CREDIT;
            end

            S_CREDIT: begin
                // Wait for user to press one of the selection buttons
                if (sel_inputs != 4'b0000) 
                    next_state = S_EVAL;
            end

            S_EVAL: begin
                // Check selection and verify if inserted amount is enough
                if (sel_inputs[0] && amount >= ITEM_PRICES[0]) begin      // Toffee ($5)
                    item_get      = 4'b0001;
                    return_amount = amount - ITEM_PRICES[0];
                    next_state    = S_DISPENSE;
                end
                else if (sel_inputs[1] && amount >= ITEM_PRICES[1]) begin // Can ($10)
                    item_get      = 4'b0010;
                    return_amount = amount - ITEM_PRICES[1];
                    next_state    = S_DISPENSE;
                end
                else if (sel_inputs[2] && amount >= ITEM_PRICES[2]) begin // Cake ($15)
                    item_get      = 4'b0100;
                    return_amount = amount - ITEM_PRICES[2];
                    next_state    = S_DISPENSE;
                end
                else if (sel_inputs[3] && amount >= ITEM_PRICES[3]) begin // Chips ($20)
                    item_get      = 4'b1000;
                    return_amount = amount - ITEM_PRICES[3];
                    next_state    = S_DISPENSE;
                end
                else begin
                    // If not enough money, go back or stay in credit
                    next_state    = S_CREDIT; 
                end
            end

            S_DISPENSE: begin
                // Hold dispense for a cycle, then move to return change
                next_state = S_RETURN;
            end

            S_RETURN: begin
                // Finish transaction and go back to IDLE
                next_state = S_IDLE;
            end

            default: next_state = S_IDLE;
        endcase
    end

endmodule
