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
		reset_in 			: in bit_1; 	--Resetting state. Linked with reset_out. 
		addressing_mode 	: in bit_2; 	--For determining what type of instruction it is. 
		Opcode				: in bit_6;   	--For determinig what instruction it is
		z_flag 				: in bit_1;	
		
		pc_write 			: out bit_1;
		pc_mux_sel 			: out bit_2;
		
		ir_write				: out bit_1;
		check_AM				: out bit_1;
		
		rf_input_sel 		: out bit_3;
		reg_init 			: out bit_1; 	--for resetting, not initialising. 
		ld_r 					: out bit_1;
		dprr_res 			: out bit_1;   --These dprr not sure if needed due to irq requirements
		dprr_res_reg 		: out bit_1;
		dprr_wren 			: out bit_1;
		
		alu_operation		: out bit_3;
		clr_z_flag			: out bit_1;
		
		dpcr_lsb_sel		: out bit_1;
		dpcr_wr				: out bit_1;
		sop_wr 				: out bit_1;
		irq_wr				: out bit_1;
		irq_clr 				: out bit_1;
		result_wren 		: out bit_1;
		
		present_wr			: out bit_1;
		
		wr_en					: out bit_1;
		
		Op1_write			: out bit_1;
		Op2_write 			: out bit_1;
		Op1_mux_select		: out bit_2;
		Op2_mux_select 	: out bit_2;
		
		state_is				: out bit_3
		);
end entity control_unit;

