module serializer (
    input [7:0] P_DATA,
    input ser_en,
    input Data_Valid,
    input CLK, RST,
    output reg ser_data,
    output reg ser_done
);

reg [7:0] shift_reg;
reg [2:0] counter;

always @(posedge CLK or negedge RST) 
	begin
		if (!RST) 
			begin
				counter <= 0;
				ser_data <= 1'b0;
				ser_done <= 1'b0;
				shift_reg <= P_DATA; 
			end
		
		else 
			begin
				if (ser_en && Data_Valid) 
					begin
						if (counter == 3'b111) 
							begin
								counter <= 0;
								ser_data <= shift_reg[0];
								shift_reg <= {shift_reg[6:0], P_DATA[7]};
								ser_done <= 1'b1; 
							end
						
						else 
							begin
								counter <= counter + 1;
								ser_data <= shift_reg[0];
								shift_reg <= {shift_reg[6:0], shift_reg[7]};
								ser_done <= 1'b0; 
							end
					end
				
				else 
					begin
						ser_data <= ser_data;
						ser_done <= ser_done;
						counter <= counter;
					end
			end
	end

endmodule
