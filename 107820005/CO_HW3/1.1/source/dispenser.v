module dispenser(
            input    [1:0]   coin,//0, 10, 20, 50
            input            clock,
            input            reset,
            output           _20product,
			output			 _50product,
			output 			 change
            );

wire    [1:0]   NEXT_STATE;
reg     [1:0]   PRES_STATE;


parameter     s0  = 2'b00;		//開始請投錢
parameter     s10  = 2'b01;		//錢不足
parameter     s20 = 2'b10;		//可買20商品
parameter     s50 = 2'b11;		//可買50商品


always@(posedge clock)
begin
    if(reset == 1'b1)
        PRES_STATE <= s0;
    else
        PRES_STATE <= NEXT_STATE;
end


function [2:0] fsm;  
    input  [1:0]  fsm_coin;
    input  [1:0]  fsm_PRES_STATE;

    reg           fsm_20product;
    reg           fsm_50product;
    reg    [1:0]  fsm_NEXT_STATE;

    begin
        case(fsm_PRES_STATE)
            s0:     
               begin
                   if(fsm_coin == 2'b10)
                   begin
                       fsm_newspaper   = 1'b0;
                       fsm_NEXT_STATE  = s10;
                   end
                   else if(fsm_coin == 2'b01)
                   begin
                       fsm_newspaper   = 1'b0;
                       fsm_NEXT_STATE  = s5;
                   end
                   else
                   begin
                       fsm_newspaper   = 1'b0;
                       fsm_NEXT_STATE  = s0;
                   end
               end
            s10:     
               begin
                   if(fsm_coin == 2'b10)
                   begin
                       fsm_newspaper   = 1'b0;
                       fsm_NEXT_STATE  = s15;
                   end
                   else if(fsm_coin == 2'b01)
                   begin
                       fsm_newspaper   = 1'b0;
                       fsm_NEXT_STATE  = s10;
                   end
                   else
                   begin
                       fsm_newspaper   = 1'b0;
                       fsm_NEXT_STATE  = s5;
                   end
               end
            s20:     
               begin
                   if(fsm_coin == 2'b10)
                   begin
                       fsm_newspaper   = 1'b0;
                       fsm_NEXT_STATE  = s15;
                   end
                   else if(fsm_coin == 2'b01)
                   begin
                       fsm_newspaper   = 1'b0;
                       fsm_NEXT_STATE  = s15;
                   end
                   else
                   begin
                       fsm_newspaper   = 1'b0;
                       fsm_NEXT_STATE  = s10;
                   end
               end
            s50:     
               begin
                   fsm_newspaper   = 1'b1;
                   fsm_NEXT_STATE  = s0;
               end
           endcase

           fsm = {fsm_newspaper,fsm_NEXT_STATE};
    end
endfunction

//每当硬币放入或当前状态改变时，组合逻辑动作
assign  {_20product,NEXT_STATE} = fsm(coin,PRES_STATE);
assign  {_50product,NEXT_STATE} = fsm(coin,PRES_STATE);

endmodule