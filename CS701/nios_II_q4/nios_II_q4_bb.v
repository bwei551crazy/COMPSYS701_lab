
module nios_II_q4 (
	addr_external_connection_export,
	clk_clk,
	hex0_external_connection_export,
	hex1_external_connection_export,
	hex2_external_connection_export,
	hex3_external_connection_export,
	hex4_external_connection_export,
	hex5_external_connection_export,
	key_external_connection_export,
	recv_external_connection_export,
	reset_reset_n,
	send_external_connection_export);	

	output	[7:0]	addr_external_connection_export;
	input		clk_clk;
	output	[6:0]	hex0_external_connection_export;
	output	[6:0]	hex1_external_connection_export;
	output	[6:0]	hex2_external_connection_export;
	output	[6:0]	hex3_external_connection_export;
	output	[6:0]	hex4_external_connection_export;
	output	[6:0]	hex5_external_connection_export;
	input	[3:0]	key_external_connection_export;
	input	[31:0]	recv_external_connection_export;
	input		reset_reset_n;
	output	[31:0]	send_external_connection_export;
endmodule
