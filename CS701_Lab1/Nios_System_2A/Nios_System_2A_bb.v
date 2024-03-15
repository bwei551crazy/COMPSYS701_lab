
module Nios_System_2A (
	button_pio_external_connection_export,
	clocks_ref_clk_clk,
	clocks_ref_reset_reset,
	clocks_sdram_clk_clk,
	led_pio_external_connection_export,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	hex3_external_connection_export,
	hex2_external_connection_export,
	hex1_external_connection_export,
	hex0_external_connection_export,
	switches_external_connection_export,
	hex5_external_connection_export,
	hex4_external_connection_export);	

	input	[1:0]	button_pio_external_connection_export;
	input		clocks_ref_clk_clk;
	input		clocks_ref_reset_reset;
	output		clocks_sdram_clk_clk;
	output	[7:0]	led_pio_external_connection_export;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[15:0]	sdram_wire_dq;
	output	[1:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	output	[6:0]	hex3_external_connection_export;
	output	[6:0]	hex2_external_connection_export;
	output	[6:0]	hex1_external_connection_export;
	output	[6:0]	hex0_external_connection_export;
	input	[7:0]	switches_external_connection_export;
	output	[6:0]	hex5_external_connection_export;
	output	[6:0]	hex4_external_connection_export;
endmodule
