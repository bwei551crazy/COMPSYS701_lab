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
		Op1_out 	: in bit_16;
		pc_write : in bit_1;
		present_out : in bit_16
	);
end entity program_counter;

architecture behaviour of program_counter is
	component Mux3_16 is
		port(
			a 			: in bit_16;
			b 			: in bit_16;
			c			: in bit_16;
			mux3_sel	: in bit_2;
			mux3_out 	: out bit_16
		);
	end component Mux3_16;
	
--	component reg_16 is 
--		port(
--			Reg_in 		: in bit_16;
--			clk 			: in bit_1;
--			Reg_out 		: out bit_16;
--			Reg_write 	: in bit_1;
--			reg_reset 	: in bit_1
--		);
--	end component reg_16;
		
	signal mux_out 		: bit_16;
	signal pc_counter		: bit_16 := x"0000";
begin
	PC_Mux_16: Mux3_16 port map (
		mux3_sel => mux_sel,
		a => pc_counter,
		b => Op1_out,  --As long as the PC option isn't selected, should not have conflicts
		c => present_out,
		mux3_out => mux_out
	);
	
--	PC_Reg_16: reg_16 port map (
--		Reg_in => mux_out,
--		clk => clock,
--		reg_reset => reset, 
--		Reg_out => pc_out_16,
--		Reg_write => pc_write
--	);
	process(clock) 
		variable pc_increment : bit_16;
	begin
		if reset = '1' then
			pc_increment := x"0000";
		elsif rising_edge(clock) then
				pc_increment := mux_out + 1;
			if pc_write = '1' then
				pc_counter <= pc_increment;
			end if;
		end if;
	end process;
		
	PC_out <= pc_counter; --This PC_out is program_counter containing the address of the instruction to fetch
end architecture behaviour;
		
		