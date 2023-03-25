module counterPeripheralController(
    output [3:0] anode_sel,
    output [6:0] led_out,
    input clk,
    input reset,
    input [4:0] button_input
);
    wire button_pressed, button_not_pressed;
    assign button_pressed = 1;
    assign button_not_pressed = 0;

    wire [4:0] button_out;

    wire [7:0] Q;

    reg [7:0] Q_next;

    wire [7:0] tempLocal;

    assign tempLocal[4:0] = button_out;

    debouncer debouncer_unit(.reset(reset), .clk(clk), .button_in(button_input), 
    .button_out(button_out));
    seven_segment_controller display_unit(.reset(reset), .clk(clk), .temp(Q),
    .anode_select(anode_sel), .LED_out(led_out));
    d_ff_reset flip_flop_unit0(.clk(clk), .reset(reset), .d(Q_next[0]), .q(Q[0]));
    d_ff_reset flip_flop_unit1(.clk(clk), .reset(reset), .d(Q_next[1]), .q(Q[1]));
    d_ff_reset flip_flop_unit2(.clk(clk), .reset(reset), .d(Q_next[2]), .q(Q[2]));
    d_ff_reset flip_flop_unit3(.clk(clk), .reset(reset), .d(Q_next[3]), .q(Q[3]));
    d_ff_reset flip_flop_unit4(.clk(clk), .reset(reset), .d(Q_next[4]), .q(Q[4]));
    d_ff_reset flip_flop_unit5(.clk(clk), .reset(reset), .d(Q_next[5]), .q(Q[5]));
    d_ff_reset flip_flop_unit6(.clk(clk), .reset(reset), .d(Q_next[6]), .q(Q[6]));
    d_ff_reset flip_flop_unit7(.clk(clk), .reset(reset), .d(Q_next[7]), .q(Q[7]));

    reg lock;

    initial begin
        lock = 1'b0;
    end

    always @ (posedge clk) begin
        if(lock == 1'b0) begin
            if (button_out[0] == button_pressed || button_out[3] == button_pressed) Q_next = Q + 1;
            else if(button_out[1] == button_pressed || button_out[2] == button_pressed) Q_next = Q - 1;
            else if (button_out[4] == button_pressed) Q_next = 22;
            else;
            lock = 1'b1;
        end
        else if (button_out == 5'b00000) lock = 1'b0;
        else ;
    end

endmodule