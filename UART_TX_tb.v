`timescale 1ns / 1ps

module UART_TX_tb;

parameter CLK_PERIOD = 1000000/115200; // 115.2 kHz clock period

reg [7:0] P_DATA;
reg DATA_VALID, PAR_EN, PAR_TYP, CLK, RST;
wire TX_OUT, BUSY;

// Instantiate UART_TX module
UART_TX_top uut (
    .P_DATA(P_DATA),
    .DATA_VALID(DATA_VALID),
    .PAR_EN(PAR_EN),
    .PAR_TYP(PAR_TYP),
    .CLK(CLK),
    .RST(RST),
    .TX_OUT(TX_OUT),
    .BUSY(BUSY)
);

always #((CLK_PERIOD/2)) CLK = ~CLK;

initial
	begin
		CLK = 0;
		RST = 0;
		P_DATA = 8'b10101010;
		DATA_VALID = 1;
		PAR_EN = 1;
		PAR_TYP = 0;
		
		#CLK_PERIOD
		RST = 1;
end

endmodule
