module FSM_tb ;

	reg CLK;
    reg RST;
    reg PAR_EN;
    reg DATA_VALID;
    reg ser_done;
    wire ser_en;
    wire [1:0] mux_sel;
    wire BUSY;
	
	FSM dut (
	.CLK(CLK),
	.RST(RST),
	.PAR_EN(PAR_EN),
	.DATA_VALID(DATA_VALID),
	.ser_done(ser_done),
	.ser_en(ser_en),
	.mux_sel(mux_sel),
	.BUSY(BUSY)
	);
	
	always #((10 / 2)) CLK = ~CLK;
	
		initial begin
        CLK = 0;
        RST = 0;
		
		#10
		RST = 1;
		PAR_EN = 1;
		DATA_VALID = 1;
		ser_done = 1;
		
		#100
		$stop;
		end
		
		endmodule