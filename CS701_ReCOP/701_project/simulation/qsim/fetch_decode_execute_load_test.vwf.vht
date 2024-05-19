-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "05/19/2024 15:33:29"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          fetch_decode_control
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY fetch_decode_control_vhd_vec_tst IS
END fetch_decode_control_vhd_vec_tst;
ARCHITECTURE fetch_decode_control_arch OF fetch_decode_control_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL alu_operation : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL ALU_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL alu_result_prev : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL AM : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL check_AM : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL clr_z_flag : STD_LOGIC;
SIGNAL dm_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL dpcr : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL dpcr_lsb_sel : STD_LOGIC;
SIGNAL dpcr_wr : STD_LOGIC;
SIGNAL ir_write : STD_LOGIC;
SIGNAL ld_r : STD_LOGIC;
SIGNAL op : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL op1_mux_select : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL Op1_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Op1_write : STD_LOGIC;
SIGNAL op2_mux_select : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL Op2_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Op2_write : STD_LOGIC;
SIGNAL opcode : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL pc_mux_sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL PC_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL pc_write : STD_LOGIC;
SIGNAL pm_outdata : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL present_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL present_wr : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL rf_mux : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Rx : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Rx_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Rz : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Rz_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Sip_in : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL sop : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL sop_wr : STD_LOGIC;
SIGNAL state_is : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL wr_en : STD_LOGIC;
SIGNAL z_flag : STD_LOGIC;
COMPONENT fetch_decode_control
	PORT (
	alu_operation : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	ALU_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	alu_result_prev : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	AM : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	check_AM : OUT STD_LOGIC;
	clock : IN STD_LOGIC;
	clr_z_flag : OUT STD_LOGIC;
	dm_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	dpcr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	dpcr_lsb_sel : OUT STD_LOGIC;
	dpcr_wr : OUT STD_LOGIC;
	ir_write : OUT STD_LOGIC;
	ld_r : OUT STD_LOGIC;
	op : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	op1_mux_select : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	Op1_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	Op1_write : OUT STD_LOGIC;
	op2_mux_select : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	Op2_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	Op2_write : OUT STD_LOGIC;
	opcode : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	pc_mux_sel : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	PC_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	pc_write : OUT STD_LOGIC;
	pm_outdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	present_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	present_wr : OUT STD_LOGIC;
	reset : IN STD_LOGIC;
	rf_mux : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	Rx : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	Rx_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	Rz : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	Rz_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	Sip_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	sop : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	sop_wr : OUT STD_LOGIC;
	state_is : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	wr_en : OUT STD_LOGIC;
	z_flag : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : fetch_decode_control
	PORT MAP (
-- list connections between master ports and signals
	alu_operation => alu_operation,
	ALU_out => ALU_out,
	alu_result_prev => alu_result_prev,
	AM => AM,
	check_AM => check_AM,
	clock => clock,
	clr_z_flag => clr_z_flag,
	dm_out => dm_out,
	dpcr => dpcr,
	dpcr_lsb_sel => dpcr_lsb_sel,
	dpcr_wr => dpcr_wr,
	ir_write => ir_write,
	ld_r => ld_r,
	op => op,
	op1_mux_select => op1_mux_select,
	Op1_out => Op1_out,
	Op1_write => Op1_write,
	op2_mux_select => op2_mux_select,
	Op2_out => Op2_out,
	Op2_write => Op2_write,
	opcode => opcode,
	pc_mux_sel => pc_mux_sel,
	PC_out => PC_out,
	pc_write => pc_write,
	pm_outdata => pm_outdata,
	present_out => present_out,
	present_wr => present_wr,
	reset => reset,
	rf_mux => rf_mux,
	Rx => Rx,
	Rx_out => Rx_out,
	Rz => Rz,
	Rz_out => Rz_out,
	Sip_in => Sip_in,
	sop => sop,
	sop_wr => sop_wr,
	state_is => state_is,
	wr_en => wr_en,
	z_flag => z_flag
	);

-- clock
t_prcs_clock: PROCESS
BEGIN
	clock <= '1';
	WAIT FOR 10000 ps;
	FOR i IN 1 TO 49
	LOOP
		clock <= '0';
		WAIT FOR 10000 ps;
		clock <= '1';
		WAIT FOR 10000 ps;
	END LOOP;
	clock <= '0';
WAIT;
END PROCESS t_prcs_clock;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
	WAIT FOR 920000 ps;
	reset <= '1';
	WAIT FOR 10000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;
-- Sip_in[15]
t_prcs_Sip_in_15: PROCESS
BEGIN
	Sip_in(15) <= '1';
WAIT;
END PROCESS t_prcs_Sip_in_15;
-- Sip_in[14]
t_prcs_Sip_in_14: PROCESS
BEGIN
	Sip_in(14) <= '0';
WAIT;
END PROCESS t_prcs_Sip_in_14;
-- Sip_in[13]
t_prcs_Sip_in_13: PROCESS
BEGIN
	Sip_in(13) <= '0';
WAIT;
END PROCESS t_prcs_Sip_in_13;
-- Sip_in[12]
t_prcs_Sip_in_12: PROCESS
BEGIN
	Sip_in(12) <= '0';
WAIT;
END PROCESS t_prcs_Sip_in_12;
-- Sip_in[11]
t_prcs_Sip_in_11: PROCESS
BEGIN
	Sip_in(11) <= '1';
WAIT;
END PROCESS t_prcs_Sip_in_11;
-- Sip_in[10]
t_prcs_Sip_in_10: PROCESS
BEGIN
	Sip_in(10) <= '0';
WAIT;
END PROCESS t_prcs_Sip_in_10;
-- Sip_in[9]
t_prcs_Sip_in_9: PROCESS
BEGIN
	Sip_in(9) <= '0';
WAIT;
END PROCESS t_prcs_Sip_in_9;
-- Sip_in[8]
t_prcs_Sip_in_8: PROCESS
BEGIN
	Sip_in(8) <= '0';
WAIT;
END PROCESS t_prcs_Sip_in_8;
-- Sip_in[7]
t_prcs_Sip_in_7: PROCESS
BEGIN
	Sip_in(7) <= '1';
WAIT;
END PROCESS t_prcs_Sip_in_7;
-- Sip_in[6]
t_prcs_Sip_in_6: PROCESS
BEGIN
	Sip_in(6) <= '1';
WAIT;
END PROCESS t_prcs_Sip_in_6;
-- Sip_in[5]
t_prcs_Sip_in_5: PROCESS
BEGIN
	Sip_in(5) <= '0';
WAIT;
END PROCESS t_prcs_Sip_in_5;
-- Sip_in[4]
t_prcs_Sip_in_4: PROCESS
BEGIN
	Sip_in(4) <= '0';
WAIT;
END PROCESS t_prcs_Sip_in_4;
-- Sip_in[3]
t_prcs_Sip_in_3: PROCESS
BEGIN
	Sip_in(3) <= '0';
WAIT;
END PROCESS t_prcs_Sip_in_3;
-- Sip_in[2]
t_prcs_Sip_in_2: PROCESS
BEGIN
	Sip_in(2) <= '0';
WAIT;
END PROCESS t_prcs_Sip_in_2;
-- Sip_in[1]
t_prcs_Sip_in_1: PROCESS
BEGIN
	Sip_in(1) <= '0';
	WAIT FOR 500000 ps;
	Sip_in(1) <= '1';
WAIT;
END PROCESS t_prcs_Sip_in_1;
-- Sip_in[0]
t_prcs_Sip_in_0: PROCESS
BEGIN
	Sip_in(0) <= '1';
	WAIT FOR 500000 ps;
	Sip_in(0) <= '0';
WAIT;
END PROCESS t_prcs_Sip_in_0;
END fetch_decode_control_arch;
