library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.recop_types.all;
use work.opcodes.all;
use work.various_constants.all;

entity control_unit is
	port (
		clk 					: in bit_1;
		reset_in 			: in bit_1; --Resetting state. Linked with reset_out. 
		addressing_mode 	: in bit_2;
		z_flag 				: in bit_1;
		reset_out			: out bit_1; --Send reset to all components that has reset in port
		pc_write 			: out bit_1;
		pc_mux_sel 			: out bit_2;
		ir_write				: out bit_1;
		rf_input_sel 		: out bit_3;
		reg_init 			: out bit_1;
		ld_r 					: out bit_1;
		dprr_res 			: out bit_1;
		dprr_res_reg 		: out bit_1;
		dprr_wren 			: out bit_1;
		alu_op1_sel 		: out bit_2;
		alu_op2_sel			: out bit_2;
		clr_z_flag			: out bit_1;
		dpcr_wr				: out bit_1;
		sop_wr 				: out bit_1;
		irq_wr				: out bit_1;
		irq_clr 				: out bit_1;
		result_wren 		: out bit_1;
		present_wr			: out bit_1;
		reg_wr 				: out bit_1;
		addr_mux_sel 		: out bit_2;
		addr_reset 			: out bit_1;
		mux3_16_sel			: out bit_2;
		wr_en					: out bit_1;
		check_AM				: out bit_1;
		Op1_write			: in bit_1;
		Op2_write 			: in bit_1;
		Opcode				: in bit_6
		);
end entity control_unit;

architecture behaviour of control_unit is
type type_state is (init, T0, T1, T2, T3); --T0 for setting up flags, 
signal state, next_state : type_state;
begin
	--At start or when reset has been set to high. 
	process(clk, reset_in) 
	begin
		if reset_in = '1' then
			state <= init;
		else 
			state <= next_state;
		end if;			
	end process;
	
	process(state, addressing_mode)
	begin
		case state is 
			when init =>
				--Full resets components with reset signal
				reset_out <= reset_in;
				--Control signal to PC block
				pc_write <= '0';
				pc_mux_sel <= "00";
				--control signal to IR block
				ir_write <= '0';
				--control signal to RF block
				rf_input_sel <= "000";
				reg_init <= '0';
				ld_r <= '0';
				dprr_res <= '0'; --Reset DPRR
				dprr_res_reg <= '0'; --Reset DPRR register
				dprr_wren <= '0';
				--control signal to ALU block
				alu_op1_sel <= "00";
				alu_op2_sel <= "00";
				clr_z_flag 	<= '0';
				--control signal to register block
				dpcr_wr <= '0';
				sop_wr <= '0';
				irq_wr <= '0';
				irq_clr <= '0';
				result_wren <= '0';
				--control signal to present_register block 
				present_wr <= '0';
				--control signal to address register
				reg_wr <= '0';
				addr_mux_sel <= "00";
				addr_reset <= '0';
				--control signal to Mux3_16 block
				mux3_16_sel <= "00";
				--control signal to data_mem
				wr_en <= '0';
--				--control to Max (optional code below)
--				max_en <= '0'
				next_state <= T1;
			when T1 =>
			--Fetch and decode?
				--Small reset of the signals here
				
				--'Add' instruciton
				pc_write <= '1';
				pc_mux_sel <= "00";
				ir_write <= '1';
				if addressing_mode = "01" or addressing_mode = "10" then
					check_AM <= '1';
				else 
					check_AM <= '0';
				end if;
				reg_init <= '1';
				next_state <= T2;
			
			when T2 =>
			--Execute
				if Opcode = "00100" then 
					Op1_write <= '1';
					Op1_mux_select <= "01";
					Op2_write <= '1';
					Op2_mux_select <= "11";
				end if;
				next_state <= T3;
			when T3 => 
				alu_mux_sel1 <= "00";
				alu_mux_sel2 <= '1';
				if Opcode ="001000" then
					alu_operation <= alu_and;
				end if;
				rf_mux_sel <= "011";
				next_state <= T1;
				
				
				
				
				
				
				
				
				
					
					
		end case;
	end process;
				
				
end architecture behaviour;
