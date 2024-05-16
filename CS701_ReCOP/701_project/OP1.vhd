library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.recop_types.all;
use work.opcodes.all;


entity OP1 is 
	port (
		clk				: in bit_1;	--Aiding the storing contents in register
		Reg1_write		: in bit_1;	--For storing in register
		op1_mux_select : in bit_2; --Selecting which of below registers to use as OP1
		PC					: in bit_16;
		Rx					: in bit_16;
		Rz					: in bit_16;
		Operand			: in bit_16;
		op1_reset		: in bit_1;
		Op1_out			: out bit_16
	);
end entity Op1;

architecture behaviour of OP1 is
	component Mux4_16 is
		port (
			a 			: in bit_16;
			b 			: in bit_16;
			c			: in bit_16;
			d			: in bit_16;
			mux4_sel	: in bit_2;
			mux4_out	: out bit_16
		);
	end component Mux4_16;
	
--	component reg_16 is
--		port (
--			Reg_write 	: in bit_1;
--			Reg_in		: in bit_16;
--			Reg_out		: out bit_16;
--			clk			: in bit_1
--		);
--	end component reg_16;
	
	signal op1_select 	: bit_16;
	signal temp_op1_out 	: bit_16;
begin
	
	OP1_Mux: Mux4_16 port map (
		a => PC,
		b => Rx,
		c => Rz,
		d => Operand,
		mux4_sel => op1_mux_select,
		mux4_out => op1_select
	);
	
--	OP1_Reg: reg_16 port map (
--		Reg_write => Reg_write,
--		Reg_in => op1_select,
--		Reg_out => Op1_out,
--		clk => clk
--	);
	process(clk)
		variable temp_op1 : bit_16; --Using variable for near instant change. 
	begin
		if op1_reset = '1' then
			temp_op1 := x"0000";
			temp_op1_out <= temp_op1; --To store the new change temporarily before being pushed out. Ensures that the new change arrives as quick as possible
		elsif rising_edge(clk) then
			if Reg1_write = '1' then
				temp_op1 := op1_select;
				temp_op1_out <= temp_op1;
			end if;
		end if;
	end process;
	
	Op1_out <= temp_op1_out; --Sets the new changes out . 
			
	
end architecture behaviour;

			

			