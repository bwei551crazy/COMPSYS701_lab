library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.recop_types.all;
use work.opcodes.all;

entity Mux4_16 is 
	port (
		a 			: in bit_16;
		b 			: in bit_16;
		c			: in bit_16;
		d			: in bit_16;
		mux4_sel	: in bit_2;
		mux4_out	: out bit_16
		);
end entity Mux4_16;

architecture behaviour of MUX4_16 is
begin
	with mux4_sel select
		mux4_out <= a when "00",
					 b when "01",
					 c when "10",
					 d when "11";
	
end architecture behaviour;
