module counterPeripheralController(
    input clk,
    input reset,
    output [15:0] led,
    input [4:0] button_input
);
    wire [14:0] lfsr_out;
    wire max_tick;
    wire scaled_clock;


    clockDivider clock_unit(.clk(clk), .clk_out(scaled_clock), .clkscale(50000000));
    board_lfsr lfsr_unit(.clk_in(scaled_clock), .reset(reset), .lfsr_out(lfsr_out), .max_tick(max_tick));    
    tracker tracker_unit(.val(1'b1));

    assign led = {lfsr_out, max_tick};

endmodule