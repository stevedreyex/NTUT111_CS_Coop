//Demultiplexer Test Bench
module demux_tb;
	reg a,b,enable;
	wire [3:0] s_z,d_z,b_z;

	demux1 structural(a,b,enable,s_z);
	//demux2 dataflow(a,b,enable,d_z);
	//demux3 behavioral(a,b,enable,b_z);

	initial begin
		//$dumpfile("demux.vcd"); $dumpvars(1,main);
		enable = 0; a = 0; b = 0;
		#10 enable =1;
		#10 a=1;
		#10 a=0;b=1;
		#10 a=1;
		#10 enable =0;
		//$finish;
	end
endmodule