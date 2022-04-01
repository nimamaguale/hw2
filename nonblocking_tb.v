`timescale 1ns/1ps
module blocking_tb;
reg clk;
reg rst_n;
reg a_i, b_i;
wire a_o, b_o;
parameter PERIOD = 20;
parameter real DUTY_CYCLE = 0.5;
parameter OFFSET = 0;
// clock process
initial
begin
    #OFFSET;
    forever
    begin
        clk = 1'b0;
        #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
        #(PERIOD*DUTY_CYCLE);
    end
end
initial
begin
    rst_n = 1'b0;
    a_i = 1'b1;
    b_i = 1'b0;
    #5 rst_n = 1'b1;
    #100 $finish;
end
initial
begin
    $dumpfile("nonblocking.vcd");
    $dumpvars(0, nonblocking_tb);
end
nonblocking nonblocking_tb (
                .clk(clk),
                .rst_n(rst_n),
                .a_i(a_i),
                .b_i(b_i),
                .a_o(a_o),
                .b_o(b_o) );
endmodule
