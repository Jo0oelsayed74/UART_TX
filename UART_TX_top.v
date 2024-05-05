module UART_TX_top (
    input [7:0] P_DATA,
    input DATA_VALID,
    input PAR_EN,
    input PAR_TYP,
    input CLK,
    input RST,
    output TX_OUT,
    output BUSY
);

wire ser_done;
wire ser_data;
wire par_bit;
wire ser_en;
wire [1:0] mux_sel;
wire data_val;


assign data_val = DATA_VALID & ~BUSY;

/*FSM fsm_inst (
	.CLK(CLK),
	.RST(RST),
    .PAR_EN(PAR_EN),
    .DATA_VALID(data_val),
    .ser_done(ser_done),
    .ser_en(ser_en),
    .mux_sel(mux_sel),
    .BUSY(BUSY)
);*/

serializer ser_inst (
    .P_DATA(P_DATA),
    .ser_en(ser_en),
	.Data_Valid(data_val),
	.CLK(CLK),
	.RST(RST),
    .ser_data(ser_data),
    .ser_done(ser_done)
);


/*parity_calc par_calc_inst (
	.CLK(CLK),
	.RST(RST),
    .P_DATA(P_DATA),
    .DATA_VALID(data_val),
    .PAR_TYP(PAR_TYP),
    .par_bit(par_bit)
);

mux mux_inst (
    .ser_data(ser_data),
    .par_bit(par_bit),
    .mux_sel(mux_sel),
    .TX_OUT(TX_OUT)
);
*/
endmodule
