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
		addressing_mode 	: in bit_2; --For determining what type of instruction it is. 
		z_flag 				: in bit_1;
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
		alu_op2_sel			: out bit_1;
		alu_operation		: out bit_3;
		clr_z_flag			: out bit_1;
		dpcr_wr				: out bit_1;
		sop_wr 				: out bit_1;
		irq_wr				: out bit_1;
		irq_clr 				: out bit_1;
		result_wren 		: out bit_1;
		present_wr			: out bit_1;
		reg1_wr 				: out bit_1;
		reg2_wr				: out bit_1;
		addr_mux_sel 		: out bit_2;
		addr_reset 			: out bit_1;
		mux3_16_sel			: out bit_2;
		wr_en					: out bit_1;
		check_AM				: out bit_1;
		Op1_write			: out bit_1;
		Op2_write 			: out bit_1;
		Op1_mux_select		: out bit_2;
		Op2_mux_select 	: out bit_2;
		Opcode				: in bit_6;   --For determinig what instruction it is
		state_is				: out bit_3
		);
end entity control_unit;

architecture behaviour of control_unit is
type type_state is (init, T1, T1_1,T2, T3);--, T3, T4); --T1, T1_2, T2, T3, T4); --T0 for setting up flags, 
signal state : type_state := init;
signal next_state : type_state := init;	
begin
	--At start or when reset has been set to high. 
	process(clk, reset_in) 
	begin
		if reset_in = '1' then
			state <= init;
		elsif rising_edge(clk) then
			state <= next_state;
		end if;
	end process;
	
	process(state, addressing_mode, Opcode)
	begin
		case state is 
			when init =>
				--Full resets components with reset signal
				--state_is <= "000"; --For debug purposes
				--Control signal to PC block
				pc_write <= '0';
				pc_mux_sel <= "00";
				--control signal to IR block
				ir_write <= '0';
				check_AM <= '0';
				--control signal to RF block
				rf_input_sel <= "000";
				reg_init <= '1'; --This is actually a reset. 1 for reset. 0 for not reset
				ld_r <= '0';
				dprr_res <= '0'; --Reset DPRR
				dprr_res_reg <= '0'; --Reset DPRR register
				dprr_wren <= '0';
				--control signal to ALU block
				alu_op1_sel <= "00";
				alu_op2_sel <= '0';
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
				reg1_wr <= '0';
				reg2_wr <= '0';
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
					--Control signal to PC block
				pc_write <= '0';
				pc_mux_sel <= "00";
				--control signal to IR block
				ir_write <= '0';
				check_AM <= '0';
				--control signal to RF block
				rf_input_sel <= "000";
				reg_init <= '1'; --This is actually a reset. 1 for reset. 0 for not reset
				ld_r <= '0';
				dprr_res <= '0'; --Reset DPRR
				dprr_res_reg <= '0'; --Reset DPRR register
				dprr_wren <= '0';
				--control signal to ALU block
				alu_op1_sel <= "00";
				alu_op2_sel <= '0';
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
				reg1_wr <= '0';
				reg2_wr <= '0';
				addr_mux_sel <= "00";
				addr_reset <= '0';
				--control signal to Mux3_16 block
				mux3_16_sel <= "00";
				--control signal to data_mem
				wr_en <= '0';
				
				--state_is <= "001";
				--Start of fetch
				pc_write <=  '1';
				ir_write <= '1';
				next_state <= T1_1;

			when T1_1 => 
			
					--Control signal to PC block
				pc_write <= '0';
				pc_mux_sel <= "00";
				--control signal to IR block
				ir_write <= '0';
				check_AM <= '0';
				--control signal to RF block
				rf_input_sel <= "000";
				reg_init <= '1'; --This is actually a reset. 1 for reset. 0 for not reset
				ld_r <= '0';
				dprr_res <= '0'; --Reset DPRR
				dprr_res_reg <= '0'; --Reset DPRR register
				dprr_wren <= '0';
				--control signal to ALU block
				alu_op1_sel <= "00";
				alu_op2_sel <= '0';
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
				reg1_wr <= '0';
				reg2_wr <= '0';
				addr_mux_sel <= "00";
				addr_reset <= '0';
				--control signal to Mux3_16 block
				mux3_16_sel <= "00";
				--control signal to data_mem
				wr_en <= '0';
				
				if addressing_mode = "01" then  --immediate
					check_AM <= '1';
					ir_write <= '1';
					pc_write <= '1';
				elsif addressing_mode = "10" then	--direct
					check_AM <= '1';
					ir_write <= '1';
					pc_write <= '1';
				else
					check_AM <= '0';
					ir_write <= '0';
					pc_write <= '0';
				end if;
				
			--In next clock cycle, checks the prev fetched instruction on it's addressing mode.  
				next_state <= T2;
			when T2 => 
				--Decoding and setting up for execution. 
					--Control signal to PC block
				pc_write <= '0';
				pc_mux_sel <= "00";
				--control signal to IR block
				ir_write <= '0';
				check_AM <= '0';
				--control signal to RF block
				rf_input_sel <= "000";
				reg_init <= '1'; --This is actually a reset. 1 for reset. 0 for not reset
				ld_r <= '0';
				dprr_res <= '0'; --Reset DPRR
				dprr_res_reg <= '0'; --Reset DPRR register
				dprr_wren <= '0';
				--control signal to ALU block
				alu_op1_sel <= "00";
				alu_op2_sel <= '0';
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
				reg1_wr <= '0';
				reg2_wr <= '0';
				addr_mux_sel <= "00";
				addr_reset <= '0';
				--control signal to Mux3_16 block
				mux3_16_sel <= "00";
				--control signal to data_mem
				wr_en <= '0';
				pc_write <= '0';
				pc_mux_sel <= "00";
				--control signal to IR block
				ir_write <= '0';
				check_AM <= '0';
				pc_write <= '0';
				ir_write <= '0';
				
				case Opcode is
					when andr =>
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is 
							when "01" =>   -- Immediate
								Op1_write <= '1';
								Op1_mux_select <= "01";  --Rx
								Op2_write <= '1';
								Op2_mux_select <= "11";	 --Operand
							when "11" =>	-- Register
								Op1_write <= '1';
								Op1_mux_select <= "01";
								Op2_write <= '1';
								Op2_mux_select <= "10";  --Rz
							when others => 
						end case;
						
					when orr => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is 
							when "01" =>   -- Immediate
								Op1_write <= '1';
								Op1_mux_select <= "01";  --Rx
								Op2_write <= '1';
								Op2_mux_select <= "11";	 --Operand
							when "11" =>	-- Register
								Op1_write <= '1';
								Op1_mux_select <= "01";
								Op2_write <= '1';
								Op2_mux_select <= "10";  --Rz
							when others =>
						end case;
						
					when addr => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is 
							when "01" =>   -- Immediate
								Op1_write <= '1';
								Op1_mux_select <= "01";  --Rx
								Op2_write <= '1';
								Op2_mux_select <= "11";	 --Operand
							when "11" =>	-- Register
								Op1_write <= '1';
								Op1_mux_select <= "01";
								Op2_write <= '1';
								Op2_mux_select <= "10";  --Rz
							when others =>
						end case;
					
					when subr => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is 
							when "01" =>   -- Immediate
								Op1_write <= '1';
								Op1_mux_select <= "10";  --Rz
								Op2_write <= '1';
								Op2_mux_select <= "11";	 --Operand
							when others =>
						end case;
					
					when subvr =>
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is 
							when "01" =>   -- Immediate
								Op1_write <= '1';
								Op1_mux_select <= "01";  --Rx
								Op2_write <= '1';
								Op2_mux_select <= "11";	 --Operand
							when others =>
						end case;
					
					when ldr => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is
							when "01" => --Immediate
								Op1_write <= '1';
								Op1_mux_select <= "11";  --Operand
							when "11" => --Register
								Op2_write <= '1';
								Op2_mux_select <= "01"; --Rx
							when "10" => --Direct
								Op2_write <= '1';
								Op2_mux_select <= "11"; --Operand 
							when others =>
						end case;
					when str => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is
							when "01" => --Immediate
								Op1_write <= '1';
								Op1_mux_select <= "11"; --operand
								Op2_write <= '1';
								Op2_mux_select <= "10"; --Rz
							when "11"=> --register
								Op1_write <= '1';
								Op1_mux_select <= "01"; --Rx
								Op2_write <= '1';
								Op2_mux_select <= "10"; --Rz
							when "10" => --Direct
								Op1_write <= '1';
								Op1_mux_select <= "01"; --Rx
								Op2_write <= '1';
								Op2_mux_select <= "11"; --Operand
							when others =>
						end case;
						
					when jmp => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is 
							when "01" => --Immediate
								Op1_write <= '1';
								Op1_mux_select <= "11";	-- Operand							
							when "11" => -- Register
								Op1_write <= '1';
								Op1_mux_select <= "01"; --Rx
							when others =>
						end case;
					
					when present => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is
							when "01" => --immediate
								Op1_write <= '1';
								Op1_mux_select <= "11"; --Operand
								Op2_write <= '1';
								Op2_mux_select <= "10"; --Rz
							when others =>
						end case;
					
					when datacall => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is 
							when "11" => --register
								Op1_write <= '1';
								Op1_mux_select <= "10"; --Rz
								Op2_write <= '1';
								Op2_mux_select <= "01" -- Rx
							when "01" => 
								Op1_write <= '1';
								Op1_mux_select <= "01"; --Rx
								Op2_write <= '1';
								Op2_mux_select <= "11"; --operand
							when others => 
						end case;
					
					when sz => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is
							when "01" => --Immediate
								Op1_write <= '0';
								Op1_mux_select <= "11"; --operand
							when others =>
						end case;
					
					when strpc =>
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is
							when "10" => --Direct
								Op1_write <= '1';
								Op1_mux_select <= "00"; --PC
								Op2_write <= '1';
								Op2_mux_select <= "11"; --operand
							when others =>
						end case;
					
					when clfz => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is 
							when "00" => --Inherent
							
							when others =>
						end case;
						
					when lsip => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is 
							when "11" => --Register
							
							when others => 
						end case;
					
					when ssop => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is
							when "11" => --register
								Op1_write <= '1';
								Op1_mux_select <= "01"; --Rx
							when others =>
						end case;
					
					when noop =>
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is
							when "00" => --inherent
							
							when others =>
						end case;
					end case;
				
					next_state <= T3;
				
			when T3 =>
					--Decoding and setting up for execution. 
					--Control signal to PC block
				pc_write <= '0';
				pc_mux_sel <= "00";
				--control signal to IR block
				ir_write <= '0';
				check_AM <= '0';
				--control signal to RF block
				rf_input_sel <= "000";
				reg_init <= '1'; --This is actually a reset. 1 for reset. 0 for not reset
				ld_r <= '0';
				dprr_res <= '0'; --Reset DPRR
				dprr_res_reg <= '0'; --Reset DPRR register
				dprr_wren <= '0';
				--control signal to ALU block
				alu_op1_sel <= "00";
				alu_op2_sel <= '0';
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
				reg1_wr <= '0';
				reg2_wr <= '0';
				addr_mux_sel <= "00";
				addr_reset <= '0';
				--control signal to Mux3_16 block
				mux3_16_sel <= "00";
				--control signal to data_mem
				wr_en <= '0';
				pc_write <= '0';
				pc_mux_sel <= "00";
				--control signal to IR block
				ir_write <= '0';
				check_AM <= '0';
				pc_write <= '0';
				ir_write <= '0';
				
				case Opcode is
					when andr =>
						
						
						case addressing_mode is 
							when "01" =>   -- Immediate
								Op1_write <= '1';
								Op1_mux_select <= "01";  --Rx
								Op2_write <= '1';
								Op2_mux_select <= "11";	 --Operand
							when "11" =>	-- Register
								Op1_write <= '1';
								Op1_mux_select <= "01";
								Op2_write <= '1';
								Op2_mux_select <= "10";  --Rz
							when others => 
						end case;
						
					when orr => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is 
							when "01" =>   -- Immediate
								Op1_write <= '1';
								Op1_mux_select <= "01";  --Rx
								Op2_write <= '1';
								Op2_mux_select <= "11";	 --Operand
							when "11" =>	-- Register
								Op1_write <= '1';
								Op1_mux_select <= "01";
								Op2_write <= '1';
								Op2_mux_select <= "10";  --Rz
							when others =>
						end case;
						
					when addr => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is 
							when "01" =>   -- Immediate
								Op1_write <= '1';
								Op1_mux_select <= "01";  --Rx
								Op2_write <= '1';
								Op2_mux_select <= "11";	 --Operand
							when "11" =>	-- Register
								Op1_write <= '1';
								Op1_mux_select <= "01";
								Op2_write <= '1';
								Op2_mux_select <= "10";  --Rz
							when others =>
						end case;
					
					when subr => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is 
							when "01" =>   -- Immediate
								Op1_write <= '1';
								Op1_mux_select <= "10";  --Rz
								Op2_write <= '1';
								Op2_mux_select <= "11";	 --Operand
							when others =>
						end case;
					
					when subvr =>
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is 
							when "01" =>   -- Immediate
								Op1_write <= '1';
								Op1_mux_select <= "01";  --Rx
								Op2_write <= '1';
								Op2_mux_select <= "11";	 --Operand
							when others =>
						end case;
					
					when ldr => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is
							when "01" => --Immediate
								Op1_write <= '1';
								Op1_mux_select <= "11";  --Operand
							when "11" => --Register
								Op2_write <= '1';
								Op2_mux_select <= "01"; --Rx
							when "10" => --Direct
								Op2_write <= '1';
								Op2_mux_select <= "11"; --Operand 
							when others =>
						end case;
					when str => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is
							when "01" => --Immediate
								Op1_write <= '1';
								Op1_mux_select <= "11"; --operand
								Op2_write <= '1';
								Op2_mux_select <= "10"; --Rz
							when "11"=> --register
								Op1_write <= '1';
								Op1_mux_select <= "01"; --Rx
								Op2_write <= '1';
								Op2_mux_select <= "10"; --Rz
							when "10" => --Direct
								Op1_write <= '1';
								Op1_mux_select <= "01"; --Rx
								Op2_write <= '1';
								Op2_mux_select <= "11"; --Operand
							when others =>
						end case;
						
					when jmp => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is 
							when "01" => --Immediate
								Op1_write <= '1';
								Op1_mux_select <= "11";	-- Operand							
							when "11" => -- Register
								Op1_write <= '1';
								Op1_mux_select <= "01"; --Rx
							when others =>
						end case;
					
					when present => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is
							when "01" => --immediate
								Op1_write <= '1';
								Op1_mux_select <= "11"; --Operand
								Op2_write <= '1';
								Op2_mux_select <= "10"; --Rz
							when others =>
						end case;
					
					when datacall => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is 
							when "11" => --register
								Op1_write <= '1';
								Op1_mux_select <= "10"; --Rz
								Op2_write <= '1';
								Op2_mux_select <= "01" -- Rx
							when "01" => 
								Op1_write <= '1';
								Op1_mux_select <= "01"; --Rx
								Op2_write <= '1';
								Op2_mux_select <= "11"; --operand
							when others => 
						end case;
					
					when sz => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is
							when "01" => --Immediate
								Op1_write <= '0';
								Op1_mux_select <= "11"; --operand
							when others =>
						end case;
					
					when strpc =>
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is
							when "10" => --Direct
								Op1_write <= '1';
								Op1_mux_select <= "00"; --PC
								Op2_write <= '1';
								Op2_mux_select <= "11"; --operand
							when others =>
						end case;
					
					when clfz => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is 
							when "00" => --Inherent
							
							when others =>
						end case;
						
					when lsip => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is 
							when "11" => --Register
							
							when others => 
						end case;
					
					when ssop => 
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is
							when "11" => --register
								Op1_write <= '1';
								Op1_mux_select <= "01"; --Rx
							when others =>
						end case;
					
					when noop =>
						Op1_write <= '0';
						Op2_write <= '0';
						case addressing_mode is
							when "00" => --inherent
							
							when others =>
						end case;
					end case;
						
				
