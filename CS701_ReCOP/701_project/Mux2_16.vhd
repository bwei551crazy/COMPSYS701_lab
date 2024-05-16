library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.recop_types.all;
use work.opcodes.all;

entity Mux2_16 is 
	port (
		a 			: in bit_16;
		b 			: in bit_16;
		mux2_sel	: in bit_1;
		mux2_out	: out bit_16
		);
end entity Mux2_16;

architecture behaviour of Mux2_16 is
begin
	with mux2_sel select
		mux2_out <= a when '0',
					 b when '0';
	
end architecture behaviour;
