module parity_calc_tb;

    reg [7:0] P_DATA;
    reg DATA_VALID;
    reg PAR_TYP;
    reg CLK, RST;
    wire par_bit;
	
	parity_calc dut (
	.P_DATA(P_DATA),
	.DATA_VALID(DATA_VALID),
	.PAR_TYP(PAR_TYP),
	.CLK(CLK),
	.RST(RST),
	.par_bit(par_bit)
	);
	
	always #((10 / 2)) CLK = ~CLK;
	
	initial begin
        CLK = 0;
        RST = 0;
		
		#10
		RST = 1;
		P_DATA = 8'b11010010;
		DATA_VALID = 0;
		PAR_TYP = 0; 
		//par bit = 0

		#10
		P_DATA = 8'b11010010;
		DATA_VALID = 1;
		PAR_TYP = 0;
		//par bit = 0
		
		
		#10
		P_DATA = 8'b11010010;
		DATA_VALID = 1;
		PAR_TYP = 1;
		// par bit = 1
		
		#10
		P_DATA = 8'b11010011;
		DATA_VALID = 1;
		PAR_TYP = 0;
		// par bit = 1

		#10
		P_DATA = 8'b11010010;
		DATA_VALID = 1;
		PAR_TYP = 1;	
		// par bit = 1		
		
		#100
		$stop;
		
	end
	
	endmodule