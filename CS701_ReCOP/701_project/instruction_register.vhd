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

--	component reg_16 is 
--		port(
--			Reg_in 		: in bit_16;
--			clk 			: in bit_1;
--			Reg_out 		: out bit_16;
--			Reg_write 	: in bit_1;
--			reg_reset 	: in bit_1
--		);
--	end component reg_16;
	
	signal reg_out : bit_16;
	signal temp_AM 				: bit_2;
	signal temp_opcode 			: bit_6;
	signal temp_rz, temp_rx		: bit_4; 
	signal temp_op 				: bit_16; --For temp storing the instantaneous change. A bit like a latch, getting ready to be sent out. 

begin

--	IR: reg_16 port map (
--		Reg_in => instr,
--		clk => clock,
--		Reg_out => reg_out,
--		Reg_write => ir_write,
--		reg_reset => reset
--	);
	--Receives signal whether the top half has been checked. If so, when 0 (not checked), set upper part. when 1 (checked), set lower part/operand
	process(clock, check_AM) 
	--For near instantaneous change
		variable var_AM 				: bit_2;
		variable var_opcode 			: bit_6; 
		variable var_rz, var_rx 	: bit_4;
		variable var_op 				: bit_16;
	begin
		if reset = '1' then
			var_AM 	 	:= "00";
			var_opcode  :=	"000000";
			var_rz		:= "0000";
			var_rx		:= "0000";
			var_op 		:= x"0000";
			temp_AM <= var_AM;
			temp_opcode <= var_opcode;
			temp_rz <= var_rz;
			temp_rx <= var_rx;
			temp_op <= var_op;
			
		elsif rising_edge(clock) then
			if ir_write = '1' then
				if check_AM = '0' then
					var_AM 	 	:= instr(15 downto 14);
					var_opcode  :=	instr(13 downto 8);
					var_rz		:= instr(7 downto 4);
					var_rx		:= instr(3 downto 0);
						
					temp_AM <= var_AM;
					temp_opcode <= var_opcode;
					temp_rz <= var_rz;
					temp_rx <= var_rx;
				else
				var_op 		:= instr(15 downto 0);
				
				temp_op <= var_op;
				end if;
			end if;
		end if;
	end process;
	
	AM 		<= temp_AM;
	opcode 	<= temp_opcode;
	Rz 		<= temp_rz;
	Rx 		<= temp_rx;
	op 		<= temp_op;
	
end architecture behaviour;        
