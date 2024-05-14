library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.recop_types.all;
use work.opcodes.all;
use work.various_constants.all;

entity program_counter is
	port (
		clock 	: in bit_1;
		reset 	: in bit_1; --to reset the counter
		PC_out	: out bit_16;
		mux_sel 	: in bit_2;
		rx			: in bit_16;
		ir 		: in bit_16;
		pc_write : in bit_1;
		present_out : in bit_16
	);
end entity program_counter;

architecture behaviour of program_counter is
	component Mux4_16 is
		port(
			a 			: in bit_16;
			b 			: in bit_16;
			c			: in bit_16;
			d			: in bit_16;
			mux4_sel	: in bit_2;
			mux4_out 	: out bit_16
		);
	end component Mux4_16;
	
	component reg_16 is 
		port(
			Reg_in 		: in bit_16;
			clk 			: in bit_1;
			Reg_out 		: out bit_16;
			Reg_write 	: in bit_1
		);
	end component reg_16;
		
	signal mux_out 		: bit_16;
	signal pc_out_16 		: bit_16;
	signal pc_counter		: bit_16 := x"0000";
begin
	PC_Mux_16: Mux4_16 port map (
		mux4_sel => mux_sel,
		a => pc_counter,
		b => rx,
		c => ir,
		d => present_out,
		mux4_out => mux_out
	);
	
	PC_Reg_16: reg_16 port map (
		Reg_in => mux_out,
		clk => clock,
		Reg_out => pc_out_16,
		Reg_write => pc_write
	);
	
	pc_counter <= pc_out_16 +  1 when (reset = '0') else x"0000";
	PC_out <= pc_out_16; --This PC_out is program_counter containing the address of the instruction to fetch
end architecture behaviour;
		
		