--			pc_write <= '0';
--				pc_mux_sel <= "00";
--				--control signal to IR block
--				ir_write <= '0';
--				check_AM <= '0';
--				pc_write <= '0';
--				ir_write <= '0';
--				check_AM <= '0';
--				if addressing_mode = "10" then
--					if Opcode = "001000" then
--						Op1_write <= '1';
--						Op1_mux_select <= "01";
--						Op2_write <= '1';
--						Op2_mux_select <= "11";
--					end if;
--					next_state <= T4;
--				elsif addressing_mode = "01" then
--					if Opcode = "001000" then
--						Op1_write <= '1';
--						Op1_mux_select <= "10";
--						Op2_write <= '1';
--						Op2_mux_select <= "11";
--					end if;
--					next_state <= T4;
--				end if; 
--				
--			when T4 => 
--				--state_is <= "101";
--			--Storing/Load stage 
--				alu_op1_sel <= "00";
--				alu_op2_sel <= '1';
--				if Opcode ="001000" then
--					alu_operation <= alu_and;
--				end if;
--				rf_input_sel <= "011";
--				next_state <= T1;
				
			----------------------------Another end-fuckaround1
	
				
			
			--------------------------Another start-fuckaround2
--			when T3 =>
--				 check_AM <= '0'; 
--				 if Opcode = "001000" then  -- AND Rz, Rx
--					  Op1_write <= '1';
--					  Op1_mux_select <= "01";  -- Rz
--					  Op2_write <= '1';
--					  Op2_mux_select <= "11";  -- Rx
--					  alu_operation <= "010";  -- ALU AND operation
--					  next_state <= T4;
--				 elsif Opcode = "001100" then  -- OR Rz, Rx
--					  Op1_write <= '1';
--					  Op1_mux_select <= "10";  -- Rz
--					  Op2_write <= '1';
--					  Op2_mux_select <= "11";  -- Rx
--					  alu_operation <= "011";  -- ALU OR operation
--					  next_state <= T4;
--				 elsif Opcode = "111000" then  -- ADD Rz, Rx
--					  Op1_write <= '1';
--					  Op1_mux_select <= "10";  -- Rz
--					  Op2_write <= '1';
--					  Op2_mux_select <= "11";  -- Rx
--					  alu_operation <= "000";  -- ALU AD	D operation
--					  next_state <= T4;
--				 elsif Opcode = "000100" then  -- SUB Rz, Rx
--					  Op1_write <= '1';
--					  Op1_mux_select <= "10";  -- Rz
--					  Op2_write <= '1';
--					  Op2_mux_select <= "11";  -- Rx
--					  alu_operation <= "001";  -- ALU SUB operation
--					  next_state <= T4;
--				 elsif Opcode = "011000" then
--					  pc_write <= '1';
--					  pc_mux_sel <= "01";  -- Immediate address
--					  next_state <= T1;
--				 elsif Opcode = "000000" then  -- LDR Rz, Operand (Immediate)
--					  Op1_write <= '1';
--					  Op1_mux_select <= "01";  -- Immediate value for load
--					  next_state <= T4;
--				 elsif Opcode = "000010" then  -- STR Rz, Rx (Direct)
--					  Op1_write <= '1';
--					  Op1_mux_select <= "10";  -- Rx value for store
--					  next_state <= T4;
--				 else
--					  next_state <= T1;
--				 end if;
			--------------------------Another end-fuckaround2
			
		end case;
	end process;
				
	with state select state_is <=
		"000" when init,
		"001" when T1,
		"010" when T1_1,
		"011" when T2,
		"101" when T3;

end architecture behaviour;
