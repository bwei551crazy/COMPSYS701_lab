library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.recop_types.all;
use work.opcodes.all;

entity reg_32 is
	port (
		instr 	: in bit_16; --Takes the top or bottom 16 bits depending on clock cycle
		reset 	: in bit_1;
		instr_32 : out bit_32
	);
end entity reg_32;

architecture behaviour of reg_32 is
	--signal combine_instr : bit_32;
	signal store_flag 	: bit_1 := '0'; --'1' for storing upper. '0' for storing lower
begin
	process(instr) 
		begin
			if reset = '1' then
				instr_32 <= x"00000000";
			elsif store_flag = '0' then
					instr_32(31 downto 16) <= instr;
					store_flag <= '1';
			else	
				instr_32(15 downto 0) <= instr;
				store_flag <= '0';
			end if;				
	end process;
end architecture behaviour;
			