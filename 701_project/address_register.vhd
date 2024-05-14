library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.recop_types.all;
use work.opcodes.all;

entity address_register is 
	port (
		reg_write 		: in bit_1;
		operand 	 		: in bit_16;
		rz			 		: in bit_16; --need to determine which registers to use for determining the register
		rx 				: in bit_16;
		addr_mux_sel	: in bit_1; 
		addr_reset		: in bit_1;
		addr_reg_out	: out bit_16;
		clk				: in bit_1
	);
end entity address_register;
	
architecture behaviour of address_register is 

component Mux3_16 

	port (
		a 			: in bit_16;
		b 			: in bit_16;
		c			: in bit_16;
		mux3_sel	: in bit_1;
		mux3_out	: out bit_16
	);
	
end component Mux3_16;

component reg_16 

	port (
		Reg_write 	: in bit_1;
		Reg_in		: in bit_16;
		Reg_reset	: in bit_1;
		Reg_out		: out bit_16;
		clk			: in bit_1
	);

end component reg_16;

signal mux3_out : bit_16;
signal Reg_out : bit_16;

begin 
	AR_mux: Mux3_16 port map (
		a => rz,
		b => operand,
		c => rx,
		mux3_sel => addr_mux_sel,
		mux3_out => mux3_out
	);
		
	AR_register: reg_16 port map (
		Reg_write => reg_write,
		Reg_in => mux3_out,
		Reg_reset => addr_reset,
		Reg_out => Reg_out,
		clk => clk
	);
	addr_reg_out <= Reg_out;
end architecture behaviour;
		