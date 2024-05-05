module serializer_tb;


    // Signals
    reg CLK, RST, ser_en, Data_Valid;
    reg [7:0] P_DATA;
    wire ser_data, ser_done;

    serializer dut (
        .P_DATA(P_DATA),
        .ser_en(ser_en),
		.Data_Valid(Data_Valid),
        .CLK(CLK),
        .RST(RST),
        .ser_data(ser_data),
        .ser_done(ser_done)
    );

    // Clock generation
    always #((10 / 2)) CLK = ~CLK;

    // Initial values
    initial begin
        CLK = 0;
        RST = 0;
        ser_en = 0;
		Data_Valid = 0;
        P_DATA = 8'b10111011; // Input data for testing
		#10
		RST = 1;
		ser_en = 1;
		Data_Valid = 1;
		#100
		$stop;
    end


endmodule
