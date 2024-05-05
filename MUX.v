module mux (
    input ser_data,
    input par_bit,
    input [1:0] mux_sel,
    output reg TX_OUT
);

always @*
	begin
		case (mux_sel)
			2'b00: TX_OUT = 0; //Start Bit
			2'b01: TX_OUT = 1; //Stop Bit
			2'b10: TX_OUT = ser_data;
			2'b11: TX_OUT = par_bit;
			default: TX_OUT = 0;
		endcase
			
	end
	
endmodule
