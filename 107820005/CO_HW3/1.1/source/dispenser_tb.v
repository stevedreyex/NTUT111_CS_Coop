module dispenser_tb;

reg           clock;
reg           reset;
reg   [1:0]   coin;
wire          newspaper;

always #20 clock = ~clock;

initial
begin
    clock = 0;
    reset = 1;
    #100;
    reset = 0;

    @(posedge clock) coin[1:0] = 2'b00;
    @(posedge clock);
    @(posedge clock) coin[1:0] = 2'b01;
    @(posedge clock);
    @(posedge clock) coin[1:0] = 2'b10;
    @(posedge clock);

    @(posedge clock) coin[1:0] = 2'b10;
    @(posedge clock);
    @(posedge clock) coin[1:0] = 2'b10;
    @(posedge clock);
    
    @(posedge clock) coin[1:0] = 2'b00;
    @(posedge clock);
    @(posedge clock) coin[1:0] = 2'b01;
    @(posedge clock);
    @(posedge clock) coin[1:0] = 2'b01;
    @(posedge clock);
    @(posedge clock) coin[1:0] = 2'b01;

    #200 $finish;
end

initial begin
  $fsdbDumpfile("test.fsdb");
  $fsdbDumpvars();
end

vend u_vend( 
            .coin(coin),
            .clock(clock),
            .reset(reset),
            .newspaper(newspaper)
             );

endmodule