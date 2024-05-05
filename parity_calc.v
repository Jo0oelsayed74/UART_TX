module parity_calc (
    input [7:0] P_DATA,
    input DATA_VALID,
    input PAR_TYP,
    input CLK, RST,
    output reg par_bit
);

reg [7:0] data_reg;
reg parity;

always @(posedge CLK or negedge RST) 
	begin
		if (!RST) 
			begin
				data_reg <= P_DATA; 
				parity <= 1'b0; 
			end 
			
		else if (DATA_VALID)
			begin
				parity = ^P_DATA; 
				
				if (PAR_TYP) 
					begin
						par_bit <= ~parity; // Odd parity
					end 
				else 
					begin
						par_bit <= parity; // Even parity
					end
			end
	end

endmodule
