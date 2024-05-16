library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.recop_types.all;
use work.opcodes.all;
use work.various_constants.all;

entity control_unit is
    port (
        clk                 : in bit_1;
        reset_in            : in bit_1;
        addressing_mode     : in bit_2;
        z_flag              : in bit_1;
        reset_out           : out bit_1;
        pc_write            : out bit_1;
        pc_mux_sel          : out bit_2;
        ir_write            : out bit_1;
        rf_input_sel        : out bit_3;
        reg_init            : out bit_1;
        ld_r                : out bit_1;
        dprr_res            : out bit_1;
        dprr_res_reg        : out bit_1;
        dprr_wren           : out bit_1;
        alu_op1_sel         : out bit_2;
        alu_op2_sel         : out bit_1;
        alu_operation       : out bit_3;
        clr_z_flag          : out bit_1;
        dpcr_wr             : out bit_1;
        sop_wr              : out bit_1;
        irq_wr              : out bit_1;
        irq_clr             : out bit_1;
        result_wren         : out bit_1;
        present_wr          : out bit_1;
        reg_wr              : out bit_1;
        addr_mux_sel        : out bit_2;
        addr_reset          : out bit_1;
        mux3_16_sel         : out bit_2;
        wr_en               : out bit_1;
        check_AM            : out bit_1;
        Op1_write           : out bit_1;
        Op2_write           : out bit_1;
        Op1_mux_select      : out bit_2;
        Op2_mux_select      : out bit_2;
        Opcode              : in bit_6;
        state_is            : out bit_3
    );
end entity control_unit;

architecture behaviour of control_unit is
    type type_state is (init, T1, T1_2, T2, T3, T4);
    signal state : type_state := init;
    signal next_state : type_state := init;

