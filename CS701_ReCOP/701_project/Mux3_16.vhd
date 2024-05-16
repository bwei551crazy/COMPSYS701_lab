library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.recop_types.all;
use work.opcodes.all;

entity Mux3_16 is 
	port (
		a 			: in bit_16;
		b 			: in bit_16;
		c			: in bit_16;
		mux3_sel	: in bit_2;
		mux3_out	: out bit_16
		);
end entity Mux3_16;

architecture behaviour of Mux3_16 is
begin
	with mux3_sel select
		mux3_out <= a 					when "00",
					 b 					when "01",
					 c 					when "10",
					 (others => '0') 	when "11";
	
end architecture behaviour;