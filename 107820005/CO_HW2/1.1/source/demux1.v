// structural model
module demux1(a,b,enable,z);
	input a,b,enable;
	output [3:0] z;
	
	// local signals
	wire abar,bbar;

	not v0(abar,a), v1(bbar,b);
	nand n0(z[0],enable,abar,bbar);
	nand n1(z[1],enable,a,bbar);
	nand n2(z[2],enable,abar,b);
	nand n3(z[3],enable,a,b);
endmodule