architecture behaviour of control_unit is
type type_state is (init, T1, T1_1,T2, T3, T4); --May add a few more states for interrupt handling if needed
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
			
				--Control signal to PC block
				pc_write <= '0';
				pc_mux_sel <= "000";
				
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
				alu_operation <= "000";
				clr_z_flag 	<= '0';
				
				--control signal to register block
				dpcr_lsb_sel <= '0';
				dpcr_wr <= '0';
				sop_wr <= '0';
				irq_wr <= '0';
				irq_clr <= '0';
				result_wren <= '0';
				
				--control signal to present_register block 
				present_wr <= '0';
				
				--control signal to data_mem
				wr_en <= '0';
				
				--control signal to OP1 and OP2 registers
				Op1_write			<= '0';
				Op2_write 			<= '0';
				Op1_mux_select		<= "00";
				Op2_mux_select 	<= "00"; 
				
				next_state <= T1;
				
			when T1 =>
				pc_write <= '0';
				pc_mux_sel <= "000";
				
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
				alu_operation <= "000";
				clr_z_flag 	<= '0';
				
				--control signal to register block
				dpcr_lsb_sel <= '0';
				dpcr_wr <= '0';
				sop_wr <= '0';
				irq_wr <= '0';
				irq_clr <= '0';
				result_wren <= '0';
				
				--control signal to present_register block 
				present_wr <= '0';
				
				--control signal to data_mem
				wr_en <= '0';
				
				--control signal to OP1 and OP2 registers
				Op1_write			<= '0';
				Op2_write 			<= '0';
				Op1_mux_select		<= "00";
				Op2_mux_select 	<= "00"; 
				

				--Start fetching 1st 16 bit instruction
				pc_write <=  '1';
				ir_write <= '1';
				
				next_state <= T1_1;

			when T1_1 => 
			
				--Control signal to PC block
				pc_write <= '0';
				pc_mux_sel <= "000";
				
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
				alu_operation <= "000";
				clr_z_flag 	<= '0';
				
				--control signal to register block
				dpcr_lsb_sel <= '0';
				dpcr_wr <= '0';
				sop_wr <= '0';
				irq_wr <= '0';
				irq_clr <= '0';
				result_wren <= '0';
				
				--control signal to present_register block 
				present_wr <= '0';
				
				--control signal to data_mem
				wr_en <= '0';
				
				--control signal to OP1 and OP2 registers
				Op1_write			<= '0';
				Op2_write 			<= '0';
				Op1_mux_select		<= "00";
				Op2_mux_select 	<= "00";
				
				--Deciding whether to fetch the next 16 bits if it is operand
				if addressing_mode = "01" then  --immediate
					check_AM <= '1';
					ir_write <= '1';
					pc_write <= '1';
				elsif addressing_mode = "10" then	--direct
					check_AM <= '1';
					ir_write <= '1';
					pc_write <= '1';
				else
					check_AM <= '0'; --Turn off so that the operand value don't change. 
					ir_write <= '0';
					pc_write <= '0';
				end if;
				
				next_state <= T2;
				
			when T2 => 
				--Control signal to PC block
				pc_write <= '0';
				pc_mux_sel <= "000";
				
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
				alu_operation <= "000";
				clr_z_flag 	<= '0';
				
				--control signal to register block
				dpcr_lsb_sel <= '0';
				dpcr_wr <= '0';
				sop_wr <= '0';
				irq_wr <= '0';
				irq_clr <= '0';
				result_wren <= '0';
				
				--control signal to present_register block 
				present_wr <= '0';
				
				--control signal to data_mem
				wr_en <= '0';
				
				--control signal to OP1 and OP2 registers
				Op1_write			<= '0';
				Op2_write 			<= '0';
				Op1_mux_select		<= "00";
				Op2_mux_select 	<= "00";
				
				--Decoding and setting up for execution. 
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
								Op2_write <= '1';
								Op2_mux_select <= "11";  --Operand
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
						--No need to worry about order since order is already set in 'registers' block
							when "11" => --register
								Op1_write <= '1';
								Op1_mux_select <= "10"; --Rz, but entering R7 in 'registers' block
								Op2_write <= '1';
								Op2_mux_select <= "01"; -- Rx
							when "01" => 
								Op1_write <= '1';
								Op1_mux_select <= "11"; --Operand
								Op2_write <= '1';
								Op2_mux_select <= "01"; --Rx  
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
				--Control signal to PC block
				pc_write <= '0';
				pc_mux_sel <= "000";
				
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
				alu_operation <= "000";
				clr_z_flag 	<= '0';
				
				--control signal to register block
				dpcr_lsb_sel <= '0';
				dpcr_wr <= '0';
				sop_wr <= '0';
				irq_wr <= '0';
				irq_clr <= '0';
				result_wren <= '0';
				
				--control signal to present_register block 
				present_wr <= '0';
				
				--control signal to data_mem
				wr_en <= '0';
				
				--control signal to OP1 and OP2 registers
				Op1_write			<= '0';
				Op2_write 			<= '0';
				Op1_mux_select		<= "00";
				Op2_mux_select 	<= "00";
				alu_operation <= alu_idle; --For jump instructions. 
				case Opcode is
					when andr =>
						alu_operation <= alu_and;
						
					when orr => 
						alu_operation <= alu_or;
						
					when addr => 
						alu_operation <= alu_add;
					
					when subr => 
						alu_operation <= alu_sub;
					
					when subvr =>
						alu_operation <= alu_sub;
					
					when ldr => 
						alu_operation <= alu_idle;
						case addressing_mode is
							when "01" => --Immediate
								rf_input_sel <= "000";  --Storing operand to Rz
								ld_r <= '1';
							when "11" => --Register
								rf_input_sel <= "111";	--Storing DM_out to Rz
								ld_r <= '1';
							when "10" => --Direct
								rf_input_sel <= "111"; --Storing DM_out to Rz
								ld_r <= '1';
							when others =>
						end case;
						
					when str => 
						alu_operation <= alu_idle;
						case addressing_mode is
							when "01" => --Immediate
								wr_en <= '1'; --enables storing operation in data memory
							when "11"=> --register
								wr_en <= '1';
							when "10" => --Direct
								wr_en <= '1';
							when others =>
						end case;
						
					when jmp => 
						alu_operation <= alu_idle;
						case addressing_mode is 
							when "01" => --Immediate
								pc_mux_sel <= "01"; --Chooses output of Op1 register (which should be operand) as the new pc						
							when "11" => -- Register
								pc_mux_sel <= "01"; --Also from op1 register but should be Rx instead for new pc
							when others => 
						end case;
					
					when present => 
						alu_operation <= alu_idle;
						present_wr <= '0';
						case addressing_mode is
							when "01" => --immediate
								present_wr <= '1'; --Enables present register
							when others =>
						end case;
					
					when datacall => 
						alu_operation <= alu_idle;
						dpcr_wr <= '0';
						dpcr_lsb_sel <= '0';
						case addressing_mode is 
							when "11" => --register 
								--Normally would be using the R7 as its input, but in this case it uses Rz. 
								dpcr_wr <= '1'; --Enables write operation in dpcr. 
								dpcr_lsb_sel <= '0'; --Selects concatenation between Rx and R7 
								
								--May need to add some dprr settings for the irq
							when "01" => --Immediate
								dpcr_wr <= '1';
								dpcr_lsb_sel <= '1'; --Concatenation between Rx and operand
								
								--May need to add some dprr settings for the irq
							when others => 
						end case;
					
					when sz => 
						alu_operation <= alu_idle;
						case addressing_mode is
							when "01" => --Immediate
								if z_flag = '1' then
									pc_mux_sel <=  "01";
								end if;
							when others =>
						end case;
					
					when strpc =>
						alu_operation <= alu_idle;
						wr_en <= '0';
						case addressing_mode is
							when "10" => --Direct
								wr_en <= '1'; --Enable storing in data memory
							when others =>
						end case;
					
					when clfz => 
						alu_operation <= alu_idle;
						case addressing_mode is 
							when "00" => --Inherent
								clr_z_flag <= '1'; --Clears Z, making z_flag = 0;
							when others =>
						end case;
						
					when lsip => 
						alu_operation <= alu_idle;
						case addressing_mode is 
							when "11" => --Register
								rf_input_sel <= "101"; --Selects the sip register and store its contents
							when others => 
						end case;
					
					when ssop => 
						alu_operation <= alu_idle;
						case addressing_mode is
							when "11" => --register
								sop_wr <= '1'; --Enables writing rx to SOP register
							when others =>
						end case;
					
					when noop =>
						alu_operation <= alu_idle;
						case addressing_mode is
							when "00" => --inherent
							
							when others =>
						end case;
				end case;
				
				next_state <= T4;
				
			when T4 => 
				--Writeback and extra state for more time for instructions to finish. 
				--Control signal to PC block
				pc_write <= '0';
				pc_mux_sel <= "000";
				
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
				alu_operation <= "000";
				clr_z_flag 	<= '0';
				
				--control signal to register block
				dpcr_lsb_sel <= '0';
				dpcr_wr <= '0';
				sop_wr <= '0';
				irq_wr <= '0';
				irq_clr <= '0';
				result_wren <= '0';
				
				--control signal to present_register block 
				present_wr <= '0';
				
				--control signal to data_mem
				wr_en <= '0';
				
				--control signal to OP1 and OP2 registers
				Op1_write			<= '0';
				Op2_write 			<= '0';
				Op1_mux_select		<= "00";
				Op2_mux_select 	<= "00";
				
				alu_operation <= alu_idle;
				case Opcode is
					when andr =>
						rf_input_sel <= "011"; --Selects aluout for storing
						ld_r <= '1';
					when orr => 
						rf_input_sel <= "011";
						ld_r <= '1';
						
					when addr => 
						rf_input_sel <= "011";
						ld_r <= '1';
					
					when subr => 
						rf_input_sel <= "011";
						ld_r <= '1';
					
					when subvr =>
						rf_input_sel <= "011";
						ld_r <= '1';
					
						--for additional time to load from memory and store in Rz
					when ldr => 
						case addressing_mode is
							when "01" => --Immediate
							
							when "11" => --Register

							when "10" => --Direct

							when others =>
						end case;
						--for additional time to store into data memory 
					when str => 
						case addressing_mode is
							when "01" => --Immediate
								
							when "11"=> --register

							when "10" => --Direct

							when others =>
						end case;
						
					when jmp => 
						alu_operation <= alu_idle;
						case addressing_mode is 
							when "01" => --Immediate
								pc_write <= '1'; --Start the pc_counter, not sure if logic is correct here. 
							when "11" => -- Register
								pc_write <= '1'; 
							when others => 
						end case;
					
					when present => 

						case addressing_mode is
							when "01" => --immediate
							
							when others =>
						end case;
					
					when datacall => 

						case addressing_mode is 
							when "11" => --register 
								
							when "01" => --Immediate
								
							when others => 
						end case;
					
					when sz => 

						case addressing_mode is
							when "01" => --Immediate
							
							when others =>
						end case;
					
					when strpc =>

						case addressing_mode is
							when "10" => --Direct
							
							when others =>
						end case;
					
					when clfz => 
					
						case addressing_mode is 
							when "00" => --Inherent

							when others =>
						end case;
						
					when lsip => 
					
						case addressing_mode is 
							when "11" => --Register
								
							when others => 
						end case;
					
					when ssop => 

						case addressing_mode is
							when "11" => --register

							when others =>
						end case;
					
					when noop =>
					
						case addressing_mode is
							when "00" => --inherent
							
							when others =>
						end case;
				end case;
		end case;
		
		next_state <= T1; 
		
	end process;
				
	with state select state_is <=
		"000" when init,
		"001" when T1,
		"010" when T1_1,
		"011" when T2,
		"101" when T3,
		"110" when T4;

end architecture behaviour;
