// behavioral model
module demux3(a,b,enable,z);
	input a,b,enable;
	output [3:0] z;
	reg z; // not really a register!
	always @(a or b or enable)
	case ({enable,a,b})
		default: z= 4'b1111;
		3'b100:z=4'b1110;
		3'b110:z=4'b1101;
		3'b101:z=4'b1011;
		3'b111:z=4'b0111;
	endcase
endmodule