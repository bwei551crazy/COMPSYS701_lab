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
-- Generated on "05/15/2024 16:28:51"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          fetch_with_control
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY fetch_with_control_vhd_vec_tst IS
END fetch_with_control_vhd_vec_tst;
ARCHITECTURE fetch_with_control_arch OF fetch_with_control_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL AM : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL check_AM : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL ir_write : STD_LOGIC;
SIGNAL op : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL opcode : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL pc_mux_sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL PC_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL pc_write : STD_LOGIC;
SIGNAL pm_outdata : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL present_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL rx : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Rx_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Rz_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL state_is : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT fetch_with_control
	PORT (
	AM : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	check_AM : OUT STD_LOGIC;
	clock : IN STD_LOGIC;
	ir_write : OUT STD_LOGIC;
	op : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	opcode : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	pc_mux_sel : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	PC_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	pc_write : OUT STD_LOGIC;
	pm_outdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	present_out : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	reset : IN STD_LOGIC;
	rx : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	Rx_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	Rz_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	state_is : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : fetch_with_control
	PORT MAP (
-- list connections between master ports and signals
	AM => AM,
	check_AM => check_AM,
	clock => clock,
	ir_write => ir_write,
	op => op,
	opcode => opcode,
	pc_mux_sel => pc_mux_sel,
	PC_out => PC_out,
	pc_write => pc_write,
	pm_outdata => pm_outdata,
	present_out => present_out,
	reset => reset,
	rx => rx,
	Rx_out => Rx_out,
	Rz_out => Rz_out,
	state_is => state_is
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
	WAIT FOR 400000 ps;
	reset <= '1';
	WAIT FOR 40000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;
-- present_out[15]
t_prcs_present_out_15: PROCESS
BEGIN
	present_out(15) <= '1';
	WAIT FOR 749000 ps;
	present_out(15) <= '0';
WAIT;
END PROCESS t_prcs_present_out_15;
-- present_out[14]
t_prcs_present_out_14: PROCESS
BEGIN
	present_out(14) <= '1';
	WAIT FOR 749000 ps;
	present_out(14) <= '0';
WAIT;
END PROCESS t_prcs_present_out_14;
-- present_out[13]
t_prcs_present_out_13: PROCESS
BEGIN
	present_out(13) <= '0';
WAIT;
END PROCESS t_prcs_present_out_13;
-- present_out[12]
t_prcs_present_out_12: PROCESS
BEGIN
	present_out(12) <= '0';
WAIT;
END PROCESS t_prcs_present_out_12;
-- present_out[11]
t_prcs_present_out_11: PROCESS
BEGIN
	present_out(11) <= '0';
WAIT;
END PROCESS t_prcs_present_out_11;
-- present_out[10]
t_prcs_present_out_10: PROCESS
BEGIN
	present_out(10) <= '0';
WAIT;
END PROCESS t_prcs_present_out_10;
-- present_out[9]
t_prcs_present_out_9: PROCESS
BEGIN
	present_out(9) <= '0';
WAIT;
END PROCESS t_prcs_present_out_9;
-- present_out[8]
t_prcs_present_out_8: PROCESS
BEGIN
	present_out(8) <= '0';
WAIT;
END PROCESS t_prcs_present_out_8;
-- present_out[7]
t_prcs_present_out_7: PROCESS
BEGIN
	present_out(7) <= '0';
WAIT;
END PROCESS t_prcs_present_out_7;
-- present_out[6]
t_prcs_present_out_6: PROCESS
BEGIN
	present_out(6) <= '0';
WAIT;
END PROCESS t_prcs_present_out_6;
-- present_out[5]
t_prcs_present_out_5: PROCESS
BEGIN
	present_out(5) <= '0';
WAIT;
END PROCESS t_prcs_present_out_5;
-- present_out[4]
t_prcs_present_out_4: PROCESS
BEGIN
	present_out(4) <= '0';
WAIT;
END PROCESS t_prcs_present_out_4;
-- present_out[3]
t_prcs_present_out_3: PROCESS
BEGIN
	present_out(3) <= '0';
WAIT;
END PROCESS t_prcs_present_out_3;
-- present_out[2]
t_prcs_present_out_2: PROCESS
BEGIN
	present_out(2) <= '0';
WAIT;
END PROCESS t_prcs_present_out_2;
-- present_out[1]
t_prcs_present_out_1: PROCESS
BEGIN
	present_out(1) <= '0';
	WAIT FOR 400000 ps;
	present_out(1) <= '1';
	WAIT FOR 349000 ps;
	present_out(1) <= '0';
WAIT;
END PROCESS t_prcs_present_out_1;
-- present_out[0]
t_prcs_present_out_0: PROCESS
BEGIN
	present_out(0) <= '0';
	WAIT FOR 200000 ps;
	present_out(0) <= '1';
	WAIT FOR 200000 ps;
	present_out(0) <= '0';
	WAIT FOR 200000 ps;
	present_out(0) <= '1';
	WAIT FOR 149000 ps;
	present_out(0) <= '0';
WAIT;
END PROCESS t_prcs_present_out_0;
-- rx[15]
t_prcs_rx_15: PROCESS
BEGIN
	rx(15) <= '1';
	WAIT FOR 749000 ps;
	rx(15) <= '0';
WAIT;
END PROCESS t_prcs_rx_15;
-- rx[14]
t_prcs_rx_14: PROCESS
BEGIN
	rx(14) <= '0';
WAIT;
END PROCESS t_prcs_rx_14;
-- rx[13]
t_prcs_rx_13: PROCESS
BEGIN
	rx(13) <= '0';
WAIT;
END PROCESS t_prcs_rx_13;
-- rx[12]
t_prcs_rx_12: PROCESS
BEGIN
	rx(12) <= '0';
WAIT;
END PROCESS t_prcs_rx_12;
-- rx[11]
t_prcs_rx_11: PROCESS
BEGIN
	rx(11) <= '0';
WAIT;
END PROCESS t_prcs_rx_11;
-- rx[10]
t_prcs_rx_10: PROCESS
BEGIN
	rx(10) <= '0';
WAIT;
END PROCESS t_prcs_rx_10;
-- rx[9]
t_prcs_rx_9: PROCESS
BEGIN
	rx(9) <= '0';
WAIT;
END PROCESS t_prcs_rx_9;
-- rx[8]
t_prcs_rx_8: PROCESS
BEGIN
	rx(8) <= '0';
WAIT;
END PROCESS t_prcs_rx_8;
-- rx[7]
t_prcs_rx_7: PROCESS
BEGIN
	rx(7) <= '0';
WAIT;
END PROCESS t_prcs_rx_7;
-- rx[6]
t_prcs_rx_6: PROCESS
BEGIN
	rx(6) <= '0';
WAIT;
END PROCESS t_prcs_rx_6;
-- rx[5]
t_prcs_rx_5: PROCESS
BEGIN
	rx(5) <= '0';
WAIT;
END PROCESS t_prcs_rx_5;
-- rx[4]
t_prcs_rx_4: PROCESS
BEGIN
	rx(4) <= '0';
WAIT;
END PROCESS t_prcs_rx_4;
-- rx[3]
t_prcs_rx_3: PROCESS
BEGIN
	rx(3) <= '0';
WAIT;
END PROCESS t_prcs_rx_3;
-- rx[2]
t_prcs_rx_2: PROCESS
BEGIN
	rx(2) <= '0';
WAIT;
END PROCESS t_prcs_rx_2;
-- rx[1]
t_prcs_rx_1: PROCESS
BEGIN
	rx(1) <= '0';
	WAIT FOR 400000 ps;
	rx(1) <= '1';
	WAIT FOR 349000 ps;
	rx(1) <= '0';
WAIT;
END PROCESS t_prcs_rx_1;
-- rx[0]
t_prcs_rx_0: PROCESS
BEGIN
	rx(0) <= '0';
	WAIT FOR 200000 ps;
	rx(0) <= '1';
	WAIT FOR 200000 ps;
	rx(0) <= '0';
	WAIT FOR 200000 ps;
	rx(0) <= '1';
	WAIT FOR 149000 ps;
	rx(0) <= '0';
WAIT;
END PROCESS t_prcs_rx_0;
END fetch_with_control_arch;
