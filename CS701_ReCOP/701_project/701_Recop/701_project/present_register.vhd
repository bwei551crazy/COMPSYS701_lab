library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.recop_types.all;
use work.opcodes.all;

entity present_register is 
	port (
		operand 		: in bit_16;
		rz 			: in bit_16;
		clk			: in bit_1;
		present_wr 	: in bit_1;
		present_out : out bit_16
		);
end entity present_register;

architecture behaviour of present_register is
signal store : bit_16;
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if present_wr = '1' then
				if rz = x"0000" then
					store <= operand;
				end if;
			end if;
		end if;
	end process;
	
end architecture behaviour;