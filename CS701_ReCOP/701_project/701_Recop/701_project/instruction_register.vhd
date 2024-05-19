library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.recop_types.all;
use work.opcodes.all;
use work.various_constants.all;

-- instruction format
-- ---------------------------------------------
-- |AM(2)|OP(6)|Rz(4)|Rx(4)|ADDR/VAL/OTHERs(16)|
-- ---------------------------------------------

entity instruction_register is
	port (
		instr : in bit_16;
		ir_write 	: in 	bit_1; --Used for setting up the instr 
		check_AM		: in bit_1;
		reset			: in bit_1;
		clock			: in 	bit_1;
		AM				: out bit_2;
		opcode		: out bit_6;
		Rz				: out bit_4;
		Rx				: out bit_4;
		op				: out bit_16
	);
end entity instruction_register;

architecture behaviour of instruction_register is

	component reg_16 is 
		port(
			Reg_in 		: in bit_16;
			clk 			: in bit_1;
			Reg_out 		: out bit_16;
			Reg_write 	: in bit_1
		);
	end component reg_16;
	
	signal reg_out : bit_16;

begin

	IR: reg_16 port map (
		Reg_in => instr,
		clk => clock,
		Reg_out => reg_out,
		Reg_write => ir_write
	);
	--Receives signal whether the top half has been checked. If so, when 0 (not checked), set upper part. when 1 (checked), set lower part/operand
	AM <= reg_out(15 downto 14) when check_AM = '0';    
	opcode <= reg_out(13 downto 8) when check_AM = '0';
	Rz <= reg_out(7 downto 4) when check_AM = '0';
	Rx <= reg_out(3 downto 0) when check_AM = '0';
	op <= reg_out(15 downto 0) when check_AM = '1' else x"0000";
end architecture behaviour;        
