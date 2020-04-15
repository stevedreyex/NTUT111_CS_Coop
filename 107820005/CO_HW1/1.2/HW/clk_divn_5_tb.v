module clk_divn_5_tb();
reg reset = 0;
initial begin
$dumpfile("clk_divn_5_tb.vcd");
$dumpvars(0,clk_divn_5_tb);
 
# 17 reset = 1;
# 11 reset = 0;
# 29 reset = 1;
# 5 reset =0;
# 513 $finish;
end
 
reg clk = 0;
always #1 clk = !clk;
 
wire clk_out;
clk_divn_5 c1 (.clk(clk),
.clk_out(clk_out));
 
initial
$monitor("At time %t, value = %h (%0d)",
$time, clk_out, clk_out);
endmodule // clk_divn_5_tb