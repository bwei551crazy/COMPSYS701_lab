library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.recop_types.all;
use work.opcodes.all;

entity reg_16 is
	port (
		Reg_write 	: in bit_1;
		Reg_in		: in bit_16;
		Reg_out		: out bit_16;
		reg_reset 	: in bit_1; --remove this. Shouldn't be here
		clk			: in bit_1
	);
end entity reg_16;

architecture behaviour of reg_16 is

begin
	process(clk) 
	begin
		if reg_reset = '1' then
			Reg_out <= x"0000";
			
		elsif rising_edge(clk) then
			if Reg_write = '1' then
				Reg_out <= Reg_in;
			end if;
		end if;
	end process;
end architecture behaviour;
			