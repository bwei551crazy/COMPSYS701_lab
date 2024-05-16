library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.recop_types.all;
use work.opcodes.all;

entity address_register is 
	port (
		addr_reg_write : in bit_1;
		Op2		 		: in bit_16; --need to determine which registers to use for determining the register
		addr_reset		: in bit_1;
		addr_reg_out	: out bit_16;
		clk				: in bit_1
	);
end entity address_register;
	
architecture behaviour of address_register is 

signal temp_reg_out : bit_16;

begin 

	process(clk) 
		variable temp_op2 : bit_16;
	begin
		if addr_reset = '1' then
			temp_op2 := x"0000";
			temp_reg_out <= temp_op2;
		elsif rising_edge(clk) then
			if addr_reg_write = '1' then
				temp_op2 := Op2;
				temp_reg_out <= temp_op2;
			end if;
		end if;
	end process;
	addr_reg_out <= temp_reg_out;
end architecture behaviour;
		