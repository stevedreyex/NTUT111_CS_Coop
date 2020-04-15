module fourBitSummer_tb(
 
    );
     
    reg [0:3] a;
    reg [0:3] b;
     
    wire [0:3] sum;
    wire carry;
     
    fourBitSummer test(a,b,sum,carry);
     
    initial 
        begin
            #10 a=4'b0100; b=4'b0011;
        end
     
endmodule