begin
    -- Main control process
    process(clk, reset_in) 
    begin
        if reset_in = '1' then
            state <= init;
        elsif rising_edge(clk) then
            state <= next_state;
        end if;
    end process;
    
    process(state, addressing_mode)
    begin
        case state is 
            when init =>
                reset_out <= reset_in;
                pc_write <= '0';
                pc_mux_sel <= "00";
                ir_write <= '0';
                check_AM <= '0';
                rf_input_sel <= "000";
                reg_init <= '1';
                ld_r <= '0';
                dprr_res <= '0';
                dprr_res_reg <= '0';
                dprr_wren <= '0';
                alu_op1_sel <= "00";
                alu_op2_sel <= '0';
                clr_z_flag <= '0';
                dpcr_wr <= '0';
                sop_wr <= '0';
                irq_wr <= '0';
                irq_clr <= '0';
                result_wren <= '0';
                present_wr <= '0';
                reg_wr <= '0';
                addr_mux_sel <= "00";
                addr_reset <= '0';
                mux3_16_sel <= "00";
                wr_en <= '0';
                next_state <= T1;

            -- Start of T1    
            -- First half Fetch instructions
            when T1 =>
                pc_write <= '1';             
                ir_write <= '1';            

                pc_mux_sel <= "00";          
                check_AM <= '0';             
                rf_input_sel <= "000";       
                reg_init <= '1';             
                ld_r <= '0';                
                dprr_res <= '0';             
                dprr_res_reg <= '0';         
                dprr_wren <= '0';          
                alu_op1_sel <= "00";       
                alu_op2_sel <= '0';         
                clr_z_flag <= '0';          
                dpcr_wr <= '0';              
                sop_wr <= '0';               
                irq_wr <= '0';              
                irq_clr <= '0';             
                result_wren <= '0';          
                present_wr <= '0';          
                reg_wr <= '0';              
                addr_mux_sel <= "00";       
                addr_reset <= '0';           
                mux3_16_sel <= "00";        
                wr_en <= '0';              

                next_state <= T1_2;   

            -- Start of T1_2 
            -- Second half Fetch instructions 
            when T1_2 => 
                if addressing_mode = "01" or addressing_mode = "10" then
                    check_AM <= '1';
                    pc_write <= '1';
                    ir_write <= '1';
                else
                    pc_write <= '0';
                    check_AM <= '0';
                    ir_write <= '0';
                end if;

                rf_input_sel <= "000";
                reg_init <= '1';
                ld_r <= '0';
                dprr_res <= '0';
                dprr_res_reg <= '0';
                dprr_wren <= '0';
                alu_op1_sel <= "00";
                alu_op2_sel <= '0';
                clr_z_flag <= '0';
                dpcr_wr <= '0';
                sop_wr <= '0';
                irq_wr <= '0';
                irq_clr <= '0';
                result_wren <= '0';
                present_wr <= '0';
                reg_wr <= '0';
                addr_mux_sel <= "00";
                addr_reset <= '0';
                mux3_16_sel <= "00";
                wr_en <= '0';

                next_state <= T2;

            -- Decode instructions / setup execution 
            when T2 => 
                case Opcode is
                    when ldr =>  -- Load
                        alu_operation <= "000"; -- No ALU operation, just load
                        Op1_mux_select <= "10"; --  Rz
                        Op2_mux_select <= "11"; --  Rx
                        next_state <= T3;      -- Move to execute to perform load

                    when str =>  -- Store
                        alu_operation <= "000"; -- No ALU operation, just store
                        Op1_mux_select <= "10";
                        Op2_mux_select <= "11";
                        next_state <= T4;      -- Move to store

                    when jmp =>  -- Jump
                        alu_operation <= "000"; -- No ALU operation, just jump
                        Op1_mux_select <= "10";
                        Op2_mux_select <= "11";
                        next_state <= T4;      -- Perform jump in T4

                    when present =>  -- Conditional execution
                        alu_operation <= "000"; -- No ALU 
                        Op1_mux_select <= "10";
                        Op2_mux_select <= "11";
                        next_state <= T4;  

                    when andr =>  -- AND
                        alu_operation <= "010"; -- AND 
                        Op1_mux_select <= "10";
                        Op2_mux_select <= "11";
                        next_state <= T3;

                    when orr =>  -- OR
                        alu_operation <= "011"; -- OR 
                        Op1_mux_select <= "10";
                        Op2_mux_select <= "11";
                        next_state <= T3;

                    when addr =>  -- ADD
                        alu_operation <= "000"; -- ADD 
                        Op1_mux_select <= "10";
                        Op2_mux_select <= "11";
                        next_state <= T3;

                    when subr =>  -- SUB
                        alu_operation <= "001"; -- SUB 
                        Op1_mux_select <= "10";
                        Op2_mux_select <= "11";
                        next_state <= T3;

                    when subvr =>  -- SUBV
                        alu_operation <= "001"; -- ALU SUB operation with overflow
                        Op1_mux_select <= "10";
                        Op2_mux_select <= "11";
                        next_state <= T3;

                    when clfz =>  -- Clear Flag Zero
                        clr_z_flag <= '1';  
                        next_state <= T4;      -- Clear flag and continue

                    when ssop =>  -- Set SOP
                        sop_wr <= '1';  
                        next_state <= T4;

                    when lsip =>  -- Load SIP
                        irq_wr <= '1';
                        next_state <= T4;

                    when sz =>  -- Set Zero
                        Op1_mux_select <= "10";  -- Setup for condition check
                        next_state <= T4;

                    when strpc =>  -- Store PC
                        -- idk what to do here man
                        next_state <= T4;

                    when others => 
                        -- Reset outputs if no valid opcode
                        alu_op1_sel <= "00";
                        alu_op2_sel <= '0';
                        alu_operation <= "000";
                        next_state <= init;  -- Return to init or handle as error
                end case;

            -- Start of T3
            when T3 =>
                --Executing instruction using the selected stuff from T2
                alu_op1_sel <= "00";
                alu_op2_sel <= '1';
                ld_r <= '1'; 
					 
					  case opcode is -- THESE SECTIONS NEED TO CHANGE !! 
						 when "001000" => -- AND
							  alu_operation <= alu_and;
						 when "001100" => -- OR
							  alu_operation <= alu_or;
						 when "111000" => -- ADD
							  alu_operation <= alu_add;
						 when "000100" => -- SUB
							  alu_operation <= alu_sub;			  
						 when "010000" => -- CLFZ
							  clr_z_flag <= '1';  
						 when "111010" => -- SSOP
							  sop_wr <= '1';  
						 when "110111" => -- LSIP
							  irq_wr <= '1';
						 when "000000" => -- LDR
							  ld_r <= '1';  -- Load 
						 when "011100" => -- PRESENT
							  present_wr <= '1'; 
						 when others => 
							  alu_operation <= "000";
					end case;		   

                next_state <= T4; 

            -- Start of T4
            when T4 => 
            rf_input_sel <= "011";
            ld_r <= '1';

        end case;
    end process;

    with state select state_is <=
        "000" when init,
        "001" when T1,
        "010" when T1_2,
        "011" when T2,
        "100" when T3,
        "101" when T4;

end architecture behaviour;