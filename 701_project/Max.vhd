library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.recop_types.all;
use work.opcodes.all;

entity Max is
	port (
		Rz : in bit_16;
		Rx : in bit_16;
		clk : in bit_1;
		output : out bit_16
	);
end entity Max;

architecture behaviour of Max is 
begin
	process(clk) 
	begin
		if (Rz > Rx) then
			output <= Rz;
		else
			output <= Rx;
		end if;
	end process;
end architecture behaviour;

	

