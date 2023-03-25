module tracker (
    input wire val,
    input clk, reset,
    input loop,
    output integer counterOne, counterZero
);

    always @(posedge clk) begin
        if (val == 1'b1) counterOne = counterOne + 1;
        else counterZero = counterZero + 1;
        if (loop == 1) begin counterOne = 0;counterZero = 0; end
        if (reset == 1) begin counterOne = 0;counterZero = 0; end
    end
        


    initial begin counterOne = 0; counterZero = 0; end 

endmodule