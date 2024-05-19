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
-- Generated on "05/12/2024 23:47:28"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Fetch_testbench
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Fetch_testbench_vhd_vec_tst IS
END Fetch_testbench_vhd_vec_tst;
ARCHITECTURE Fetch_testbench_arch OF Fetch_testbench_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL AM : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL check_AM : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL ir : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL ir_write : STD_LOGIC;
SIGNAL mux_sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL op : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL opcode : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL PC_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL pc_write : STD_LOGIC;
SIGNAL pm_outdata : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL present_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL rx : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Rx_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Rz_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT Fetch_testbench
	PORT (
	AM : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	check_AM : IN STD_LOGIC;
	clock : IN STD_LOGIC;
	ir : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	ir_write : IN STD_LOGIC;
	mux_sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	op : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	opcode : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	PC_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	pc_write : IN STD_LOGIC;
	pm_outdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	present_out : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	reset : IN STD_LOGIC;
	rx : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	Rx_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	Rz_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Fetch_testbench
	PORT MAP (
-- list connections between master ports and signals
	AM => AM,
	check_AM => check_AM,
	clock => clock,
	ir => ir,
	ir_write => ir_write,
	mux_sel => mux_sel,
	op => op,
	opcode => opcode,
	PC_out => PC_out,
	pc_write => pc_write,
	pm_outdata => pm_outdata,
	present_out => present_out,
	reset => reset,
	rx => rx,
	Rx_out => Rx_out,
	Rz_out => Rz_out
	);

-- clock
t_prcs_clock: PROCESS
BEGIN
	clock <= '1';
	WAIT FOR 10000 ps;
	FOR i IN 1 TO 37
	LOOP
		clock <= '0';
		WAIT FOR 10000 ps;
		clock <= '1';
		WAIT FOR 10000 ps;
	END LOOP;
WAIT;
END PROCESS t_prcs_clock;
-- ir[15]
t_prcs_ir_15: PROCESS
BEGIN
	ir(15) <= '1';
WAIT;
END PROCESS t_prcs_ir_15;
-- ir[14]
t_prcs_ir_14: PROCESS
BEGIN
	ir(14) <= '0';
WAIT;
END PROCESS t_prcs_ir_14;
-- ir[13]
t_prcs_ir_13: PROCESS
BEGIN
	ir(13) <= '0';
WAIT;
END PROCESS t_prcs_ir_13;
-- ir[12]
t_prcs_ir_12: PROCESS
BEGIN
	ir(12) <= '0';
WAIT;
END PROCESS t_prcs_ir_12;
-- ir[11]
t_prcs_ir_11: PROCESS
BEGIN
	ir(11) <= '0';
WAIT;
END PROCESS t_prcs_ir_11;
-- ir[10]
t_prcs_ir_10: PROCESS
BEGIN
	ir(10) <= '0';
WAIT;
END PROCESS t_prcs_ir_10;
-- ir[9]
t_prcs_ir_9: PROCESS
BEGIN
	ir(9) <= '0';
WAIT;
END PROCESS t_prcs_ir_9;
-- ir[8]
t_prcs_ir_8: PROCESS
BEGIN
	ir(8) <= '0';
WAIT;
END PROCESS t_prcs_ir_8;
-- ir[7]
t_prcs_ir_7: PROCESS
BEGIN
	ir(7) <= '0';
WAIT;
END PROCESS t_prcs_ir_7;
-- ir[6]
t_prcs_ir_6: PROCESS
BEGIN
	ir(6) <= '0';
WAIT;
END PROCESS t_prcs_ir_6;
-- ir[5]
t_prcs_ir_5: PROCESS
BEGIN
	ir(5) <= '0';
WAIT;
END PROCESS t_prcs_ir_5;
-- ir[4]
t_prcs_ir_4: PROCESS
BEGIN
	ir(4) <= '0';
WAIT;
END PROCESS t_prcs_ir_4;
-- ir[3]
t_prcs_ir_3: PROCESS
BEGIN
	ir(3) <= '1';
WAIT;
END PROCESS t_prcs_ir_3;
-- ir[2]
t_prcs_ir_2: PROCESS
BEGIN
	ir(2) <= '0';
	WAIT FOR 400000 ps;
	ir(2) <= '1';
WAIT;
END PROCESS t_prcs_ir_2;
-- ir[1]
t_prcs_ir_1: PROCESS
BEGIN
	ir(1) <= '0';
	WAIT FOR 200000 ps;
	ir(1) <= '1';
	WAIT FOR 200000 ps;
	ir(1) <= '0';
	WAIT FOR 200000 ps;
	ir(1) <= '1';
WAIT;
END PROCESS t_prcs_ir_1;
-- ir[0]
t_prcs_ir_0: PROCESS
BEGIN
	FOR i IN 1 TO 3
	LOOP
		ir(0) <= '0';
		WAIT FOR 100000 ps;
		ir(0) <= '1';
		WAIT FOR 100000 ps;
	END LOOP;
	ir(0) <= '0';
	WAIT FOR 100000 ps;
	ir(0) <= '1';
WAIT;
END PROCESS t_prcs_ir_0;
-- mux_sel[1]
t_prcs_mux_sel_1: PROCESS
BEGIN
	mux_sel(1) <= '0';
	WAIT FOR 400000 ps;
	mux_sel(1) <= '1';
WAIT;
END PROCESS t_prcs_mux_sel_1;
-- mux_sel[0]
t_prcs_mux_sel_0: PROCESS
BEGIN
	mux_sel(0) <= '0';
	WAIT FOR 200000 ps;
	mux_sel(0) <= '1';
	WAIT FOR 200000 ps;
	mux_sel(0) <= '0';
	WAIT FOR 200000 ps;
	mux_sel(0) <= '1';
WAIT;
END PROCESS t_prcs_mux_sel_0;

-- pc_write
t_prcs_pc_write: PROCESS
BEGIN
	pc_write <= '1';
WAIT;
END PROCESS t_prcs_pc_write;

-- ir_write
t_prcs_ir_write: PROCESS
BEGIN
	ir_write <= '1';
WAIT;
END PROCESS t_prcs_ir_write;
-- present_out[15]
t_prcs_present_out_15: PROCESS
BEGIN
	present_out(15) <= '1';
WAIT;
END PROCESS t_prcs_present_out_15;
-- present_out[14]
t_prcs_present_out_14: PROCESS
BEGIN
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
	present_out(10) <= '1';
WAIT;
END PROCESS t_prcs_present_out_10;
-- present_out[9]
t_prcs_present_out_9: PROCESS
BEGIN
	present_out(9) <= '1';
WAIT;
END PROCESS t_prcs_present_out_9;
-- present_out[8]
t_prcs_present_out_8: PROCESS
BEGIN
	present_out(8) <= '1';
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
WAIT;
END PROCESS t_prcs_present_out_0;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
	WAIT FOR 110000 ps;
	reset <= '1';
	WAIT FOR 10000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;
-- rx[15]
t_prcs_rx_15: PROCESS
BEGIN
	rx(15) <= '1';
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
	rx(12) <= '1';
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
WAIT;
END PROCESS t_prcs_rx_0;

-- check_AM
t_prcs_check_AM: PROCESS
BEGIN
	FOR i IN 1 TO 9
	LOOP
		check_AM <= '0';
		WAIT FOR 20000 ps;
		check_AM <= '1';
		WAIT FOR 20000 ps;
	END LOOP;
	check_AM <= '0';
WAIT;
END PROCESS t_prcs_check_AM;
END Fetch_testbench_arch;
