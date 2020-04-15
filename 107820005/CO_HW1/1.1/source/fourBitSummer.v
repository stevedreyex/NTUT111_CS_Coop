module fullAdder(
   input a,
   input b,
   input carryIn,
   output sum,
   output carryOut
);
    assign {carryOut,sum}=carryIn+a+b;
endmodule

module fourBitSummer(
    input [0:3] a,
    input [0:3] b,
    output [0:3] sum,
    output carry
    );
     
    wire [0:4] oncekiBasamaktanEldeKalan;
    assign oncekiBasamaktanEldeKalan[0]=0;
     
    genvar sayac;
    generate
        for(sayac=0;sayac<4;sayac=sayac+1)
        begin: basamakBasamakTopla
            fullAdder topla(a[sayac],b[sayac],oncekiBasamaktanEldeKalan[sayac],sum[sayac],oncekiBasamaktanEldeKalan[sayac+1]);
        end
    endgenerate
    assign carry=oncekiBasamaktanEldeKalan[4];
endmodule