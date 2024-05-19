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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "05/19/2024 15:33:31"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	fetch_decode_control IS
    PORT (
	ir_write : OUT std_logic;
	clock : IN std_logic;
	reset : IN std_logic;
	z_flag : OUT std_logic;
	clr_z_flag : OUT std_logic;
	alu_operation : OUT std_logic_vector(2 DOWNTO 0);
	Op1_out : OUT std_logic_vector(15 DOWNTO 0);
	Op1_write : OUT std_logic;
	op1_mux_select : OUT std_logic_vector(1 DOWNTO 0);
	op : OUT std_logic_vector(15 DOWNTO 0);
	check_AM : OUT std_logic;
	wr_en : OUT std_logic;
	Op2_out : OUT std_logic_vector(15 DOWNTO 0);
	Op2_write : OUT std_logic;
	op2_mux_select : OUT std_logic_vector(1 DOWNTO 0);
	pc_write : OUT std_logic;
	pc_mux_sel : OUT std_logic_vector(1 DOWNTO 0);
	present_out : OUT std_logic_vector(15 DOWNTO 0);
	present_wr : OUT std_logic;
	ld_r : OUT std_logic;
	ALU_out : OUT std_logic_vector(15 DOWNTO 0);
	dm_out : OUT std_logic_vector(15 DOWNTO 0);
	dpcr_lsb_sel : OUT std_logic;
	dpcr_wr : OUT std_logic;
	sop_wr : OUT std_logic;
	Sip_in : IN std_logic_vector(15 DOWNTO 0);
	AM : OUT std_logic_vector(1 DOWNTO 0);
	opcode : OUT std_logic_vector(5 DOWNTO 0);
	alu_result_prev : OUT std_logic_vector(15 DOWNTO 0);
	dpcr : OUT std_logic_vector(31 DOWNTO 0);
	PC_out : OUT std_logic_vector(15 DOWNTO 0);
	pm_outdata : OUT std_logic_vector(15 DOWNTO 0);
	rf_mux : OUT std_logic_vector(2 DOWNTO 0);
	Rx : OUT std_logic_vector(15 DOWNTO 0);
	Rx_out : OUT std_logic_vector(3 DOWNTO 0);
	Rz : OUT std_logic_vector(15 DOWNTO 0);
	Rz_out : OUT std_logic_vector(3 DOWNTO 0);
	sop : OUT std_logic_vector(15 DOWNTO 0);
	state_is : OUT std_logic_vector(2 DOWNTO 0)
	);
END fetch_decode_control;

ARCHITECTURE structure OF fetch_decode_control IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_ir_write : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_z_flag : std_logic;
SIGNAL ww_clr_z_flag : std_logic;
SIGNAL ww_alu_operation : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Op1_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Op1_write : std_logic;
SIGNAL ww_op1_mux_select : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_op : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_check_AM : std_logic;
SIGNAL ww_wr_en : std_logic;
SIGNAL ww_Op2_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Op2_write : std_logic;
SIGNAL ww_op2_mux_select : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_pc_write : std_logic;
SIGNAL ww_pc_mux_sel : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_present_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_present_wr : std_logic;
SIGNAL ww_ld_r : std_logic;
SIGNAL ww_ALU_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_dm_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_dpcr_lsb_sel : std_logic;
SIGNAL ww_dpcr_wr : std_logic;
SIGNAL ww_sop_wr : std_logic;
SIGNAL ww_Sip_in : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_AM : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_opcode : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_alu_result_prev : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_dpcr : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_PC_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_pm_outdata : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_rf_mux : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Rx : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Rx_out : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Rz : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Rz_out : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_sop : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_state_is : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a15_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a15_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a15_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a15_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a14_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a14_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a14_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a14_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a13_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a13_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a13_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a13_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a12_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a12_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a12_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a12_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a11_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a11_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a11_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a11_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a10_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a10_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a10_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a10_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a9_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a9_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a9_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a9_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a8_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a8_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a8_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a8_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a7_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a7_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a7_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a7_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a6_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a6_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a6_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a5_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a5_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a5_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a5_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a4_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a4_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a4_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a3_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a3_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a3_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a3_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a2_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a2_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a2_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a1_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a1_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a1_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a15_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a15_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a15_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a15_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a14_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a14_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a14_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a14_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a13_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a13_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a13_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a13_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a12_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a12_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a12_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a12_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a11_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a11_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a11_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a11_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a10_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a10_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a10_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a10_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a9_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a8_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a8_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a8_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a8_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a7_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a7_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a6_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a6_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a5_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a5_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a3_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a3_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a2_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a2_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a1_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a1_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ir_write~output_o\ : std_logic;
SIGNAL \z_flag~output_o\ : std_logic;
SIGNAL \clr_z_flag~output_o\ : std_logic;
SIGNAL \alu_operation[2]~output_o\ : std_logic;
SIGNAL \alu_operation[1]~output_o\ : std_logic;
SIGNAL \alu_operation[0]~output_o\ : std_logic;
SIGNAL \Op1_out[15]~output_o\ : std_logic;
SIGNAL \Op1_out[14]~output_o\ : std_logic;
SIGNAL \Op1_out[13]~output_o\ : std_logic;
SIGNAL \Op1_out[12]~output_o\ : std_logic;
SIGNAL \Op1_out[11]~output_o\ : std_logic;
SIGNAL \Op1_out[10]~output_o\ : std_logic;
SIGNAL \Op1_out[9]~output_o\ : std_logic;
SIGNAL \Op1_out[8]~output_o\ : std_logic;
SIGNAL \Op1_out[7]~output_o\ : std_logic;
SIGNAL \Op1_out[6]~output_o\ : std_logic;
SIGNAL \Op1_out[5]~output_o\ : std_logic;
SIGNAL \Op1_out[4]~output_o\ : std_logic;
SIGNAL \Op1_out[3]~output_o\ : std_logic;
SIGNAL \Op1_out[2]~output_o\ : std_logic;
SIGNAL \Op1_out[1]~output_o\ : std_logic;
SIGNAL \Op1_out[0]~output_o\ : std_logic;
SIGNAL \Op1_write~output_o\ : std_logic;
SIGNAL \op1_mux_select[1]~output_o\ : std_logic;
SIGNAL \op1_mux_select[0]~output_o\ : std_logic;
SIGNAL \op[15]~output_o\ : std_logic;
SIGNAL \op[14]~output_o\ : std_logic;
SIGNAL \op[13]~output_o\ : std_logic;
SIGNAL \op[12]~output_o\ : std_logic;
SIGNAL \op[11]~output_o\ : std_logic;
SIGNAL \op[10]~output_o\ : std_logic;
SIGNAL \op[9]~output_o\ : std_logic;
SIGNAL \op[8]~output_o\ : std_logic;
SIGNAL \op[7]~output_o\ : std_logic;
SIGNAL \op[6]~output_o\ : std_logic;
SIGNAL \op[5]~output_o\ : std_logic;
SIGNAL \op[4]~output_o\ : std_logic;
SIGNAL \op[3]~output_o\ : std_logic;
SIGNAL \op[2]~output_o\ : std_logic;
SIGNAL \op[1]~output_o\ : std_logic;
SIGNAL \op[0]~output_o\ : std_logic;
SIGNAL \check_AM~output_o\ : std_logic;
SIGNAL \wr_en~output_o\ : std_logic;
SIGNAL \Op2_out[15]~output_o\ : std_logic;
SIGNAL \Op2_out[14]~output_o\ : std_logic;
SIGNAL \Op2_out[13]~output_o\ : std_logic;
SIGNAL \Op2_out[12]~output_o\ : std_logic;
SIGNAL \Op2_out[11]~output_o\ : std_logic;
SIGNAL \Op2_out[10]~output_o\ : std_logic;
SIGNAL \Op2_out[9]~output_o\ : std_logic;
SIGNAL \Op2_out[8]~output_o\ : std_logic;
SIGNAL \Op2_out[7]~output_o\ : std_logic;
SIGNAL \Op2_out[6]~output_o\ : std_logic;
SIGNAL \Op2_out[5]~output_o\ : std_logic;
SIGNAL \Op2_out[4]~output_o\ : std_logic;
SIGNAL \Op2_out[3]~output_o\ : std_logic;
SIGNAL \Op2_out[2]~output_o\ : std_logic;
SIGNAL \Op2_out[1]~output_o\ : std_logic;
SIGNAL \Op2_out[0]~output_o\ : std_logic;
SIGNAL \Op2_write~output_o\ : std_logic;
SIGNAL \op2_mux_select[1]~output_o\ : std_logic;
SIGNAL \op2_mux_select[0]~output_o\ : std_logic;
SIGNAL \pc_write~output_o\ : std_logic;
SIGNAL \pc_mux_sel[1]~output_o\ : std_logic;
SIGNAL \pc_mux_sel[0]~output_o\ : std_logic;
SIGNAL \present_out[15]~output_o\ : std_logic;
SIGNAL \present_out[14]~output_o\ : std_logic;
SIGNAL \present_out[13]~output_o\ : std_logic;
SIGNAL \present_out[12]~output_o\ : std_logic;
SIGNAL \present_out[11]~output_o\ : std_logic;
SIGNAL \present_out[10]~output_o\ : std_logic;
SIGNAL \present_out[9]~output_o\ : std_logic;
SIGNAL \present_out[8]~output_o\ : std_logic;
SIGNAL \present_out[7]~output_o\ : std_logic;
SIGNAL \present_out[6]~output_o\ : std_logic;
SIGNAL \present_out[5]~output_o\ : std_logic;
SIGNAL \present_out[4]~output_o\ : std_logic;
SIGNAL \present_out[3]~output_o\ : std_logic;
SIGNAL \present_out[2]~output_o\ : std_logic;
SIGNAL \present_out[1]~output_o\ : std_logic;
SIGNAL \present_out[0]~output_o\ : std_logic;
SIGNAL \present_wr~output_o\ : std_logic;
SIGNAL \ld_r~output_o\ : std_logic;
SIGNAL \ALU_out[15]~output_o\ : std_logic;
SIGNAL \ALU_out[14]~output_o\ : std_logic;
SIGNAL \ALU_out[13]~output_o\ : std_logic;
SIGNAL \ALU_out[12]~output_o\ : std_logic;
SIGNAL \ALU_out[11]~output_o\ : std_logic;
SIGNAL \ALU_out[10]~output_o\ : std_logic;
SIGNAL \ALU_out[9]~output_o\ : std_logic;
SIGNAL \ALU_out[8]~output_o\ : std_logic;
SIGNAL \ALU_out[7]~output_o\ : std_logic;
SIGNAL \ALU_out[6]~output_o\ : std_logic;
SIGNAL \ALU_out[5]~output_o\ : std_logic;
SIGNAL \ALU_out[4]~output_o\ : std_logic;
SIGNAL \ALU_out[3]~output_o\ : std_logic;
SIGNAL \ALU_out[2]~output_o\ : std_logic;
SIGNAL \ALU_out[1]~output_o\ : std_logic;
SIGNAL \ALU_out[0]~output_o\ : std_logic;
SIGNAL \dm_out[15]~output_o\ : std_logic;
SIGNAL \dm_out[14]~output_o\ : std_logic;
SIGNAL \dm_out[13]~output_o\ : std_logic;
SIGNAL \dm_out[12]~output_o\ : std_logic;
SIGNAL \dm_out[11]~output_o\ : std_logic;
SIGNAL \dm_out[10]~output_o\ : std_logic;
SIGNAL \dm_out[9]~output_o\ : std_logic;
SIGNAL \dm_out[8]~output_o\ : std_logic;
SIGNAL \dm_out[7]~output_o\ : std_logic;
SIGNAL \dm_out[6]~output_o\ : std_logic;
SIGNAL \dm_out[5]~output_o\ : std_logic;
SIGNAL \dm_out[4]~output_o\ : std_logic;
SIGNAL \dm_out[3]~output_o\ : std_logic;
SIGNAL \dm_out[2]~output_o\ : std_logic;
SIGNAL \dm_out[1]~output_o\ : std_logic;
SIGNAL \dm_out[0]~output_o\ : std_logic;
SIGNAL \dpcr_lsb_sel~output_o\ : std_logic;
SIGNAL \dpcr_wr~output_o\ : std_logic;
SIGNAL \sop_wr~output_o\ : std_logic;
SIGNAL \AM[1]~output_o\ : std_logic;
SIGNAL \AM[0]~output_o\ : std_logic;
SIGNAL \opcode[5]~output_o\ : std_logic;
SIGNAL \opcode[4]~output_o\ : std_logic;
SIGNAL \opcode[3]~output_o\ : std_logic;
SIGNAL \opcode[2]~output_o\ : std_logic;
SIGNAL \opcode[1]~output_o\ : std_logic;
SIGNAL \opcode[0]~output_o\ : std_logic;
SIGNAL \alu_result_prev[15]~output_o\ : std_logic;
SIGNAL \alu_result_prev[14]~output_o\ : std_logic;
SIGNAL \alu_result_prev[13]~output_o\ : std_logic;
SIGNAL \alu_result_prev[12]~output_o\ : std_logic;
SIGNAL \alu_result_prev[11]~output_o\ : std_logic;
SIGNAL \alu_result_prev[10]~output_o\ : std_logic;
SIGNAL \alu_result_prev[9]~output_o\ : std_logic;
SIGNAL \alu_result_prev[8]~output_o\ : std_logic;
SIGNAL \alu_result_prev[7]~output_o\ : std_logic;
SIGNAL \alu_result_prev[6]~output_o\ : std_logic;
SIGNAL \alu_result_prev[5]~output_o\ : std_logic;
SIGNAL \alu_result_prev[4]~output_o\ : std_logic;
SIGNAL \alu_result_prev[3]~output_o\ : std_logic;
SIGNAL \alu_result_prev[2]~output_o\ : std_logic;
SIGNAL \alu_result_prev[1]~output_o\ : std_logic;
SIGNAL \alu_result_prev[0]~output_o\ : std_logic;
SIGNAL \dpcr[31]~output_o\ : std_logic;
SIGNAL \dpcr[30]~output_o\ : std_logic;
SIGNAL \dpcr[29]~output_o\ : std_logic;
SIGNAL \dpcr[28]~output_o\ : std_logic;
SIGNAL \dpcr[27]~output_o\ : std_logic;
SIGNAL \dpcr[26]~output_o\ : std_logic;
SIGNAL \dpcr[25]~output_o\ : std_logic;
SIGNAL \dpcr[24]~output_o\ : std_logic;
SIGNAL \dpcr[23]~output_o\ : std_logic;
SIGNAL \dpcr[22]~output_o\ : std_logic;
SIGNAL \dpcr[21]~output_o\ : std_logic;
SIGNAL \dpcr[20]~output_o\ : std_logic;
SIGNAL \dpcr[19]~output_o\ : std_logic;
SIGNAL \dpcr[18]~output_o\ : std_logic;
SIGNAL \dpcr[17]~output_o\ : std_logic;
SIGNAL \dpcr[16]~output_o\ : std_logic;
SIGNAL \dpcr[15]~output_o\ : std_logic;
SIGNAL \dpcr[14]~output_o\ : std_logic;
SIGNAL \dpcr[13]~output_o\ : std_logic;
SIGNAL \dpcr[12]~output_o\ : std_logic;
SIGNAL \dpcr[11]~output_o\ : std_logic;
SIGNAL \dpcr[10]~output_o\ : std_logic;
SIGNAL \dpcr[9]~output_o\ : std_logic;
SIGNAL \dpcr[8]~output_o\ : std_logic;
SIGNAL \dpcr[7]~output_o\ : std_logic;
SIGNAL \dpcr[6]~output_o\ : std_logic;
SIGNAL \dpcr[5]~output_o\ : std_logic;
SIGNAL \dpcr[4]~output_o\ : std_logic;
SIGNAL \dpcr[3]~output_o\ : std_logic;
SIGNAL \dpcr[2]~output_o\ : std_logic;
SIGNAL \dpcr[1]~output_o\ : std_logic;
SIGNAL \dpcr[0]~output_o\ : std_logic;
SIGNAL \PC_out[15]~output_o\ : std_logic;
SIGNAL \PC_out[14]~output_o\ : std_logic;
SIGNAL \PC_out[13]~output_o\ : std_logic;
SIGNAL \PC_out[12]~output_o\ : std_logic;
SIGNAL \PC_out[11]~output_o\ : std_logic;
SIGNAL \PC_out[10]~output_o\ : std_logic;
SIGNAL \PC_out[9]~output_o\ : std_logic;
SIGNAL \PC_out[8]~output_o\ : std_logic;
SIGNAL \PC_out[7]~output_o\ : std_logic;
SIGNAL \PC_out[6]~output_o\ : std_logic;
SIGNAL \PC_out[5]~output_o\ : std_logic;
SIGNAL \PC_out[4]~output_o\ : std_logic;
SIGNAL \PC_out[3]~output_o\ : std_logic;
SIGNAL \PC_out[2]~output_o\ : std_logic;
SIGNAL \PC_out[1]~output_o\ : std_logic;
SIGNAL \PC_out[0]~output_o\ : std_logic;
SIGNAL \pm_outdata[15]~output_o\ : std_logic;
SIGNAL \pm_outdata[14]~output_o\ : std_logic;
SIGNAL \pm_outdata[13]~output_o\ : std_logic;
SIGNAL \pm_outdata[12]~output_o\ : std_logic;
SIGNAL \pm_outdata[11]~output_o\ : std_logic;
SIGNAL \pm_outdata[10]~output_o\ : std_logic;
SIGNAL \pm_outdata[9]~output_o\ : std_logic;
SIGNAL \pm_outdata[8]~output_o\ : std_logic;
SIGNAL \pm_outdata[7]~output_o\ : std_logic;
SIGNAL \pm_outdata[6]~output_o\ : std_logic;
SIGNAL \pm_outdata[5]~output_o\ : std_logic;
SIGNAL \pm_outdata[4]~output_o\ : std_logic;
SIGNAL \pm_outdata[3]~output_o\ : std_logic;
SIGNAL \pm_outdata[2]~output_o\ : std_logic;
SIGNAL \pm_outdata[1]~output_o\ : std_logic;
SIGNAL \pm_outdata[0]~output_o\ : std_logic;
SIGNAL \rf_mux[2]~output_o\ : std_logic;
SIGNAL \rf_mux[1]~output_o\ : std_logic;
SIGNAL \rf_mux[0]~output_o\ : std_logic;
SIGNAL \Rx[15]~output_o\ : std_logic;
SIGNAL \Rx[14]~output_o\ : std_logic;
SIGNAL \Rx[13]~output_o\ : std_logic;
SIGNAL \Rx[12]~output_o\ : std_logic;
SIGNAL \Rx[11]~output_o\ : std_logic;
SIGNAL \Rx[10]~output_o\ : std_logic;
SIGNAL \Rx[9]~output_o\ : std_logic;
SIGNAL \Rx[8]~output_o\ : std_logic;
SIGNAL \Rx[7]~output_o\ : std_logic;
SIGNAL \Rx[6]~output_o\ : std_logic;
SIGNAL \Rx[5]~output_o\ : std_logic;
SIGNAL \Rx[4]~output_o\ : std_logic;
SIGNAL \Rx[3]~output_o\ : std_logic;
SIGNAL \Rx[2]~output_o\ : std_logic;
SIGNAL \Rx[1]~output_o\ : std_logic;
SIGNAL \Rx[0]~output_o\ : std_logic;
SIGNAL \Rx_out[3]~output_o\ : std_logic;
SIGNAL \Rx_out[2]~output_o\ : std_logic;
SIGNAL \Rx_out[1]~output_o\ : std_logic;
SIGNAL \Rx_out[0]~output_o\ : std_logic;
SIGNAL \Rz[15]~output_o\ : std_logic;
SIGNAL \Rz[14]~output_o\ : std_logic;
SIGNAL \Rz[13]~output_o\ : std_logic;
SIGNAL \Rz[12]~output_o\ : std_logic;
SIGNAL \Rz[11]~output_o\ : std_logic;
SIGNAL \Rz[10]~output_o\ : std_logic;
SIGNAL \Rz[9]~output_o\ : std_logic;
SIGNAL \Rz[8]~output_o\ : std_logic;
SIGNAL \Rz[7]~output_o\ : std_logic;
SIGNAL \Rz[6]~output_o\ : std_logic;
SIGNAL \Rz[5]~output_o\ : std_logic;
SIGNAL \Rz[4]~output_o\ : std_logic;
SIGNAL \Rz[3]~output_o\ : std_logic;
SIGNAL \Rz[2]~output_o\ : std_logic;
SIGNAL \Rz[1]~output_o\ : std_logic;
SIGNAL \Rz[0]~output_o\ : std_logic;
SIGNAL \Rz_out[3]~output_o\ : std_logic;
SIGNAL \Rz_out[2]~output_o\ : std_logic;
SIGNAL \Rz_out[1]~output_o\ : std_logic;
SIGNAL \Rz_out[0]~output_o\ : std_logic;
SIGNAL \sop[15]~output_o\ : std_logic;
SIGNAL \sop[14]~output_o\ : std_logic;
SIGNAL \sop[13]~output_o\ : std_logic;
SIGNAL \sop[12]~output_o\ : std_logic;
SIGNAL \sop[11]~output_o\ : std_logic;
SIGNAL \sop[10]~output_o\ : std_logic;
SIGNAL \sop[9]~output_o\ : std_logic;
SIGNAL \sop[8]~output_o\ : std_logic;
SIGNAL \sop[7]~output_o\ : std_logic;
SIGNAL \sop[6]~output_o\ : std_logic;
SIGNAL \sop[5]~output_o\ : std_logic;
SIGNAL \sop[4]~output_o\ : std_logic;
SIGNAL \sop[3]~output_o\ : std_logic;
SIGNAL \sop[2]~output_o\ : std_logic;
SIGNAL \sop[1]~output_o\ : std_logic;
SIGNAL \sop[0]~output_o\ : std_logic;
SIGNAL \state_is[2]~output_o\ : std_logic;
SIGNAL \state_is[1]~output_o\ : std_logic;
SIGNAL \state_is[0]~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \inst|Add0~61_sumout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \inst5|state.init~q\ : std_logic;
SIGNAL \inst5|state.T4~q\ : std_logic;
SIGNAL \inst5|next_state.T1~0_combout\ : std_logic;
SIGNAL \inst5|state.T1~q\ : std_logic;
SIGNAL \inst5|state.T1_1~q\ : std_logic;
SIGNAL \inst5|state.T2~q\ : std_logic;
SIGNAL \inst5|state.T3~q\ : std_logic;
SIGNAL \inst|Add0~14\ : std_logic;
SIGNAL \inst|Add0~9_sumout\ : std_logic;
SIGNAL \inst1|regs[4][10]~q\ : std_logic;
SIGNAL \inst1|regs[4][4]~q\ : std_logic;
SIGNAL \inst1|regs[8][4]~q\ : std_logic;
SIGNAL \inst1|regs[4][6]~q\ : std_logic;
SIGNAL \inst1|regs[8][6]~q\ : std_logic;
SIGNAL \inst1|regs[12][6]~q\ : std_logic;
SIGNAL \inst1|regs[1][7]~q\ : std_logic;
SIGNAL \inst1|Decoder0~2_combout\ : std_logic;
SIGNAL \inst1|regs[2][7]~q\ : std_logic;
SIGNAL \inst1|Decoder0~3_combout\ : std_logic;
SIGNAL \inst1|regs[3][7]~q\ : std_logic;
SIGNAL \inst1|Mux40~0_combout\ : std_logic;
SIGNAL \inst1|regs[4][7]~q\ : std_logic;
SIGNAL \inst1|Decoder0~5_combout\ : std_logic;
SIGNAL \inst1|regs[5][7]~q\ : std_logic;
SIGNAL \inst1|Decoder0~6_combout\ : std_logic;
SIGNAL \inst1|regs[6][7]~q\ : std_logic;
SIGNAL \inst1|Decoder0~7_combout\ : std_logic;
SIGNAL \inst1|regs[7][7]~q\ : std_logic;
SIGNAL \inst1|Mux40~1_combout\ : std_logic;
SIGNAL \inst1|regs[8][7]~q\ : std_logic;
SIGNAL \inst1|Decoder0~9_combout\ : std_logic;
SIGNAL \inst1|regs[9][7]~q\ : std_logic;
SIGNAL \inst1|Decoder0~10_combout\ : std_logic;
SIGNAL \inst1|regs[10][7]~q\ : std_logic;
SIGNAL \inst1|Decoder0~11_combout\ : std_logic;
SIGNAL \inst1|regs[11][7]~q\ : std_logic;
SIGNAL \inst1|Mux40~2_combout\ : std_logic;
SIGNAL \inst1|regs[12][7]~q\ : std_logic;
SIGNAL \inst1|Decoder0~13_combout\ : std_logic;
SIGNAL \inst1|regs[13][7]~q\ : std_logic;
SIGNAL \inst1|Decoder0~14_combout\ : std_logic;
SIGNAL \inst1|regs[14][7]~q\ : std_logic;
SIGNAL \inst1|Decoder0~15_combout\ : std_logic;
SIGNAL \inst1|regs[15][7]~q\ : std_logic;
SIGNAL \inst1|Mux40~3_combout\ : std_logic;
SIGNAL \inst1|Mux40~4_combout\ : std_logic;
SIGNAL \inst|Add0~10\ : std_logic;
SIGNAL \inst|Add0~5_sumout\ : std_logic;
SIGNAL \inst5|Selector2~0_combout\ : std_logic;
SIGNAL \inst5|ld_r~0_combout\ : std_logic;
SIGNAL \inst5|Mux16~0_combout\ : std_logic;
SIGNAL \inst5|sop_wr~0_combout\ : std_logic;
SIGNAL \inst5|Mux16~1_combout\ : std_logic;
SIGNAL \inst5|Mux16~2_combout\ : std_logic;
SIGNAL \inst5|Mux16~3_combout\ : std_logic;
SIGNAL \inst5|Mux17~0_combout\ : std_logic;
SIGNAL \inst5|Mux17~1_combout\ : std_logic;
SIGNAL \inst5|Mux18~0_combout\ : std_logic;
SIGNAL \inst1|Mux1~0_combout\ : std_logic;
SIGNAL \inst5|rf_input_sel[2]~0_combout\ : std_logic;
SIGNAL \inst1|Mux1~1_combout\ : std_logic;
SIGNAL \inst1|Mux0~0_combout\ : std_logic;
SIGNAL \Sip_in[3]~input_o\ : std_logic;
SIGNAL \inst1|regs[1][3]~q\ : std_logic;
SIGNAL \inst1|regs[2][3]~q\ : std_logic;
SIGNAL \inst1|regs[3][3]~q\ : std_logic;
SIGNAL \inst1|Mux44~0_combout\ : std_logic;
SIGNAL \inst1|regs[4][3]~q\ : std_logic;
SIGNAL \inst1|regs[5][3]~q\ : std_logic;
SIGNAL \inst1|regs[6][3]~q\ : std_logic;
SIGNAL \inst1|regs[7][3]~q\ : std_logic;
SIGNAL \inst1|Mux44~1_combout\ : std_logic;
SIGNAL \inst1|regs[8][3]~q\ : std_logic;
SIGNAL \inst1|regs[9][3]~q\ : std_logic;
SIGNAL \inst1|regs[10][3]~q\ : std_logic;
SIGNAL \inst1|regs[11][3]~q\ : std_logic;
SIGNAL \inst1|Mux44~2_combout\ : std_logic;
SIGNAL \inst1|regs[12][3]~q\ : std_logic;
SIGNAL \inst1|regs[13][3]~q\ : std_logic;
SIGNAL \inst1|regs[14][3]~q\ : std_logic;
SIGNAL \inst1|regs[15][3]~q\ : std_logic;
SIGNAL \inst1|Mux44~3_combout\ : std_logic;
SIGNAL \inst1|Mux44~4_combout\ : std_logic;
SIGNAL \inst1|regs[4][0]~q\ : std_logic;
SIGNAL \inst1|regs[8][0]~q\ : std_logic;
SIGNAL \inst1|regs[12][0]~q\ : std_logic;
SIGNAL \inst1|Mux47~0_combout\ : std_logic;
SIGNAL \inst1|regs[1][0]~q\ : std_logic;
SIGNAL \inst1|regs[5][0]~q\ : std_logic;
SIGNAL \inst1|regs[9][0]~q\ : std_logic;
SIGNAL \inst1|regs[13][0]~q\ : std_logic;
SIGNAL \inst1|Mux47~1_combout\ : std_logic;
SIGNAL \inst1|regs[2][0]~q\ : std_logic;
SIGNAL \inst1|regs[6][0]~q\ : std_logic;
SIGNAL \inst1|regs[10][0]~q\ : std_logic;
SIGNAL \inst1|regs[14][0]~q\ : std_logic;
SIGNAL \inst1|Mux47~2_combout\ : std_logic;
SIGNAL \inst1|regs[3][0]~q\ : std_logic;
SIGNAL \inst1|regs[7][0]~q\ : std_logic;
SIGNAL \inst1|regs[11][0]~q\ : std_logic;
SIGNAL \inst1|regs[15][0]~q\ : std_logic;
SIGNAL \inst1|Mux47~3_combout\ : std_logic;
SIGNAL \inst1|Mux47~4_combout\ : std_logic;
SIGNAL \inst1|regs[1][1]~q\ : std_logic;
SIGNAL \inst1|regs[2][1]~q\ : std_logic;
SIGNAL \inst1|regs[3][1]~q\ : std_logic;
SIGNAL \inst1|Mux46~0_combout\ : std_logic;
SIGNAL \inst1|regs[4][1]~q\ : std_logic;
SIGNAL \inst1|regs[5][1]~q\ : std_logic;
SIGNAL \inst1|regs[6][1]~q\ : std_logic;
SIGNAL \inst1|regs[7][1]~q\ : std_logic;
SIGNAL \inst1|Mux46~1_combout\ : std_logic;
SIGNAL \inst1|regs[8][1]~q\ : std_logic;
SIGNAL \inst1|regs[9][1]~q\ : std_logic;
SIGNAL \inst1|regs[10][1]~q\ : std_logic;
SIGNAL \inst1|regs[11][1]~q\ : std_logic;
SIGNAL \inst1|Mux46~2_combout\ : std_logic;
SIGNAL \inst1|regs[12][1]~q\ : std_logic;
SIGNAL \inst1|regs[13][1]~q\ : std_logic;
SIGNAL \inst1|regs[14][1]~q\ : std_logic;
SIGNAL \inst1|regs[15][1]~q\ : std_logic;
SIGNAL \inst1|Mux46~3_combout\ : std_logic;
SIGNAL \inst1|Mux46~4_combout\ : std_logic;
SIGNAL \inst1|regs[4][2]~q\ : std_logic;
SIGNAL \inst1|regs[8][2]~q\ : std_logic;
SIGNAL \inst1|regs[12][2]~q\ : std_logic;
SIGNAL \inst1|Mux45~0_combout\ : std_logic;
SIGNAL \inst1|regs[1][2]~q\ : std_logic;
SIGNAL \inst1|regs[5][2]~q\ : std_logic;
SIGNAL \inst1|regs[9][2]~q\ : std_logic;
SIGNAL \inst1|regs[13][2]~q\ : std_logic;
SIGNAL \inst1|Mux45~1_combout\ : std_logic;
SIGNAL \inst1|regs[2][2]~q\ : std_logic;
SIGNAL \inst1|regs[6][2]~q\ : std_logic;
SIGNAL \inst1|regs[10][2]~q\ : std_logic;
SIGNAL \inst1|regs[14][2]~q\ : std_logic;
SIGNAL \inst1|Mux45~2_combout\ : std_logic;
SIGNAL \inst1|regs[3][2]~q\ : std_logic;
SIGNAL \inst1|regs[7][2]~q\ : std_logic;
SIGNAL \inst1|regs[11][2]~q\ : std_logic;
SIGNAL \inst1|regs[15][2]~q\ : std_logic;
SIGNAL \inst1|Mux45~3_combout\ : std_logic;
SIGNAL \inst1|Mux45~4_combout\ : std_logic;
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a2~portbdataout\ : std_logic;
SIGNAL \inst5|Mux1~1_combout\ : std_logic;
SIGNAL \inst5|Mux1~0_combout\ : std_logic;
SIGNAL \inst5|Mux1~2_combout\ : std_logic;
SIGNAL \inst5|Mux1~3_combout\ : std_logic;
SIGNAL \inst5|Op1_mux_select[0]~3_combout\ : std_logic;
SIGNAL \inst5|Op1_mux_select[1]~0_combout\ : std_logic;
SIGNAL \inst5|Op1_mux_select[1]~1_combout\ : std_logic;
SIGNAL \inst5|Op1_mux_select[1]~2_combout\ : std_logic;
SIGNAL \inst2|OP1_Mux|Mux13~0_combout\ : std_logic;
SIGNAL \inst5|Op1_write~0_combout\ : std_logic;
SIGNAL \inst5|Op1_write~1_combout\ : std_logic;
SIGNAL \inst15|Add0~66_cout\ : std_logic;
SIGNAL \inst15|Add0~62\ : std_logic;
SIGNAL \inst15|Add0~58\ : std_logic;
SIGNAL \inst15|Add0~53_sumout\ : std_logic;
SIGNAL \inst5|Mux14~0_combout\ : std_logic;
SIGNAL \inst15|Mux13~1_combout\ : std_logic;
SIGNAL \inst15|Mux13~0_combout\ : std_logic;
SIGNAL \Sip_in[2]~input_o\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a2~portbdataout\ : std_logic;
SIGNAL \inst1|Mux0~1_combout\ : std_logic;
SIGNAL \inst1|Mux13~0_combout\ : std_logic;
SIGNAL \inst1|Mux13~1_combout\ : std_logic;
SIGNAL \inst1|Decoder0~0_combout\ : std_logic;
SIGNAL \inst1|regs[0][2]~q\ : std_logic;
SIGNAL \inst6|temp_AM[1]~0_combout\ : std_logic;
SIGNAL \inst1|Mux29~0_combout\ : std_logic;
SIGNAL \inst1|Mux29~1_combout\ : std_logic;
SIGNAL \inst1|Mux29~2_combout\ : std_logic;
SIGNAL \inst1|Mux29~3_combout\ : std_logic;
SIGNAL \inst1|Mux29~4_combout\ : std_logic;
SIGNAL \inst5|Mux1~9_combout\ : std_logic;
SIGNAL \inst5|Mux1~10_combout\ : std_logic;
SIGNAL \inst5|Mux1~4_combout\ : std_logic;
SIGNAL \inst5|Mux1~8_combout\ : std_logic;
SIGNAL \inst5|Op2_mux_select[0]~2_combout\ : std_logic;
SIGNAL \inst5|Mux1~6_combout\ : std_logic;
SIGNAL \inst5|Op2_mux_select[1]~0_combout\ : std_logic;
SIGNAL \inst5|Op2_mux_select[1]~1_combout\ : std_logic;
SIGNAL \inst4|OP2_Mux|Mux13~0_combout\ : std_logic;
SIGNAL \inst5|Mux1~7_combout\ : std_logic;
SIGNAL \inst5|Mux1~5_combout\ : std_logic;
SIGNAL \inst5|Op2_write~0_combout\ : std_logic;
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a1~portbdataout\ : std_logic;
SIGNAL \inst2|OP1_Mux|Mux14~0_combout\ : std_logic;
SIGNAL \inst15|Add0~57_sumout\ : std_logic;
SIGNAL \inst15|Mux14~1_combout\ : std_logic;
SIGNAL \inst15|Mux14~0_combout\ : std_logic;
SIGNAL \Sip_in[1]~input_o\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a1~portbdataout\ : std_logic;
SIGNAL \inst1|Mux14~0_combout\ : std_logic;
SIGNAL \inst1|Mux14~1_combout\ : std_logic;
SIGNAL \inst1|regs[0][1]~q\ : std_logic;
SIGNAL \inst1|Mux30~0_combout\ : std_logic;
SIGNAL \inst1|Mux30~1_combout\ : std_logic;
SIGNAL \inst1|Mux30~2_combout\ : std_logic;
SIGNAL \inst1|Mux30~3_combout\ : std_logic;
SIGNAL \inst1|Mux30~4_combout\ : std_logic;
SIGNAL \inst4|OP2_Mux|Mux14~0_combout\ : std_logic;
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \inst4|OP2_Mux|Mux15~0_combout\ : std_logic;
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a3~portbdataout\ : std_logic;
SIGNAL \inst4|OP2_Mux|Mux12~0_combout\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a3~portbdataout\ : std_logic;
SIGNAL \inst1|Mux12~0_combout\ : std_logic;
SIGNAL \inst1|Mux12~1_combout\ : std_logic;
SIGNAL \inst1|regs[0][3]~q\ : std_logic;
SIGNAL \inst1|Mux28~0_combout\ : std_logic;
SIGNAL \inst1|Mux28~1_combout\ : std_logic;
SIGNAL \inst1|Mux28~2_combout\ : std_logic;
SIGNAL \inst1|Mux28~3_combout\ : std_logic;
SIGNAL \inst1|Mux28~4_combout\ : std_logic;
SIGNAL \inst2|OP1_Mux|Mux12~0_combout\ : std_logic;
SIGNAL \inst15|Add0~54\ : std_logic;
SIGNAL \inst15|Add0~49_sumout\ : std_logic;
SIGNAL \inst15|Mux12~1_combout\ : std_logic;
SIGNAL \inst15|Mux12~0_combout\ : std_logic;
SIGNAL \inst15|z_flag~0_combout\ : std_logic;
SIGNAL \inst15|z_flag~1_combout\ : std_logic;
SIGNAL \inst|Add0~6\ : std_logic;
SIGNAL \inst|Add0~1_sumout\ : std_logic;
SIGNAL \Sip_in[15]~input_o\ : std_logic;
SIGNAL \inst1|regs[1][15]~q\ : std_logic;
SIGNAL \inst1|regs[2][15]~q\ : std_logic;
SIGNAL \inst1|regs[3][15]~q\ : std_logic;
SIGNAL \inst1|Mux32~0_combout\ : std_logic;
SIGNAL \inst1|regs[4][15]~q\ : std_logic;
SIGNAL \inst1|regs[5][15]~q\ : std_logic;
SIGNAL \inst1|regs[6][15]~q\ : std_logic;
SIGNAL \inst1|regs[7][15]~q\ : std_logic;
SIGNAL \inst1|Mux32~1_combout\ : std_logic;
SIGNAL \inst1|regs[8][15]~q\ : std_logic;
SIGNAL \inst1|regs[9][15]~q\ : std_logic;
SIGNAL \inst1|regs[10][15]~q\ : std_logic;
SIGNAL \inst1|regs[11][15]~q\ : std_logic;
SIGNAL \inst1|Mux32~2_combout\ : std_logic;
SIGNAL \inst1|regs[12][15]~q\ : std_logic;
SIGNAL \inst1|regs[13][15]~q\ : std_logic;
SIGNAL \inst1|regs[14][15]~q\ : std_logic;
SIGNAL \inst1|regs[15][15]~q\ : std_logic;
SIGNAL \inst1|Mux32~3_combout\ : std_logic;
SIGNAL \inst1|Mux32~4_combout\ : std_logic;
SIGNAL \inst4|OP2_Mux|Mux0~0_combout\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a15~portbdataout\ : std_logic;
SIGNAL \inst1|Mux0~2_combout\ : std_logic;
SIGNAL \inst1|Mux0~3_combout\ : std_logic;
SIGNAL \inst1|regs[0][15]~q\ : std_logic;
SIGNAL \inst1|Mux16~0_combout\ : std_logic;
SIGNAL \inst1|Mux16~1_combout\ : std_logic;
SIGNAL \inst1|Mux16~2_combout\ : std_logic;
SIGNAL \inst1|Mux16~3_combout\ : std_logic;
SIGNAL \inst1|Mux16~4_combout\ : std_logic;
SIGNAL \inst2|OP1_Mux|Mux0~0_combout\ : std_logic;
SIGNAL \inst1|regs[1][11]~q\ : std_logic;
SIGNAL \inst1|regs[2][11]~q\ : std_logic;
SIGNAL \inst1|regs[3][11]~q\ : std_logic;
SIGNAL \inst1|Mux36~0_combout\ : std_logic;
SIGNAL \inst1|regs[4][11]~q\ : std_logic;
SIGNAL \inst1|regs[5][11]~q\ : std_logic;
SIGNAL \inst1|regs[6][11]~q\ : std_logic;
SIGNAL \inst1|regs[7][11]~q\ : std_logic;
SIGNAL \inst1|Mux36~1_combout\ : std_logic;
SIGNAL \inst1|regs[8][11]~q\ : std_logic;
SIGNAL \inst1|regs[9][11]~q\ : std_logic;
SIGNAL \inst1|regs[10][11]~q\ : std_logic;
SIGNAL \inst1|regs[11][11]~q\ : std_logic;
SIGNAL \inst1|Mux36~2_combout\ : std_logic;
SIGNAL \inst1|regs[12][11]~q\ : std_logic;
SIGNAL \inst1|regs[13][11]~q\ : std_logic;
SIGNAL \inst1|regs[14][11]~q\ : std_logic;
SIGNAL \inst1|regs[15][11]~q\ : std_logic;
SIGNAL \inst1|Mux36~3_combout\ : std_logic;
SIGNAL \inst1|Mux36~4_combout\ : std_logic;
SIGNAL \inst4|OP2_Mux|Mux4~0_combout\ : std_logic;
SIGNAL \inst1|regs[1][9]~q\ : std_logic;
SIGNAL \inst1|regs[2][9]~q\ : std_logic;
SIGNAL \inst1|regs[3][9]~q\ : std_logic;
SIGNAL \inst1|Mux38~0_combout\ : std_logic;
SIGNAL \inst1|regs[4][9]~q\ : std_logic;
SIGNAL \inst1|regs[5][9]~q\ : std_logic;
SIGNAL \inst1|regs[6][9]~q\ : std_logic;
SIGNAL \inst1|regs[7][9]~q\ : std_logic;
SIGNAL \inst1|Mux38~1_combout\ : std_logic;
SIGNAL \inst1|regs[8][9]~q\ : std_logic;
SIGNAL \inst1|regs[9][9]~q\ : std_logic;
SIGNAL \inst1|regs[10][9]~q\ : std_logic;
SIGNAL \inst1|regs[11][9]~q\ : std_logic;
SIGNAL \inst1|Mux38~2_combout\ : std_logic;
SIGNAL \inst1|regs[12][9]~q\ : std_logic;
SIGNAL \inst1|regs[13][9]~q\ : std_logic;
SIGNAL \inst1|regs[14][9]~q\ : std_logic;
SIGNAL \inst1|regs[15][9]~q\ : std_logic;
SIGNAL \inst1|Mux38~3_combout\ : std_logic;
SIGNAL \inst1|Mux38~4_combout\ : std_logic;
SIGNAL \inst4|OP2_Mux|Mux6~0_combout\ : std_logic;
SIGNAL \inst15|Add0~50\ : std_logic;
SIGNAL \inst15|Add0~46\ : std_logic;
SIGNAL \inst15|Add0~42\ : std_logic;
SIGNAL \inst15|Add0~38\ : std_logic;
SIGNAL \inst15|Add0~34\ : std_logic;
SIGNAL \inst15|Add0~30\ : std_logic;
SIGNAL \inst15|Add0~26\ : std_logic;
SIGNAL \inst15|Add0~22\ : std_logic;
SIGNAL \inst15|Add0~18\ : std_logic;
SIGNAL \inst15|Add0~13_sumout\ : std_logic;
SIGNAL \inst15|Mux3~1_combout\ : std_logic;
SIGNAL \inst15|Mux3~0_combout\ : std_logic;
SIGNAL \Sip_in[12]~input_o\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a12~portbdataout\ : std_logic;
SIGNAL \inst1|Mux3~0_combout\ : std_logic;
SIGNAL \inst1|Mux3~1_combout\ : std_logic;
SIGNAL \inst1|regs[0][12]~q\ : std_logic;
SIGNAL \inst1|regs[4][12]~q\ : std_logic;
SIGNAL \inst1|regs[8][12]~q\ : std_logic;
SIGNAL \inst1|regs[12][12]~q\ : std_logic;
SIGNAL \inst1|Mux19~0_combout\ : std_logic;
SIGNAL \inst1|regs[1][12]~q\ : std_logic;
SIGNAL \inst1|regs[5][12]~q\ : std_logic;
SIGNAL \inst1|regs[9][12]~q\ : std_logic;
SIGNAL \inst1|regs[13][12]~q\ : std_logic;
SIGNAL \inst1|Mux19~1_combout\ : std_logic;
SIGNAL \inst1|regs[2][12]~q\ : std_logic;
SIGNAL \inst1|regs[6][12]~q\ : std_logic;
SIGNAL \inst1|regs[10][12]~q\ : std_logic;
SIGNAL \inst1|regs[14][12]~q\ : std_logic;
SIGNAL \inst1|Mux19~2_combout\ : std_logic;
SIGNAL \inst1|regs[3][12]~q\ : std_logic;
SIGNAL \inst1|regs[7][12]~q\ : std_logic;
SIGNAL \inst1|regs[11][12]~q\ : std_logic;
SIGNAL \inst1|regs[15][12]~q\ : std_logic;
SIGNAL \inst1|Mux19~3_combout\ : std_logic;
SIGNAL \inst1|Mux19~4_combout\ : std_logic;
SIGNAL \inst1|Mux35~0_combout\ : std_logic;
SIGNAL \inst1|Mux35~1_combout\ : std_logic;
SIGNAL \inst1|Mux35~2_combout\ : std_logic;
SIGNAL \inst1|Mux35~3_combout\ : std_logic;
SIGNAL \inst1|Mux35~4_combout\ : std_logic;
SIGNAL \inst4|OP2_Mux|Mux3~0_combout\ : std_logic;
SIGNAL \inst15|Add0~14\ : std_logic;
SIGNAL \inst15|Add0~9_sumout\ : std_logic;
SIGNAL \inst15|Mux2~1_combout\ : std_logic;
SIGNAL \inst15|Mux2~0_combout\ : std_logic;
SIGNAL \Sip_in[13]~input_o\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a13~portbdataout\ : std_logic;
SIGNAL \inst1|Mux2~0_combout\ : std_logic;
SIGNAL \inst1|Mux2~1_combout\ : std_logic;
SIGNAL \inst1|regs[0][13]~q\ : std_logic;
SIGNAL \inst1|regs[1][13]~q\ : std_logic;
SIGNAL \inst1|regs[2][13]~q\ : std_logic;
SIGNAL \inst1|regs[3][13]~q\ : std_logic;
SIGNAL \inst1|Mux18~0_combout\ : std_logic;
SIGNAL \inst1|regs[4][13]~q\ : std_logic;
SIGNAL \inst1|regs[5][13]~q\ : std_logic;
SIGNAL \inst1|regs[6][13]~q\ : std_logic;
SIGNAL \inst1|regs[7][13]~q\ : std_logic;
SIGNAL \inst1|Mux18~1_combout\ : std_logic;
SIGNAL \inst1|regs[8][13]~q\ : std_logic;
SIGNAL \inst1|regs[9][13]~q\ : std_logic;
SIGNAL \inst1|regs[10][13]~q\ : std_logic;
SIGNAL \inst1|regs[11][13]~q\ : std_logic;
SIGNAL \inst1|Mux18~2_combout\ : std_logic;
SIGNAL \inst1|regs[12][13]~q\ : std_logic;
SIGNAL \inst1|regs[13][13]~q\ : std_logic;
SIGNAL \inst1|regs[14][13]~q\ : std_logic;
SIGNAL \inst1|regs[15][13]~q\ : std_logic;
SIGNAL \inst1|Mux18~3_combout\ : std_logic;
SIGNAL \inst1|Mux18~4_combout\ : std_logic;
SIGNAL \inst1|Mux34~0_combout\ : std_logic;
SIGNAL \inst1|Mux34~1_combout\ : std_logic;
SIGNAL \inst1|Mux34~2_combout\ : std_logic;
SIGNAL \inst1|Mux34~3_combout\ : std_logic;
SIGNAL \inst1|Mux34~4_combout\ : std_logic;
SIGNAL \inst4|OP2_Mux|Mux2~0_combout\ : std_logic;
SIGNAL \inst15|Add0~10\ : std_logic;
SIGNAL \inst15|Add0~5_sumout\ : std_logic;
SIGNAL \inst15|Mux1~1_combout\ : std_logic;
SIGNAL \inst15|Mux1~0_combout\ : std_logic;
SIGNAL \Sip_in[14]~input_o\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a14~portbdataout\ : std_logic;
SIGNAL \inst1|Mux1~2_combout\ : std_logic;
SIGNAL \inst1|Mux1~3_combout\ : std_logic;
SIGNAL \inst1|regs[0][14]~q\ : std_logic;
SIGNAL \inst1|regs[4][14]~q\ : std_logic;
SIGNAL \inst1|regs[8][14]~q\ : std_logic;
SIGNAL \inst1|regs[12][14]~q\ : std_logic;
SIGNAL \inst1|Mux17~0_combout\ : std_logic;
SIGNAL \inst1|regs[1][14]~q\ : std_logic;
SIGNAL \inst1|regs[5][14]~q\ : std_logic;
SIGNAL \inst1|regs[9][14]~q\ : std_logic;
SIGNAL \inst1|regs[13][14]~q\ : std_logic;
SIGNAL \inst1|Mux17~1_combout\ : std_logic;
SIGNAL \inst1|regs[2][14]~q\ : std_logic;
SIGNAL \inst1|regs[6][14]~q\ : std_logic;
SIGNAL \inst1|regs[10][14]~q\ : std_logic;
SIGNAL \inst1|regs[14][14]~q\ : std_logic;
SIGNAL \inst1|Mux17~2_combout\ : std_logic;
SIGNAL \inst1|regs[3][14]~q\ : std_logic;
SIGNAL \inst1|regs[7][14]~q\ : std_logic;
SIGNAL \inst1|regs[11][14]~q\ : std_logic;
SIGNAL \inst1|regs[15][14]~q\ : std_logic;
SIGNAL \inst1|Mux17~3_combout\ : std_logic;
SIGNAL \inst1|Mux17~4_combout\ : std_logic;
SIGNAL \inst1|Mux33~0_combout\ : std_logic;
SIGNAL \inst1|Mux33~1_combout\ : std_logic;
SIGNAL \inst1|Mux33~2_combout\ : std_logic;
SIGNAL \inst1|Mux33~3_combout\ : std_logic;
SIGNAL \inst1|Mux33~4_combout\ : std_logic;
SIGNAL \inst4|OP2_Mux|Mux1~0_combout\ : std_logic;
SIGNAL \inst15|Add0~6\ : std_logic;
SIGNAL \inst15|Add0~1_sumout\ : std_logic;
SIGNAL \inst15|Mux0~2_combout\ : std_logic;
SIGNAL \inst15|Mux0~3_combout\ : std_logic;
SIGNAL \inst15|Mux0~1_combout\ : std_logic;
SIGNAL \inst5|clr_z_flag~0_combout\ : std_logic;
SIGNAL \inst15|z_flag~3_combout\ : std_logic;
SIGNAL \inst15|z_flag~4_combout\ : std_logic;
SIGNAL \inst15|z_flag~2_combout\ : std_logic;
SIGNAL \inst15|z_flag~q\ : std_logic;
SIGNAL \inst5|Selector0~0_combout\ : std_logic;
SIGNAL \inst5|Selector0~1_combout\ : std_logic;
SIGNAL \inst2|OP1_Mux|Mux1~0_combout\ : std_logic;
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a14~portbdataout\ : std_logic;
SIGNAL \inst5|Selector1~1_combout\ : std_logic;
SIGNAL \inst4|OP2_Mux|Mux8~0_combout\ : std_logic;
SIGNAL \inst15|Add0~33_sumout\ : std_logic;
SIGNAL \inst15|Mux8~1_combout\ : std_logic;
SIGNAL \inst15|Mux8~0_combout\ : std_logic;
SIGNAL \Sip_in[7]~input_o\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a7~portbdataout\ : std_logic;
SIGNAL \inst1|Mux8~0_combout\ : std_logic;
SIGNAL \inst1|Mux8~1_combout\ : std_logic;
SIGNAL \inst1|regs[0][7]~q\ : std_logic;
SIGNAL \inst1|Mux24~0_combout\ : std_logic;
SIGNAL \inst1|Mux24~1_combout\ : std_logic;
SIGNAL \inst1|Mux24~2_combout\ : std_logic;
SIGNAL \inst1|Mux24~3_combout\ : std_logic;
SIGNAL \inst1|Mux24~4_combout\ : std_logic;
SIGNAL \inst2|OP1_Mux|Mux8~0_combout\ : std_logic;
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a7~portbdataout\ : std_logic;
SIGNAL \inst1|Mux41~0_combout\ : std_logic;
SIGNAL \inst1|regs[1][6]~q\ : std_logic;
SIGNAL \inst1|regs[5][6]~q\ : std_logic;
SIGNAL \inst1|regs[9][6]~q\ : std_logic;
SIGNAL \inst1|regs[13][6]~q\ : std_logic;
SIGNAL \inst1|Mux41~1_combout\ : std_logic;
SIGNAL \inst1|regs[2][6]~q\ : std_logic;
SIGNAL \inst1|regs[6][6]~q\ : std_logic;
SIGNAL \inst1|regs[10][6]~q\ : std_logic;
SIGNAL \inst1|regs[14][6]~q\ : std_logic;
SIGNAL \inst1|Mux41~2_combout\ : std_logic;
SIGNAL \inst1|regs[3][6]~q\ : std_logic;
SIGNAL \inst1|regs[7][6]~q\ : std_logic;
SIGNAL \inst1|regs[11][6]~q\ : std_logic;
SIGNAL \inst1|regs[15][6]~q\ : std_logic;
SIGNAL \inst1|Mux41~3_combout\ : std_logic;
SIGNAL \inst1|Mux41~4_combout\ : std_logic;
SIGNAL \inst4|OP2_Mux|Mux9~0_combout\ : std_logic;
SIGNAL \inst15|Add0~37_sumout\ : std_logic;
SIGNAL \inst15|Mux9~1_combout\ : std_logic;
SIGNAL \inst15|Mux9~0_combout\ : std_logic;
SIGNAL \Sip_in[6]~input_o\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a6~portbdataout\ : std_logic;
SIGNAL \inst1|Mux9~0_combout\ : std_logic;
SIGNAL \inst1|Mux9~1_combout\ : std_logic;
SIGNAL \inst1|regs[0][6]~q\ : std_logic;
SIGNAL \inst1|Mux25~0_combout\ : std_logic;
SIGNAL \inst1|Mux25~1_combout\ : std_logic;
SIGNAL \inst1|Mux25~2_combout\ : std_logic;
SIGNAL \inst1|Mux25~3_combout\ : std_logic;
SIGNAL \inst1|Mux25~4_combout\ : std_logic;
SIGNAL \inst2|OP1_Mux|Mux9~0_combout\ : std_logic;
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a6~portbdataout\ : std_logic;
SIGNAL \inst1|Decoder0~1_combout\ : std_logic;
SIGNAL \inst1|regs[1][5]~q\ : std_logic;
SIGNAL \inst1|regs[2][5]~q\ : std_logic;
SIGNAL \inst1|regs[3][5]~q\ : std_logic;
SIGNAL \inst1|Mux42~0_combout\ : std_logic;
SIGNAL \inst1|regs[4][5]~q\ : std_logic;
SIGNAL \inst1|regs[5][5]~q\ : std_logic;
SIGNAL \inst1|regs[6][5]~q\ : std_logic;
SIGNAL \inst1|regs[7][5]~q\ : std_logic;
SIGNAL \inst1|Mux42~1_combout\ : std_logic;
SIGNAL \inst1|regs[8][5]~q\ : std_logic;
SIGNAL \inst1|regs[9][5]~q\ : std_logic;
SIGNAL \inst1|regs[10][5]~q\ : std_logic;
SIGNAL \inst1|regs[11][5]~q\ : std_logic;
SIGNAL \inst1|Mux42~2_combout\ : std_logic;
SIGNAL \inst1|regs[12][5]~q\ : std_logic;
SIGNAL \inst1|regs[13][5]~q\ : std_logic;
SIGNAL \inst1|regs[14][5]~q\ : std_logic;
SIGNAL \inst1|regs[15][5]~q\ : std_logic;
SIGNAL \inst1|Mux42~3_combout\ : std_logic;
SIGNAL \inst1|Mux42~4_combout\ : std_logic;
SIGNAL \inst4|OP2_Mux|Mux10~0_combout\ : std_logic;
SIGNAL \inst15|Add0~41_sumout\ : std_logic;
SIGNAL \inst15|Mux10~1_combout\ : std_logic;
SIGNAL \inst15|Mux10~0_combout\ : std_logic;
SIGNAL \Sip_in[5]~input_o\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a5~portbdataout\ : std_logic;
SIGNAL \inst1|Mux10~0_combout\ : std_logic;
SIGNAL \inst1|Mux10~1_combout\ : std_logic;
SIGNAL \inst1|regs[0][5]~q\ : std_logic;
SIGNAL \inst1|Mux26~0_combout\ : std_logic;
SIGNAL \inst1|Mux26~1_combout\ : std_logic;
SIGNAL \inst1|Mux26~2_combout\ : std_logic;
SIGNAL \inst1|Mux26~3_combout\ : std_logic;
SIGNAL \inst1|Mux26~4_combout\ : std_logic;
SIGNAL \inst2|OP1_Mux|Mux10~0_combout\ : std_logic;
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a5~portbdataout\ : std_logic;
SIGNAL \inst1|Decoder0~12_combout\ : std_logic;
SIGNAL \inst1|regs[12][4]~q\ : std_logic;
SIGNAL \inst1|Mux43~0_combout\ : std_logic;
SIGNAL \inst1|regs[1][4]~q\ : std_logic;
SIGNAL \inst1|regs[5][4]~q\ : std_logic;
SIGNAL \inst1|regs[9][4]~q\ : std_logic;
SIGNAL \inst1|regs[13][4]~q\ : std_logic;
SIGNAL \inst1|Mux43~1_combout\ : std_logic;
SIGNAL \inst1|regs[2][4]~q\ : std_logic;
SIGNAL \inst1|regs[6][4]~q\ : std_logic;
SIGNAL \inst1|regs[10][4]~q\ : std_logic;
SIGNAL \inst1|regs[14][4]~q\ : std_logic;
SIGNAL \inst1|Mux43~2_combout\ : std_logic;
SIGNAL \inst1|regs[3][4]~q\ : std_logic;
SIGNAL \inst1|regs[7][4]~q\ : std_logic;
SIGNAL \inst1|regs[11][4]~q\ : std_logic;
SIGNAL \inst1|regs[15][4]~q\ : std_logic;
SIGNAL \inst1|Mux43~3_combout\ : std_logic;
SIGNAL \inst1|Mux43~4_combout\ : std_logic;
SIGNAL \inst4|OP2_Mux|Mux11~0_combout\ : std_logic;
SIGNAL \inst15|Add0~45_sumout\ : std_logic;
SIGNAL \inst15|Mux11~1_combout\ : std_logic;
SIGNAL \inst15|Mux11~0_combout\ : std_logic;
SIGNAL \Sip_in[4]~input_o\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a4~portbdataout\ : std_logic;
SIGNAL \inst1|Mux11~0_combout\ : std_logic;
SIGNAL \inst1|Mux11~1_combout\ : std_logic;
SIGNAL \inst1|regs[0][4]~q\ : std_logic;
SIGNAL \inst1|Mux27~0_combout\ : std_logic;
SIGNAL \inst1|Mux27~1_combout\ : std_logic;
SIGNAL \inst1|Mux27~2_combout\ : std_logic;
SIGNAL \inst1|Mux27~3_combout\ : std_logic;
SIGNAL \inst1|Mux27~4_combout\ : std_logic;
SIGNAL \inst2|OP1_Mux|Mux11~0_combout\ : std_logic;
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a4~portbdataout\ : std_logic;
SIGNAL \inst1|Decoder0~8_combout\ : std_logic;
SIGNAL \inst1|regs[8][10]~q\ : std_logic;
SIGNAL \inst1|regs[12][10]~q\ : std_logic;
SIGNAL \inst1|Mux37~0_combout\ : std_logic;
SIGNAL \inst1|regs[1][10]~q\ : std_logic;
SIGNAL \inst1|regs[5][10]~q\ : std_logic;
SIGNAL \inst1|regs[9][10]~q\ : std_logic;
SIGNAL \inst1|regs[13][10]~q\ : std_logic;
SIGNAL \inst1|Mux37~1_combout\ : std_logic;
SIGNAL \inst1|regs[2][10]~q\ : std_logic;
SIGNAL \inst1|regs[6][10]~q\ : std_logic;
SIGNAL \inst1|regs[10][10]~q\ : std_logic;
SIGNAL \inst1|regs[14][10]~q\ : std_logic;
SIGNAL \inst1|Mux37~2_combout\ : std_logic;
SIGNAL \inst1|regs[3][10]~q\ : std_logic;
SIGNAL \inst1|regs[7][10]~q\ : std_logic;
SIGNAL \inst1|regs[11][10]~q\ : std_logic;
SIGNAL \inst1|regs[15][10]~q\ : std_logic;
SIGNAL \inst1|Mux37~3_combout\ : std_logic;
SIGNAL \inst1|Mux37~4_combout\ : std_logic;
SIGNAL \inst4|OP2_Mux|Mux5~0_combout\ : std_logic;
SIGNAL \inst15|Add0~21_sumout\ : std_logic;
SIGNAL \inst15|Mux5~1_combout\ : std_logic;
SIGNAL \inst15|Mux5~0_combout\ : std_logic;
SIGNAL \Sip_in[10]~input_o\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a10~portbdataout\ : std_logic;
SIGNAL \inst1|Mux5~0_combout\ : std_logic;
SIGNAL \inst1|Mux5~1_combout\ : std_logic;
SIGNAL \inst1|regs[0][10]~q\ : std_logic;
SIGNAL \inst1|Mux21~0_combout\ : std_logic;
SIGNAL \inst1|Mux21~1_combout\ : std_logic;
SIGNAL \inst1|Mux21~2_combout\ : std_logic;
SIGNAL \inst1|Mux21~3_combout\ : std_logic;
SIGNAL \inst1|Mux21~4_combout\ : std_logic;
SIGNAL \inst2|OP1_Mux|Mux5~0_combout\ : std_logic;
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a10~portbdataout\ : std_logic;
SIGNAL \inst5|dpcr_lsb_sel~0_combout\ : std_logic;
SIGNAL \inst5|Mux15~0_combout\ : std_logic;
SIGNAL \inst5|ld_r~1_combout\ : std_logic;
SIGNAL \inst1|Decoder0~4_combout\ : std_logic;
SIGNAL \inst1|regs[4][8]~q\ : std_logic;
SIGNAL \inst1|regs[8][8]~q\ : std_logic;
SIGNAL \inst1|regs[12][8]~q\ : std_logic;
SIGNAL \inst1|Mux39~0_combout\ : std_logic;
SIGNAL \inst1|regs[1][8]~q\ : std_logic;
SIGNAL \inst1|regs[5][8]~q\ : std_logic;
SIGNAL \inst1|regs[9][8]~q\ : std_logic;
SIGNAL \inst1|regs[13][8]~q\ : std_logic;
SIGNAL \inst1|Mux39~1_combout\ : std_logic;
SIGNAL \inst1|regs[2][8]~q\ : std_logic;
SIGNAL \inst1|regs[6][8]~q\ : std_logic;
SIGNAL \inst1|regs[10][8]~q\ : std_logic;
SIGNAL \inst1|regs[14][8]~q\ : std_logic;
SIGNAL \inst1|Mux39~2_combout\ : std_logic;
SIGNAL \inst1|regs[3][8]~q\ : std_logic;
SIGNAL \inst1|regs[7][8]~q\ : std_logic;
SIGNAL \inst1|regs[11][8]~q\ : std_logic;
SIGNAL \inst1|regs[15][8]~q\ : std_logic;
SIGNAL \inst1|Mux39~3_combout\ : std_logic;
SIGNAL \inst1|Mux39~4_combout\ : std_logic;
SIGNAL \inst4|OP2_Mux|Mux7~0_combout\ : std_logic;
SIGNAL \inst15|Add0~29_sumout\ : std_logic;
SIGNAL \inst15|Mux7~1_combout\ : std_logic;
SIGNAL \inst15|Mux7~0_combout\ : std_logic;
SIGNAL \Sip_in[8]~input_o\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a8~portbdataout\ : std_logic;
SIGNAL \inst1|Mux7~0_combout\ : std_logic;
SIGNAL \inst1|Mux7~1_combout\ : std_logic;
SIGNAL \inst1|regs[0][8]~q\ : std_logic;
SIGNAL \inst1|Mux23~0_combout\ : std_logic;
SIGNAL \inst1|Mux23~1_combout\ : std_logic;
SIGNAL \inst1|Mux23~2_combout\ : std_logic;
SIGNAL \inst1|Mux23~3_combout\ : std_logic;
SIGNAL \inst1|Mux23~4_combout\ : std_logic;
SIGNAL \inst2|OP1_Mux|Mux7~0_combout\ : std_logic;
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a8~portbdataout\ : std_logic;
SIGNAL \inst5|Mux14~1_combout\ : std_logic;
SIGNAL \inst15|Add0~17_sumout\ : std_logic;
SIGNAL \inst15|Mux4~1_combout\ : std_logic;
SIGNAL \inst15|Mux4~0_combout\ : std_logic;
SIGNAL \Sip_in[11]~input_o\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a11~portbdataout\ : std_logic;
SIGNAL \inst1|Mux4~0_combout\ : std_logic;
SIGNAL \inst1|Mux4~1_combout\ : std_logic;
SIGNAL \inst1|regs[0][11]~q\ : std_logic;
SIGNAL \inst1|Mux20~0_combout\ : std_logic;
SIGNAL \inst1|Mux20~1_combout\ : std_logic;
SIGNAL \inst1|Mux20~2_combout\ : std_logic;
SIGNAL \inst1|Mux20~3_combout\ : std_logic;
SIGNAL \inst1|Mux20~4_combout\ : std_logic;
SIGNAL \inst2|OP1_Mux|Mux4~0_combout\ : std_logic;
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a11~portbdataout\ : std_logic;
SIGNAL \inst5|Mux13~1_combout\ : std_logic;
SIGNAL \inst15|Mux0~0_combout\ : std_logic;
SIGNAL \inst15|Add0~25_sumout\ : std_logic;
SIGNAL \inst15|Mux6~1_combout\ : std_logic;
SIGNAL \inst15|Mux6~0_combout\ : std_logic;
SIGNAL \Sip_in[9]~input_o\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a9~portbdataout\ : std_logic;
SIGNAL \inst1|Mux6~0_combout\ : std_logic;
SIGNAL \inst1|Mux6~1_combout\ : std_logic;
SIGNAL \inst1|regs[0][9]~q\ : std_logic;
SIGNAL \inst1|Mux22~0_combout\ : std_logic;
SIGNAL \inst1|Mux22~1_combout\ : std_logic;
SIGNAL \inst1|Mux22~2_combout\ : std_logic;
SIGNAL \inst1|Mux22~3_combout\ : std_logic;
SIGNAL \inst1|Mux22~4_combout\ : std_logic;
SIGNAL \inst2|OP1_Mux|Mux6~0_combout\ : std_logic;
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a9~portbdataout\ : std_logic;
SIGNAL \inst5|Mux13~0_combout\ : std_logic;
SIGNAL \inst5|Selector0~2_combout\ : std_logic;
SIGNAL \inst2|OP1_Mux|Mux2~0_combout\ : std_logic;
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a13~portbdataout\ : std_logic;
SIGNAL \inst5|Mux12~0_combout\ : std_logic;
SIGNAL \inst15|Mux15~0_combout\ : std_logic;
SIGNAL \inst15|Add0~61_sumout\ : std_logic;
SIGNAL \inst15|Mux15~2_combout\ : std_logic;
SIGNAL \inst15|Mux15~1_combout\ : std_logic;
SIGNAL \Sip_in[0]~input_o\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \inst1|Mux15~0_combout\ : std_logic;
SIGNAL \inst1|Mux15~1_combout\ : std_logic;
SIGNAL \inst1|regs[0][0]~q\ : std_logic;
SIGNAL \inst1|Mux31~0_combout\ : std_logic;
SIGNAL \inst1|Mux31~1_combout\ : std_logic;
SIGNAL \inst1|Mux31~2_combout\ : std_logic;
SIGNAL \inst1|Mux31~3_combout\ : std_logic;
SIGNAL \inst1|Mux31~4_combout\ : std_logic;
SIGNAL \inst2|OP1_Mux|Mux15~0_combout\ : std_logic;
SIGNAL \inst|Add0~62\ : std_logic;
SIGNAL \inst|Add0~57_sumout\ : std_logic;
SIGNAL \inst|Add0~58\ : std_logic;
SIGNAL \inst|Add0~53_sumout\ : std_logic;
SIGNAL \inst|Add0~54\ : std_logic;
SIGNAL \inst|Add0~49_sumout\ : std_logic;
SIGNAL \inst|Add0~50\ : std_logic;
SIGNAL \inst|Add0~45_sumout\ : std_logic;
SIGNAL \inst|Add0~46\ : std_logic;
SIGNAL \inst|Add0~41_sumout\ : std_logic;
SIGNAL \inst|Add0~42\ : std_logic;
SIGNAL \inst|Add0~37_sumout\ : std_logic;
SIGNAL \inst|Add0~38\ : std_logic;
SIGNAL \inst|Add0~33_sumout\ : std_logic;
SIGNAL \inst|Add0~34\ : std_logic;
SIGNAL \inst|Add0~29_sumout\ : std_logic;
SIGNAL \inst|Add0~30\ : std_logic;
SIGNAL \inst|Add0~25_sumout\ : std_logic;
SIGNAL \inst|Add0~26\ : std_logic;
SIGNAL \inst|Add0~21_sumout\ : std_logic;
SIGNAL \inst|Add0~22\ : std_logic;
SIGNAL \inst|Add0~17_sumout\ : std_logic;
SIGNAL \inst|Add0~18\ : std_logic;
SIGNAL \inst|Add0~13_sumout\ : std_logic;
SIGNAL \inst2|OP1_Mux|Mux3~0_combout\ : std_logic;
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a12~portbdataout\ : std_logic;
SIGNAL \inst5|wr_en~0_combout\ : std_logic;
SIGNAL \inst5|wr_en~1_combout\ : std_logic;
SIGNAL \inst3|memory_rtl_0|auto_generated|ram_block1a15~portbdataout\ : std_logic;
SIGNAL \inst5|Selector1~0_combout\ : std_logic;
SIGNAL \inst5|alu_operation[1]~0_combout\ : std_logic;
SIGNAL \inst5|alu_operation[0]~1_combout\ : std_logic;
SIGNAL \inst5|present_wr~0_combout\ : std_logic;
SIGNAL \inst5|present_wr~1_combout\ : std_logic;
SIGNAL \inst19|store[15]~0_combout\ : std_logic;
SIGNAL \inst19|store[15]~1_combout\ : std_logic;
SIGNAL \inst19|store[15]~2_combout\ : std_logic;
SIGNAL \inst19|store[15]~3_combout\ : std_logic;
SIGNAL \inst5|present_wr~2_combout\ : std_logic;
SIGNAL \inst5|dpcr_lsb_sel~1_combout\ : std_logic;
SIGNAL \inst5|dpcr_wr~0_combout\ : std_logic;
SIGNAL \inst5|sop_wr~1_combout\ : std_logic;
SIGNAL \inst5|rf_input_sel[1]~1_combout\ : std_logic;
SIGNAL \inst5|rf_input_sel[0]~2_combout\ : std_logic;
SIGNAL \inst5|WideOr3~combout\ : std_logic;
SIGNAL \inst5|WideOr4~combout\ : std_logic;
SIGNAL \inst4|temp_op2_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst7|dpcr\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \inst2|temp_op1_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst|pc_counter\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst6|temp_AM\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst6|temp_opcode\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst6|temp_op\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst19|store\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst6|temp_rx\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst6|temp_rz\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst7|sop\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst5|state_is\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst7|sip_r\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_clock~input_o\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a0~portbdataout\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a1~portbdataout\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a2~portbdataout\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a3~portbdataout\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a4~portbdataout\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a5~portbdataout\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a6~portbdataout\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a7~portbdataout\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a8~portbdataout\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a9~portbdataout\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a10~portbdataout\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a11~portbdataout\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a12~portbdataout\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a13~portbdataout\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a14~portbdataout\ : std_logic;
SIGNAL \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a15~portbdataout\ : std_logic;
SIGNAL \inst15|ALT_INV_z_flag~q\ : std_logic;
SIGNAL \inst5|ALT_INV_Selector1~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_state.T1~q\ : std_logic;
SIGNAL \inst5|ALT_INV_state.T1_1~q\ : std_logic;
SIGNAL \inst6|ALT_INV_temp_AM\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst5|ALT_INV_Op1_mux_select[0]~3_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Op2_mux_select[0]~2_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Add0~61_sumout\ : std_logic;
SIGNAL \inst15|ALT_INV_Add0~57_sumout\ : std_logic;
SIGNAL \inst15|ALT_INV_Add0~53_sumout\ : std_logic;
SIGNAL \inst15|ALT_INV_Add0~49_sumout\ : std_logic;
SIGNAL \inst15|ALT_INV_Add0~45_sumout\ : std_logic;
SIGNAL \inst15|ALT_INV_Add0~41_sumout\ : std_logic;
SIGNAL \inst15|ALT_INV_Add0~37_sumout\ : std_logic;
SIGNAL \inst15|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \inst15|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \inst15|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \inst15|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \inst15|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \inst15|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \inst15|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \inst15|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \inst15|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_pc_counter\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst5|ALT_INV_Mux17~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_rf_input_sel[2]~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux16~3_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux16~2_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_ld_r~1_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_ld_r~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux15~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux16~1_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_sop_wr~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_present_wr~1_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_present_wr~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Selector0~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_state.T4~q\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux1~10_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux1~9_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux1~8_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Op2_mux_select[1]~1_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Op2_mux_select[1]~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux1~7_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux1~6_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux1~5_combout\ : std_logic;
SIGNAL \inst4|ALT_INV_temp_op2_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst5|ALT_INV_wr_en~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux1~4_combout\ : std_logic;
SIGNAL \inst6|ALT_INV_temp_op\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst5|ALT_INV_Op1_mux_select[1]~2_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Op1_mux_select[1]~1_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux1~3_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Op1_mux_select[1]~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux1~2_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Op1_write~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux1~1_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_state.T2~q\ : std_logic;
SIGNAL \inst2|ALT_INV_temp_op1_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst5|ALT_INV_Mux14~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Selector2~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_state.init~q\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux12~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_dpcr_lsb_sel~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_clr_z_flag~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux16~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux13~0_combout\ : std_logic;
SIGNAL \inst6|ALT_INV_temp_opcode\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst5|ALT_INV_state.T3~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[10][10]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[6][10]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[2][10]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux21~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[13][10]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[9][10]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[5][10]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[1][10]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux21~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[12][10]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[8][10]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[4][10]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[0][10]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux20~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux20~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[15][11]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[14][11]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[13][11]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[12][11]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux20~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[11][11]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[10][11]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[9][11]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[8][11]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux20~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[7][11]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[6][11]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[5][11]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[4][11]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux20~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[3][11]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[2][11]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[1][11]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[0][11]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux19~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux19~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[15][12]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[11][12]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[7][12]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[3][12]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux19~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[14][12]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[10][12]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[6][12]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[2][12]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux19~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[13][12]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[9][12]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[5][12]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[1][12]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux19~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[12][12]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[8][12]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[4][12]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[0][12]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux18~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux18~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[15][13]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[14][13]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[13][13]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[12][13]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux18~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[11][13]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[10][13]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[9][13]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[8][13]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux18~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[7][13]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[6][13]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[5][13]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[4][13]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux18~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[3][13]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[2][13]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[1][13]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[0][13]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux17~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux17~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[15][14]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[11][14]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[7][14]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[3][14]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux17~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[14][14]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[10][14]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[6][14]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[2][14]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux17~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[13][14]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[9][14]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[5][14]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[1][14]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux17~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[12][14]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[8][14]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[4][14]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[0][14]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux16~4_combout\ : std_logic;
SIGNAL \inst6|ALT_INV_temp_rx\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst1|ALT_INV_Mux16~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[15][15]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[14][15]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[13][15]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[12][15]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux16~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[11][15]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[10][15]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[9][15]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[8][15]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux16~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[7][15]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[6][15]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[5][15]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[4][15]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux16~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[3][15]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[2][15]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[1][15]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[0][15]~q\ : std_logic;
SIGNAL \inst5|ALT_INV_rf_input_sel[0]~2_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux18~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux17~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[14][4]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[10][4]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[6][4]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[2][4]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux27~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[13][4]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[9][4]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[5][4]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[1][4]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux27~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[12][4]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[8][4]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[4][4]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[0][4]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux26~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux26~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[15][5]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[14][5]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[13][5]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[12][5]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux26~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[11][5]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[10][5]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[9][5]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[8][5]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux26~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[7][5]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[6][5]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[5][5]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[4][5]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux26~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[3][5]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[2][5]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[1][5]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[0][5]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux25~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux25~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[15][6]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[11][6]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[7][6]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[3][6]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux25~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[14][6]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[10][6]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[6][6]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[2][6]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux25~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[13][6]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[9][6]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[5][6]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[1][6]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux25~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[12][6]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[8][6]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[4][6]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[0][6]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux24~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux24~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[15][7]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[14][7]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[13][7]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[12][7]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux24~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[11][7]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[10][7]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[9][7]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[8][7]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux24~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[7][7]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[6][7]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[5][7]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[4][7]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux24~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[3][7]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[2][7]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[1][7]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[0][7]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux23~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux23~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[15][8]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[11][8]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[7][8]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[3][8]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux23~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[14][8]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[10][8]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[6][8]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[2][8]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux23~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[13][8]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[9][8]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[5][8]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[1][8]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux23~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[12][8]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[8][8]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[4][8]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[0][8]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux22~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux22~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[15][9]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[14][9]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[13][9]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[12][9]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux22~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[11][9]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[10][9]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[9][9]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[8][9]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux22~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[7][9]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[6][9]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[5][9]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[4][9]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux22~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[3][9]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[2][9]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[1][9]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[0][9]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux21~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux21~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[15][10]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[11][10]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[7][10]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[3][10]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux21~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[14][10]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux38~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux37~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux37~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux37~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux37~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux37~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux36~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux36~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux36~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux36~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux36~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux35~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux35~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux35~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux35~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux35~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux34~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux34~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux34~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux34~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux34~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux33~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux33~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux33~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux33~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux33~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux32~4_combout\ : std_logic;
SIGNAL \inst6|ALT_INV_temp_rz\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst1|ALT_INV_Mux32~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux32~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux32~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux32~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux31~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux31~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[15][0]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[11][0]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[7][0]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[3][0]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux31~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[14][0]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[10][0]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[6][0]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[2][0]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux31~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[13][0]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[9][0]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[5][0]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[1][0]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux31~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[12][0]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[8][0]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[4][0]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[0][0]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux30~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux30~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[15][1]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[14][1]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[13][1]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[12][1]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux30~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[11][1]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[10][1]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[9][1]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[8][1]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux30~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[7][1]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[6][1]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[5][1]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[4][1]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux30~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[3][1]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[2][1]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[1][1]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[0][1]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux29~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux29~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[15][2]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[11][2]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[7][2]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[3][2]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux29~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[14][2]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[10][2]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[6][2]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[2][2]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux29~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[13][2]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[9][2]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[5][2]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[1][2]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux29~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[12][2]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[8][2]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[4][2]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[0][2]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux28~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux28~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[15][3]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[14][3]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[13][3]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[12][3]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux28~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[11][3]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[10][3]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[9][3]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[8][3]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux28~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[7][3]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[6][3]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[5][3]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[4][3]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux28~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[3][3]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[2][3]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[1][3]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[0][3]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux27~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux27~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[15][4]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[11][4]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[7][4]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_regs[3][4]~q\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux27~2_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux12~0_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux11~0_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux10~0_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux9~0_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux8~0_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux7~0_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux0~1_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux15~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux13~1_combout\ : std_logic;
SIGNAL \inst19|ALT_INV_store[15]~2_combout\ : std_logic;
SIGNAL \inst19|ALT_INV_store[15]~1_combout\ : std_logic;
SIGNAL \inst19|ALT_INV_store[15]~0_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_z_flag~1_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_z_flag~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_WideOr4~combout\ : std_logic;
SIGNAL \inst5|ALT_INV_next_state.T1~0_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_WideOr3~combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux47~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux47~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux47~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux47~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux47~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux46~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux46~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux46~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux46~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux46~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux45~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux45~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux45~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux45~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux45~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux44~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux44~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux44~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux44~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux44~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux43~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux43~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux43~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux43~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux43~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux42~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux42~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux42~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux42~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux42~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux41~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux41~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux41~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux41~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux41~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux40~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux40~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux40~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux40~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux40~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux39~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux39~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux39~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux39~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux39~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux38~4_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux38~3_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux38~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux38~1_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux15~2_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux14~1_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux13~1_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux12~1_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux10~1_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux9~1_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux8~1_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux7~1_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux6~1_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux5~1_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux4~1_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux3~1_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux2~1_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux1~1_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux0~3_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux0~2_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux11~1_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_z_flag~4_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_z_flag~3_combout\ : std_logic;
SIGNAL \inst5|ALT_INV_Mux14~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux15~0_combout\ : std_logic;
SIGNAL \inst7|ALT_INV_sip_r\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst1|ALT_INV_Mux14~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux13~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux12~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux11~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux10~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux9~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux8~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux7~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux1~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux0~2_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux0~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux1~1_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux15~1_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux14~0_combout\ : std_logic;
SIGNAL \inst15|ALT_INV_Mux13~0_combout\ : std_logic;

BEGIN

ir_write <= ww_ir_write;
ww_clock <= clock;
ww_reset <= reset;
z_flag <= ww_z_flag;
clr_z_flag <= ww_clr_z_flag;
alu_operation <= ww_alu_operation;
Op1_out <= ww_Op1_out;
Op1_write <= ww_Op1_write;
op1_mux_select <= ww_op1_mux_select;
op <= ww_op;
check_AM <= ww_check_AM;
wr_en <= ww_wr_en;
Op2_out <= ww_Op2_out;
Op2_write <= ww_Op2_write;
op2_mux_select <= ww_op2_mux_select;
pc_write <= ww_pc_write;
pc_mux_sel <= ww_pc_mux_sel;
present_out <= ww_present_out;
present_wr <= ww_present_wr;
ld_r <= ww_ld_r;
ALU_out <= ww_ALU_out;
dm_out <= ww_dm_out;
dpcr_lsb_sel <= ww_dpcr_lsb_sel;
dpcr_wr <= ww_dpcr_wr;
sop_wr <= ww_sop_wr;
ww_Sip_in <= Sip_in;
AM <= ww_AM;
opcode <= ww_opcode;
alu_result_prev <= ww_alu_result_prev;
dpcr <= ww_dpcr;
PC_out <= ww_PC_out;
pm_outdata <= ww_pm_outdata;
rf_mux <= ww_rf_mux;
Rx <= ww_Rx;
Rx_out <= ww_Rx_out;
Rz <= ww_Rz;
Rz_out <= ww_Rz_out;
sop <= ww_sop;
state_is <= ww_state_is;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst3|memory_rtl_1|auto_generated|ram_block1a15_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(15);

\inst3|memory_rtl_1|auto_generated|ram_block1a15_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a15_PORTBADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a15~portbdataout\ <= \inst3|memory_rtl_1|auto_generated|ram_block1a15_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_1|auto_generated|ram_block1a14_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(14);

\inst3|memory_rtl_1|auto_generated|ram_block1a14_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a14_PORTBADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a14~portbdataout\ <= \inst3|memory_rtl_1|auto_generated|ram_block1a14_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_1|auto_generated|ram_block1a13_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(13);

\inst3|memory_rtl_1|auto_generated|ram_block1a13_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a13_PORTBADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a13~portbdataout\ <= \inst3|memory_rtl_1|auto_generated|ram_block1a13_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_1|auto_generated|ram_block1a12_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(12);

\inst3|memory_rtl_1|auto_generated|ram_block1a12_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a12_PORTBADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a12~portbdataout\ <= \inst3|memory_rtl_1|auto_generated|ram_block1a12_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_1|auto_generated|ram_block1a11_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(11);

\inst3|memory_rtl_1|auto_generated|ram_block1a11_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a11_PORTBADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a11~portbdataout\ <= \inst3|memory_rtl_1|auto_generated|ram_block1a11_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_1|auto_generated|ram_block1a10_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(10);

\inst3|memory_rtl_1|auto_generated|ram_block1a10_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a10_PORTBADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a10~portbdataout\ <= \inst3|memory_rtl_1|auto_generated|ram_block1a10_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_1|auto_generated|ram_block1a9_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(9);

\inst3|memory_rtl_1|auto_generated|ram_block1a9_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a9_PORTBADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a9~portbdataout\ <= \inst3|memory_rtl_1|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_1|auto_generated|ram_block1a8_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(8);

\inst3|memory_rtl_1|auto_generated|ram_block1a8_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a8_PORTBADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a8~portbdataout\ <= \inst3|memory_rtl_1|auto_generated|ram_block1a8_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_1|auto_generated|ram_block1a7_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(7);

\inst3|memory_rtl_1|auto_generated|ram_block1a7_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a7_PORTBADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a7~portbdataout\ <= \inst3|memory_rtl_1|auto_generated|ram_block1a7_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_1|auto_generated|ram_block1a6_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(6);

\inst3|memory_rtl_1|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a6_PORTBADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a6~portbdataout\ <= \inst3|memory_rtl_1|auto_generated|ram_block1a6_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_1|auto_generated|ram_block1a5_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(5);

\inst3|memory_rtl_1|auto_generated|ram_block1a5_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a5_PORTBADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a5~portbdataout\ <= \inst3|memory_rtl_1|auto_generated|ram_block1a5_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_1|auto_generated|ram_block1a4_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(4);

\inst3|memory_rtl_1|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a4_PORTBADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a4~portbdataout\ <= \inst3|memory_rtl_1|auto_generated|ram_block1a4_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_1|auto_generated|ram_block1a3_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(3);

\inst3|memory_rtl_1|auto_generated|ram_block1a3_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a3_PORTBADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a3~portbdataout\ <= \inst3|memory_rtl_1|auto_generated|ram_block1a3_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_1|auto_generated|ram_block1a2_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(2);

\inst3|memory_rtl_1|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a2_PORTBADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a2~portbdataout\ <= \inst3|memory_rtl_1|auto_generated|ram_block1a2_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_1|auto_generated|ram_block1a1_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(1);

\inst3|memory_rtl_1|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a1_PORTBADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a1~portbdataout\ <= \inst3|memory_rtl_1|auto_generated|ram_block1a1_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_1|auto_generated|ram_block1a0_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(0);

\inst3|memory_rtl_1|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a0~portbdataout\ <= \inst3|memory_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_0|auto_generated|ram_block1a15_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(15);

\inst3|memory_rtl_0|auto_generated|ram_block1a15_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a15_PORTBADDR_bus\ <= (\inst|pc_counter\(4) & \inst|pc_counter\(3) & \inst|pc_counter\(2) & \inst|pc_counter\(1) & \inst|pc_counter\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a15~portbdataout\ <= \inst3|memory_rtl_0|auto_generated|ram_block1a15_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_0|auto_generated|ram_block1a14_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(14);

\inst3|memory_rtl_0|auto_generated|ram_block1a14_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a14_PORTBADDR_bus\ <= (\inst|pc_counter\(4) & \inst|pc_counter\(3) & \inst|pc_counter\(2) & \inst|pc_counter\(1) & \inst|pc_counter\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a14~portbdataout\ <= \inst3|memory_rtl_0|auto_generated|ram_block1a14_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_0|auto_generated|ram_block1a13_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(13);

\inst3|memory_rtl_0|auto_generated|ram_block1a13_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a13_PORTBADDR_bus\ <= (\inst|pc_counter\(4) & \inst|pc_counter\(3) & \inst|pc_counter\(2) & \inst|pc_counter\(1) & \inst|pc_counter\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a13~portbdataout\ <= \inst3|memory_rtl_0|auto_generated|ram_block1a13_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_0|auto_generated|ram_block1a12_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(12);

\inst3|memory_rtl_0|auto_generated|ram_block1a12_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a12_PORTBADDR_bus\ <= (\inst|pc_counter\(4) & \inst|pc_counter\(3) & \inst|pc_counter\(2) & \inst|pc_counter\(1) & \inst|pc_counter\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a12~portbdataout\ <= \inst3|memory_rtl_0|auto_generated|ram_block1a12_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_0|auto_generated|ram_block1a11_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(11);

\inst3|memory_rtl_0|auto_generated|ram_block1a11_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a11_PORTBADDR_bus\ <= (\inst|pc_counter\(4) & \inst|pc_counter\(3) & \inst|pc_counter\(2) & \inst|pc_counter\(1) & \inst|pc_counter\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a11~portbdataout\ <= \inst3|memory_rtl_0|auto_generated|ram_block1a11_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_0|auto_generated|ram_block1a10_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(10);

\inst3|memory_rtl_0|auto_generated|ram_block1a10_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a10_PORTBADDR_bus\ <= (\inst|pc_counter\(4) & \inst|pc_counter\(3) & \inst|pc_counter\(2) & \inst|pc_counter\(1) & \inst|pc_counter\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a10~portbdataout\ <= \inst3|memory_rtl_0|auto_generated|ram_block1a10_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(9);

\inst3|memory_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a9_PORTBADDR_bus\ <= (\inst|pc_counter\(4) & \inst|pc_counter\(3) & \inst|pc_counter\(2) & \inst|pc_counter\(1) & \inst|pc_counter\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a9~portbdataout\ <= \inst3|memory_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_0|auto_generated|ram_block1a8_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(8);

\inst3|memory_rtl_0|auto_generated|ram_block1a8_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a8_PORTBADDR_bus\ <= (\inst|pc_counter\(4) & \inst|pc_counter\(3) & \inst|pc_counter\(2) & \inst|pc_counter\(1) & \inst|pc_counter\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a8~portbdataout\ <= \inst3|memory_rtl_0|auto_generated|ram_block1a8_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(7);

\inst3|memory_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a7_PORTBADDR_bus\ <= (\inst|pc_counter\(4) & \inst|pc_counter\(3) & \inst|pc_counter\(2) & \inst|pc_counter\(1) & \inst|pc_counter\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a7~portbdataout\ <= \inst3|memory_rtl_0|auto_generated|ram_block1a7_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(6);

\inst3|memory_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a6_PORTBADDR_bus\ <= (\inst|pc_counter\(4) & \inst|pc_counter\(3) & \inst|pc_counter\(2) & \inst|pc_counter\(1) & \inst|pc_counter\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a6~portbdataout\ <= \inst3|memory_rtl_0|auto_generated|ram_block1a6_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(5);

\inst3|memory_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a5_PORTBADDR_bus\ <= (\inst|pc_counter\(4) & \inst|pc_counter\(3) & \inst|pc_counter\(2) & \inst|pc_counter\(1) & \inst|pc_counter\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a5~portbdataout\ <= \inst3|memory_rtl_0|auto_generated|ram_block1a5_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(4);

\inst3|memory_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\ <= (\inst|pc_counter\(4) & \inst|pc_counter\(3) & \inst|pc_counter\(2) & \inst|pc_counter\(1) & \inst|pc_counter\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a4~portbdataout\ <= \inst3|memory_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(3);

\inst3|memory_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a3_PORTBADDR_bus\ <= (\inst|pc_counter\(4) & \inst|pc_counter\(3) & \inst|pc_counter\(2) & \inst|pc_counter\(1) & \inst|pc_counter\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a3~portbdataout\ <= \inst3|memory_rtl_0|auto_generated|ram_block1a3_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(2);

\inst3|memory_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a2_PORTBADDR_bus\ <= (\inst|pc_counter\(4) & \inst|pc_counter\(3) & \inst|pc_counter\(2) & \inst|pc_counter\(1) & \inst|pc_counter\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a2~portbdataout\ <= \inst3|memory_rtl_0|auto_generated|ram_block1a2_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(1);

\inst3|memory_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a1_PORTBADDR_bus\ <= (\inst|pc_counter\(4) & \inst|pc_counter\(3) & \inst|pc_counter\(2) & \inst|pc_counter\(1) & \inst|pc_counter\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a1~portbdataout\ <= \inst3|memory_rtl_0|auto_generated|ram_block1a1_PORTBDATAOUT_bus\(0);

\inst3|memory_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\(0) <= \inst2|temp_op1_out\(0);

\inst3|memory_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\inst4|temp_op2_out\(4) & \inst4|temp_op2_out\(3) & \inst4|temp_op2_out\(2) & \inst4|temp_op2_out\(1) & \inst4|temp_op2_out\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\inst|pc_counter\(4) & \inst|pc_counter\(3) & \inst|pc_counter\(2) & \inst|pc_counter\(1) & \inst|pc_counter\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \inst3|memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_clock~input_o\ <= NOT \clock~input_o\;
\inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a0~portbdataout\ <= NOT \inst3|memory_rtl_1|auto_generated|ram_block1a0~portbdataout\;
\inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a1~portbdataout\ <= NOT \inst3|memory_rtl_1|auto_generated|ram_block1a1~portbdataout\;
\inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a2~portbdataout\ <= NOT \inst3|memory_rtl_1|auto_generated|ram_block1a2~portbdataout\;
\inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a3~portbdataout\ <= NOT \inst3|memory_rtl_1|auto_generated|ram_block1a3~portbdataout\;
\inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a4~portbdataout\ <= NOT \inst3|memory_rtl_1|auto_generated|ram_block1a4~portbdataout\;
\inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a5~portbdataout\ <= NOT \inst3|memory_rtl_1|auto_generated|ram_block1a5~portbdataout\;
\inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a6~portbdataout\ <= NOT \inst3|memory_rtl_1|auto_generated|ram_block1a6~portbdataout\;
\inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a7~portbdataout\ <= NOT \inst3|memory_rtl_1|auto_generated|ram_block1a7~portbdataout\;
\inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a8~portbdataout\ <= NOT \inst3|memory_rtl_1|auto_generated|ram_block1a8~portbdataout\;
\inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a9~portbdataout\ <= NOT \inst3|memory_rtl_1|auto_generated|ram_block1a9~portbdataout\;
\inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a10~portbdataout\ <= NOT \inst3|memory_rtl_1|auto_generated|ram_block1a10~portbdataout\;
\inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a11~portbdataout\ <= NOT \inst3|memory_rtl_1|auto_generated|ram_block1a11~portbdataout\;
\inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a12~portbdataout\ <= NOT \inst3|memory_rtl_1|auto_generated|ram_block1a12~portbdataout\;
\inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a13~portbdataout\ <= NOT \inst3|memory_rtl_1|auto_generated|ram_block1a13~portbdataout\;
\inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a14~portbdataout\ <= NOT \inst3|memory_rtl_1|auto_generated|ram_block1a14~portbdataout\;
\inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a15~portbdataout\ <= NOT \inst3|memory_rtl_1|auto_generated|ram_block1a15~portbdataout\;
\inst15|ALT_INV_z_flag~q\ <= NOT \inst15|z_flag~q\;
\inst5|ALT_INV_Selector1~0_combout\ <= NOT \inst5|Selector1~0_combout\;
\inst5|ALT_INV_state.T1~q\ <= NOT \inst5|state.T1~q\;
\inst5|ALT_INV_state.T1_1~q\ <= NOT \inst5|state.T1_1~q\;
\inst6|ALT_INV_temp_AM\(0) <= NOT \inst6|temp_AM\(0);
\inst6|ALT_INV_temp_AM\(1) <= NOT \inst6|temp_AM\(1);
\inst5|ALT_INV_Op1_mux_select[0]~3_combout\ <= NOT \inst5|Op1_mux_select[0]~3_combout\;
\inst5|ALT_INV_Op2_mux_select[0]~2_combout\ <= NOT \inst5|Op2_mux_select[0]~2_combout\;
\inst15|ALT_INV_Add0~61_sumout\ <= NOT \inst15|Add0~61_sumout\;
\inst15|ALT_INV_Add0~57_sumout\ <= NOT \inst15|Add0~57_sumout\;
\inst15|ALT_INV_Add0~53_sumout\ <= NOT \inst15|Add0~53_sumout\;
\inst15|ALT_INV_Add0~49_sumout\ <= NOT \inst15|Add0~49_sumout\;
\inst15|ALT_INV_Add0~45_sumout\ <= NOT \inst15|Add0~45_sumout\;
\inst15|ALT_INV_Add0~41_sumout\ <= NOT \inst15|Add0~41_sumout\;
\inst15|ALT_INV_Add0~37_sumout\ <= NOT \inst15|Add0~37_sumout\;
\inst15|ALT_INV_Add0~33_sumout\ <= NOT \inst15|Add0~33_sumout\;
\inst15|ALT_INV_Add0~29_sumout\ <= NOT \inst15|Add0~29_sumout\;
\inst15|ALT_INV_Add0~25_sumout\ <= NOT \inst15|Add0~25_sumout\;
\inst15|ALT_INV_Add0~21_sumout\ <= NOT \inst15|Add0~21_sumout\;
\inst15|ALT_INV_Add0~17_sumout\ <= NOT \inst15|Add0~17_sumout\;
\inst15|ALT_INV_Add0~13_sumout\ <= NOT \inst15|Add0~13_sumout\;
\inst15|ALT_INV_Add0~9_sumout\ <= NOT \inst15|Add0~9_sumout\;
\inst15|ALT_INV_Add0~5_sumout\ <= NOT \inst15|Add0~5_sumout\;
\inst15|ALT_INV_Add0~1_sumout\ <= NOT \inst15|Add0~1_sumout\;
\inst|ALT_INV_pc_counter\(0) <= NOT \inst|pc_counter\(0);
\inst|ALT_INV_pc_counter\(1) <= NOT \inst|pc_counter\(1);
\inst|ALT_INV_pc_counter\(2) <= NOT \inst|pc_counter\(2);
\inst|ALT_INV_pc_counter\(3) <= NOT \inst|pc_counter\(3);
\inst|ALT_INV_pc_counter\(4) <= NOT \inst|pc_counter\(4);
\inst|ALT_INV_pc_counter\(5) <= NOT \inst|pc_counter\(5);
\inst|ALT_INV_pc_counter\(6) <= NOT \inst|pc_counter\(6);
\inst|ALT_INV_pc_counter\(7) <= NOT \inst|pc_counter\(7);
\inst|ALT_INV_pc_counter\(8) <= NOT \inst|pc_counter\(8);
\inst|ALT_INV_pc_counter\(9) <= NOT \inst|pc_counter\(9);
\inst|ALT_INV_pc_counter\(10) <= NOT \inst|pc_counter\(10);
\inst|ALT_INV_pc_counter\(11) <= NOT \inst|pc_counter\(11);
\inst|ALT_INV_pc_counter\(12) <= NOT \inst|pc_counter\(12);
\inst|ALT_INV_pc_counter\(13) <= NOT \inst|pc_counter\(13);
\inst|ALT_INV_pc_counter\(14) <= NOT \inst|pc_counter\(14);
\inst|ALT_INV_pc_counter\(15) <= NOT \inst|pc_counter\(15);
\inst5|ALT_INV_Mux17~0_combout\ <= NOT \inst5|Mux17~0_combout\;
\inst5|ALT_INV_rf_input_sel[2]~0_combout\ <= NOT \inst5|rf_input_sel[2]~0_combout\;
\inst5|ALT_INV_Mux16~3_combout\ <= NOT \inst5|Mux16~3_combout\;
\inst5|ALT_INV_Mux16~2_combout\ <= NOT \inst5|Mux16~2_combout\;
\inst5|ALT_INV_ld_r~1_combout\ <= NOT \inst5|ld_r~1_combout\;
\inst5|ALT_INV_ld_r~0_combout\ <= NOT \inst5|ld_r~0_combout\;
\inst5|ALT_INV_Mux15~0_combout\ <= NOT \inst5|Mux15~0_combout\;
\inst5|ALT_INV_Mux16~1_combout\ <= NOT \inst5|Mux16~1_combout\;
\inst5|ALT_INV_sop_wr~0_combout\ <= NOT \inst5|sop_wr~0_combout\;
\inst5|ALT_INV_present_wr~1_combout\ <= NOT \inst5|present_wr~1_combout\;
\inst5|ALT_INV_present_wr~0_combout\ <= NOT \inst5|present_wr~0_combout\;
\inst5|ALT_INV_Selector0~0_combout\ <= NOT \inst5|Selector0~0_combout\;
\inst5|ALT_INV_state.T4~q\ <= NOT \inst5|state.T4~q\;
\inst5|ALT_INV_Mux1~10_combout\ <= NOT \inst5|Mux1~10_combout\;
\inst5|ALT_INV_Mux1~9_combout\ <= NOT \inst5|Mux1~9_combout\;
\inst5|ALT_INV_Mux1~8_combout\ <= NOT \inst5|Mux1~8_combout\;
\inst5|ALT_INV_Op2_mux_select[1]~1_combout\ <= NOT \inst5|Op2_mux_select[1]~1_combout\;
\inst5|ALT_INV_Op2_mux_select[1]~0_combout\ <= NOT \inst5|Op2_mux_select[1]~0_combout\;
\inst5|ALT_INV_Mux1~7_combout\ <= NOT \inst5|Mux1~7_combout\;
\inst5|ALT_INV_Mux1~6_combout\ <= NOT \inst5|Mux1~6_combout\;
\inst5|ALT_INV_Mux1~5_combout\ <= NOT \inst5|Mux1~5_combout\;
\inst4|ALT_INV_temp_op2_out\(0) <= NOT \inst4|temp_op2_out\(0);
\inst4|ALT_INV_temp_op2_out\(1) <= NOT \inst4|temp_op2_out\(1);
\inst4|ALT_INV_temp_op2_out\(2) <= NOT \inst4|temp_op2_out\(2);
\inst4|ALT_INV_temp_op2_out\(3) <= NOT \inst4|temp_op2_out\(3);
\inst4|ALT_INV_temp_op2_out\(4) <= NOT \inst4|temp_op2_out\(4);
\inst4|ALT_INV_temp_op2_out\(5) <= NOT \inst4|temp_op2_out\(5);
\inst4|ALT_INV_temp_op2_out\(6) <= NOT \inst4|temp_op2_out\(6);
\inst4|ALT_INV_temp_op2_out\(7) <= NOT \inst4|temp_op2_out\(7);
\inst4|ALT_INV_temp_op2_out\(8) <= NOT \inst4|temp_op2_out\(8);
\inst4|ALT_INV_temp_op2_out\(9) <= NOT \inst4|temp_op2_out\(9);
\inst4|ALT_INV_temp_op2_out\(10) <= NOT \inst4|temp_op2_out\(10);
\inst4|ALT_INV_temp_op2_out\(11) <= NOT \inst4|temp_op2_out\(11);
\inst4|ALT_INV_temp_op2_out\(12) <= NOT \inst4|temp_op2_out\(12);
\inst4|ALT_INV_temp_op2_out\(13) <= NOT \inst4|temp_op2_out\(13);
\inst4|ALT_INV_temp_op2_out\(14) <= NOT \inst4|temp_op2_out\(14);
\inst4|ALT_INV_temp_op2_out\(15) <= NOT \inst4|temp_op2_out\(15);
\inst5|ALT_INV_wr_en~0_combout\ <= NOT \inst5|wr_en~0_combout\;
\inst5|ALT_INV_Mux1~4_combout\ <= NOT \inst5|Mux1~4_combout\;
\inst6|ALT_INV_temp_op\(0) <= NOT \inst6|temp_op\(0);
\inst6|ALT_INV_temp_op\(1) <= NOT \inst6|temp_op\(1);
\inst6|ALT_INV_temp_op\(2) <= NOT \inst6|temp_op\(2);
\inst6|ALT_INV_temp_op\(3) <= NOT \inst6|temp_op\(3);
\inst6|ALT_INV_temp_op\(4) <= NOT \inst6|temp_op\(4);
\inst6|ALT_INV_temp_op\(5) <= NOT \inst6|temp_op\(5);
\inst6|ALT_INV_temp_op\(6) <= NOT \inst6|temp_op\(6);
\inst6|ALT_INV_temp_op\(7) <= NOT \inst6|temp_op\(7);
\inst6|ALT_INV_temp_op\(8) <= NOT \inst6|temp_op\(8);
\inst6|ALT_INV_temp_op\(9) <= NOT \inst6|temp_op\(9);
\inst6|ALT_INV_temp_op\(10) <= NOT \inst6|temp_op\(10);
\inst6|ALT_INV_temp_op\(11) <= NOT \inst6|temp_op\(11);
\inst6|ALT_INV_temp_op\(12) <= NOT \inst6|temp_op\(12);
\inst6|ALT_INV_temp_op\(13) <= NOT \inst6|temp_op\(13);
\inst6|ALT_INV_temp_op\(14) <= NOT \inst6|temp_op\(14);
\inst6|ALT_INV_temp_op\(15) <= NOT \inst6|temp_op\(15);
\inst5|ALT_INV_Op1_mux_select[1]~2_combout\ <= NOT \inst5|Op1_mux_select[1]~2_combout\;
\inst5|ALT_INV_Op1_mux_select[1]~1_combout\ <= NOT \inst5|Op1_mux_select[1]~1_combout\;
\inst5|ALT_INV_Mux1~3_combout\ <= NOT \inst5|Mux1~3_combout\;
\inst5|ALT_INV_Op1_mux_select[1]~0_combout\ <= NOT \inst5|Op1_mux_select[1]~0_combout\;
\inst5|ALT_INV_Mux1~2_combout\ <= NOT \inst5|Mux1~2_combout\;
\inst5|ALT_INV_Op1_write~0_combout\ <= NOT \inst5|Op1_write~0_combout\;
\inst5|ALT_INV_Mux1~1_combout\ <= NOT \inst5|Mux1~1_combout\;
\inst5|ALT_INV_Mux1~0_combout\ <= NOT \inst5|Mux1~0_combout\;
\inst5|ALT_INV_state.T2~q\ <= NOT \inst5|state.T2~q\;
\inst2|ALT_INV_temp_op1_out\(0) <= NOT \inst2|temp_op1_out\(0);
\inst2|ALT_INV_temp_op1_out\(1) <= NOT \inst2|temp_op1_out\(1);
\inst2|ALT_INV_temp_op1_out\(2) <= NOT \inst2|temp_op1_out\(2);
\inst2|ALT_INV_temp_op1_out\(3) <= NOT \inst2|temp_op1_out\(3);
\inst2|ALT_INV_temp_op1_out\(4) <= NOT \inst2|temp_op1_out\(4);
\inst2|ALT_INV_temp_op1_out\(5) <= NOT \inst2|temp_op1_out\(5);
\inst2|ALT_INV_temp_op1_out\(6) <= NOT \inst2|temp_op1_out\(6);
\inst2|ALT_INV_temp_op1_out\(7) <= NOT \inst2|temp_op1_out\(7);
\inst2|ALT_INV_temp_op1_out\(8) <= NOT \inst2|temp_op1_out\(8);
\inst2|ALT_INV_temp_op1_out\(9) <= NOT \inst2|temp_op1_out\(9);
\inst2|ALT_INV_temp_op1_out\(10) <= NOT \inst2|temp_op1_out\(10);
\inst2|ALT_INV_temp_op1_out\(11) <= NOT \inst2|temp_op1_out\(11);
\inst2|ALT_INV_temp_op1_out\(12) <= NOT \inst2|temp_op1_out\(12);
\inst2|ALT_INV_temp_op1_out\(13) <= NOT \inst2|temp_op1_out\(13);
\inst2|ALT_INV_temp_op1_out\(14) <= NOT \inst2|temp_op1_out\(14);
\inst2|ALT_INV_temp_op1_out\(15) <= NOT \inst2|temp_op1_out\(15);
\inst5|ALT_INV_Mux14~0_combout\ <= NOT \inst5|Mux14~0_combout\;
\inst5|ALT_INV_Selector2~0_combout\ <= NOT \inst5|Selector2~0_combout\;
\inst5|ALT_INV_state.init~q\ <= NOT \inst5|state.init~q\;
\inst5|ALT_INV_Mux12~0_combout\ <= NOT \inst5|Mux12~0_combout\;
\inst5|ALT_INV_dpcr_lsb_sel~0_combout\ <= NOT \inst5|dpcr_lsb_sel~0_combout\;
\inst5|ALT_INV_clr_z_flag~0_combout\ <= NOT \inst5|clr_z_flag~0_combout\;
\inst5|ALT_INV_Mux16~0_combout\ <= NOT \inst5|Mux16~0_combout\;
\inst5|ALT_INV_Mux13~0_combout\ <= NOT \inst5|Mux13~0_combout\;
\inst6|ALT_INV_temp_opcode\(0) <= NOT \inst6|temp_opcode\(0);
\inst6|ALT_INV_temp_opcode\(1) <= NOT \inst6|temp_opcode\(1);
\inst6|ALT_INV_temp_opcode\(5) <= NOT \inst6|temp_opcode\(5);
\inst6|ALT_INV_temp_opcode\(2) <= NOT \inst6|temp_opcode\(2);
\inst6|ALT_INV_temp_opcode\(3) <= NOT \inst6|temp_opcode\(3);
\inst5|ALT_INV_state.T3~q\ <= NOT \inst5|state.T3~q\;
\inst6|ALT_INV_temp_opcode\(4) <= NOT \inst6|temp_opcode\(4);
\inst1|ALT_INV_regs[10][10]~q\ <= NOT \inst1|regs[10][10]~q\;
\inst1|ALT_INV_regs[6][10]~q\ <= NOT \inst1|regs[6][10]~q\;
\inst1|ALT_INV_regs[2][10]~q\ <= NOT \inst1|regs[2][10]~q\;
\inst1|ALT_INV_Mux21~1_combout\ <= NOT \inst1|Mux21~1_combout\;
\inst1|ALT_INV_regs[13][10]~q\ <= NOT \inst1|regs[13][10]~q\;
\inst1|ALT_INV_regs[9][10]~q\ <= NOT \inst1|regs[9][10]~q\;
\inst1|ALT_INV_regs[5][10]~q\ <= NOT \inst1|regs[5][10]~q\;
\inst1|ALT_INV_regs[1][10]~q\ <= NOT \inst1|regs[1][10]~q\;
\inst1|ALT_INV_Mux21~0_combout\ <= NOT \inst1|Mux21~0_combout\;
\inst1|ALT_INV_regs[12][10]~q\ <= NOT \inst1|regs[12][10]~q\;
\inst1|ALT_INV_regs[8][10]~q\ <= NOT \inst1|regs[8][10]~q\;
\inst1|ALT_INV_regs[4][10]~q\ <= NOT \inst1|regs[4][10]~q\;
\inst1|ALT_INV_regs[0][10]~q\ <= NOT \inst1|regs[0][10]~q\;
\inst1|ALT_INV_Mux20~4_combout\ <= NOT \inst1|Mux20~4_combout\;
\inst1|ALT_INV_Mux20~3_combout\ <= NOT \inst1|Mux20~3_combout\;
\inst1|ALT_INV_regs[15][11]~q\ <= NOT \inst1|regs[15][11]~q\;
\inst1|ALT_INV_regs[14][11]~q\ <= NOT \inst1|regs[14][11]~q\;
\inst1|ALT_INV_regs[13][11]~q\ <= NOT \inst1|regs[13][11]~q\;
\inst1|ALT_INV_regs[12][11]~q\ <= NOT \inst1|regs[12][11]~q\;
\inst1|ALT_INV_Mux20~2_combout\ <= NOT \inst1|Mux20~2_combout\;
\inst1|ALT_INV_regs[11][11]~q\ <= NOT \inst1|regs[11][11]~q\;
\inst1|ALT_INV_regs[10][11]~q\ <= NOT \inst1|regs[10][11]~q\;
\inst1|ALT_INV_regs[9][11]~q\ <= NOT \inst1|regs[9][11]~q\;
\inst1|ALT_INV_regs[8][11]~q\ <= NOT \inst1|regs[8][11]~q\;
\inst1|ALT_INV_Mux20~1_combout\ <= NOT \inst1|Mux20~1_combout\;
\inst1|ALT_INV_regs[7][11]~q\ <= NOT \inst1|regs[7][11]~q\;
\inst1|ALT_INV_regs[6][11]~q\ <= NOT \inst1|regs[6][11]~q\;
\inst1|ALT_INV_regs[5][11]~q\ <= NOT \inst1|regs[5][11]~q\;
\inst1|ALT_INV_regs[4][11]~q\ <= NOT \inst1|regs[4][11]~q\;
\inst1|ALT_INV_Mux20~0_combout\ <= NOT \inst1|Mux20~0_combout\;
\inst1|ALT_INV_regs[3][11]~q\ <= NOT \inst1|regs[3][11]~q\;
\inst1|ALT_INV_regs[2][11]~q\ <= NOT \inst1|regs[2][11]~q\;
\inst1|ALT_INV_regs[1][11]~q\ <= NOT \inst1|regs[1][11]~q\;
\inst1|ALT_INV_regs[0][11]~q\ <= NOT \inst1|regs[0][11]~q\;
\inst1|ALT_INV_Mux19~4_combout\ <= NOT \inst1|Mux19~4_combout\;
\inst1|ALT_INV_Mux19~3_combout\ <= NOT \inst1|Mux19~3_combout\;
\inst1|ALT_INV_regs[15][12]~q\ <= NOT \inst1|regs[15][12]~q\;
\inst1|ALT_INV_regs[11][12]~q\ <= NOT \inst1|regs[11][12]~q\;
\inst1|ALT_INV_regs[7][12]~q\ <= NOT \inst1|regs[7][12]~q\;
\inst1|ALT_INV_regs[3][12]~q\ <= NOT \inst1|regs[3][12]~q\;
\inst1|ALT_INV_Mux19~2_combout\ <= NOT \inst1|Mux19~2_combout\;
\inst1|ALT_INV_regs[14][12]~q\ <= NOT \inst1|regs[14][12]~q\;
\inst1|ALT_INV_regs[10][12]~q\ <= NOT \inst1|regs[10][12]~q\;
\inst1|ALT_INV_regs[6][12]~q\ <= NOT \inst1|regs[6][12]~q\;
\inst1|ALT_INV_regs[2][12]~q\ <= NOT \inst1|regs[2][12]~q\;
\inst1|ALT_INV_Mux19~1_combout\ <= NOT \inst1|Mux19~1_combout\;
\inst1|ALT_INV_regs[13][12]~q\ <= NOT \inst1|regs[13][12]~q\;
\inst1|ALT_INV_regs[9][12]~q\ <= NOT \inst1|regs[9][12]~q\;
\inst1|ALT_INV_regs[5][12]~q\ <= NOT \inst1|regs[5][12]~q\;
\inst1|ALT_INV_regs[1][12]~q\ <= NOT \inst1|regs[1][12]~q\;
\inst1|ALT_INV_Mux19~0_combout\ <= NOT \inst1|Mux19~0_combout\;
\inst1|ALT_INV_regs[12][12]~q\ <= NOT \inst1|regs[12][12]~q\;
\inst1|ALT_INV_regs[8][12]~q\ <= NOT \inst1|regs[8][12]~q\;
\inst1|ALT_INV_regs[4][12]~q\ <= NOT \inst1|regs[4][12]~q\;
\inst1|ALT_INV_regs[0][12]~q\ <= NOT \inst1|regs[0][12]~q\;
\inst1|ALT_INV_Mux18~4_combout\ <= NOT \inst1|Mux18~4_combout\;
\inst1|ALT_INV_Mux18~3_combout\ <= NOT \inst1|Mux18~3_combout\;
\inst1|ALT_INV_regs[15][13]~q\ <= NOT \inst1|regs[15][13]~q\;
\inst1|ALT_INV_regs[14][13]~q\ <= NOT \inst1|regs[14][13]~q\;
\inst1|ALT_INV_regs[13][13]~q\ <= NOT \inst1|regs[13][13]~q\;
\inst1|ALT_INV_regs[12][13]~q\ <= NOT \inst1|regs[12][13]~q\;
\inst1|ALT_INV_Mux18~2_combout\ <= NOT \inst1|Mux18~2_combout\;
\inst1|ALT_INV_regs[11][13]~q\ <= NOT \inst1|regs[11][13]~q\;
\inst1|ALT_INV_regs[10][13]~q\ <= NOT \inst1|regs[10][13]~q\;
\inst1|ALT_INV_regs[9][13]~q\ <= NOT \inst1|regs[9][13]~q\;
\inst1|ALT_INV_regs[8][13]~q\ <= NOT \inst1|regs[8][13]~q\;
\inst1|ALT_INV_Mux18~1_combout\ <= NOT \inst1|Mux18~1_combout\;
\inst1|ALT_INV_regs[7][13]~q\ <= NOT \inst1|regs[7][13]~q\;
\inst1|ALT_INV_regs[6][13]~q\ <= NOT \inst1|regs[6][13]~q\;
\inst1|ALT_INV_regs[5][13]~q\ <= NOT \inst1|regs[5][13]~q\;
\inst1|ALT_INV_regs[4][13]~q\ <= NOT \inst1|regs[4][13]~q\;
\inst1|ALT_INV_Mux18~0_combout\ <= NOT \inst1|Mux18~0_combout\;
\inst1|ALT_INV_regs[3][13]~q\ <= NOT \inst1|regs[3][13]~q\;
\inst1|ALT_INV_regs[2][13]~q\ <= NOT \inst1|regs[2][13]~q\;
\inst1|ALT_INV_regs[1][13]~q\ <= NOT \inst1|regs[1][13]~q\;
\inst1|ALT_INV_regs[0][13]~q\ <= NOT \inst1|regs[0][13]~q\;
\inst1|ALT_INV_Mux17~4_combout\ <= NOT \inst1|Mux17~4_combout\;
\inst1|ALT_INV_Mux17~3_combout\ <= NOT \inst1|Mux17~3_combout\;
\inst1|ALT_INV_regs[15][14]~q\ <= NOT \inst1|regs[15][14]~q\;
\inst1|ALT_INV_regs[11][14]~q\ <= NOT \inst1|regs[11][14]~q\;
\inst1|ALT_INV_regs[7][14]~q\ <= NOT \inst1|regs[7][14]~q\;
\inst1|ALT_INV_regs[3][14]~q\ <= NOT \inst1|regs[3][14]~q\;
\inst1|ALT_INV_Mux17~2_combout\ <= NOT \inst1|Mux17~2_combout\;
\inst1|ALT_INV_regs[14][14]~q\ <= NOT \inst1|regs[14][14]~q\;
\inst1|ALT_INV_regs[10][14]~q\ <= NOT \inst1|regs[10][14]~q\;
\inst1|ALT_INV_regs[6][14]~q\ <= NOT \inst1|regs[6][14]~q\;
\inst1|ALT_INV_regs[2][14]~q\ <= NOT \inst1|regs[2][14]~q\;
\inst1|ALT_INV_Mux17~1_combout\ <= NOT \inst1|Mux17~1_combout\;
\inst1|ALT_INV_regs[13][14]~q\ <= NOT \inst1|regs[13][14]~q\;
\inst1|ALT_INV_regs[9][14]~q\ <= NOT \inst1|regs[9][14]~q\;
\inst1|ALT_INV_regs[5][14]~q\ <= NOT \inst1|regs[5][14]~q\;
\inst1|ALT_INV_regs[1][14]~q\ <= NOT \inst1|regs[1][14]~q\;
\inst1|ALT_INV_Mux17~0_combout\ <= NOT \inst1|Mux17~0_combout\;
\inst1|ALT_INV_regs[12][14]~q\ <= NOT \inst1|regs[12][14]~q\;
\inst1|ALT_INV_regs[8][14]~q\ <= NOT \inst1|regs[8][14]~q\;
\inst1|ALT_INV_regs[4][14]~q\ <= NOT \inst1|regs[4][14]~q\;
\inst1|ALT_INV_regs[0][14]~q\ <= NOT \inst1|regs[0][14]~q\;
\inst1|ALT_INV_Mux16~4_combout\ <= NOT \inst1|Mux16~4_combout\;
\inst6|ALT_INV_temp_rx\(3) <= NOT \inst6|temp_rx\(3);
\inst6|ALT_INV_temp_rx\(2) <= NOT \inst6|temp_rx\(2);
\inst1|ALT_INV_Mux16~3_combout\ <= NOT \inst1|Mux16~3_combout\;
\inst1|ALT_INV_regs[15][15]~q\ <= NOT \inst1|regs[15][15]~q\;
\inst1|ALT_INV_regs[14][15]~q\ <= NOT \inst1|regs[14][15]~q\;
\inst1|ALT_INV_regs[13][15]~q\ <= NOT \inst1|regs[13][15]~q\;
\inst1|ALT_INV_regs[12][15]~q\ <= NOT \inst1|regs[12][15]~q\;
\inst1|ALT_INV_Mux16~2_combout\ <= NOT \inst1|Mux16~2_combout\;
\inst1|ALT_INV_regs[11][15]~q\ <= NOT \inst1|regs[11][15]~q\;
\inst1|ALT_INV_regs[10][15]~q\ <= NOT \inst1|regs[10][15]~q\;
\inst1|ALT_INV_regs[9][15]~q\ <= NOT \inst1|regs[9][15]~q\;
\inst1|ALT_INV_regs[8][15]~q\ <= NOT \inst1|regs[8][15]~q\;
\inst1|ALT_INV_Mux16~1_combout\ <= NOT \inst1|Mux16~1_combout\;
\inst1|ALT_INV_regs[7][15]~q\ <= NOT \inst1|regs[7][15]~q\;
\inst1|ALT_INV_regs[6][15]~q\ <= NOT \inst1|regs[6][15]~q\;
\inst1|ALT_INV_regs[5][15]~q\ <= NOT \inst1|regs[5][15]~q\;
\inst1|ALT_INV_regs[4][15]~q\ <= NOT \inst1|regs[4][15]~q\;
\inst1|ALT_INV_Mux16~0_combout\ <= NOT \inst1|Mux16~0_combout\;
\inst6|ALT_INV_temp_rx\(1) <= NOT \inst6|temp_rx\(1);
\inst6|ALT_INV_temp_rx\(0) <= NOT \inst6|temp_rx\(0);
\inst1|ALT_INV_regs[3][15]~q\ <= NOT \inst1|regs[3][15]~q\;
\inst1|ALT_INV_regs[2][15]~q\ <= NOT \inst1|regs[2][15]~q\;
\inst1|ALT_INV_regs[1][15]~q\ <= NOT \inst1|regs[1][15]~q\;
\inst1|ALT_INV_regs[0][15]~q\ <= NOT \inst1|regs[0][15]~q\;
\inst5|ALT_INV_rf_input_sel[0]~2_combout\ <= NOT \inst5|rf_input_sel[0]~2_combout\;
\inst5|ALT_INV_Mux18~0_combout\ <= NOT \inst5|Mux18~0_combout\;
\inst5|ALT_INV_Mux17~1_combout\ <= NOT \inst5|Mux17~1_combout\;
\inst1|ALT_INV_regs[14][4]~q\ <= NOT \inst1|regs[14][4]~q\;
\inst1|ALT_INV_regs[10][4]~q\ <= NOT \inst1|regs[10][4]~q\;
\inst1|ALT_INV_regs[6][4]~q\ <= NOT \inst1|regs[6][4]~q\;
\inst1|ALT_INV_regs[2][4]~q\ <= NOT \inst1|regs[2][4]~q\;
\inst1|ALT_INV_Mux27~1_combout\ <= NOT \inst1|Mux27~1_combout\;
\inst1|ALT_INV_regs[13][4]~q\ <= NOT \inst1|regs[13][4]~q\;
\inst1|ALT_INV_regs[9][4]~q\ <= NOT \inst1|regs[9][4]~q\;
\inst1|ALT_INV_regs[5][4]~q\ <= NOT \inst1|regs[5][4]~q\;
\inst1|ALT_INV_regs[1][4]~q\ <= NOT \inst1|regs[1][4]~q\;
\inst1|ALT_INV_Mux27~0_combout\ <= NOT \inst1|Mux27~0_combout\;
\inst1|ALT_INV_regs[12][4]~q\ <= NOT \inst1|regs[12][4]~q\;
\inst1|ALT_INV_regs[8][4]~q\ <= NOT \inst1|regs[8][4]~q\;
\inst1|ALT_INV_regs[4][4]~q\ <= NOT \inst1|regs[4][4]~q\;
\inst1|ALT_INV_regs[0][4]~q\ <= NOT \inst1|regs[0][4]~q\;
\inst1|ALT_INV_Mux26~4_combout\ <= NOT \inst1|Mux26~4_combout\;
\inst1|ALT_INV_Mux26~3_combout\ <= NOT \inst1|Mux26~3_combout\;
\inst1|ALT_INV_regs[15][5]~q\ <= NOT \inst1|regs[15][5]~q\;
\inst1|ALT_INV_regs[14][5]~q\ <= NOT \inst1|regs[14][5]~q\;
\inst1|ALT_INV_regs[13][5]~q\ <= NOT \inst1|regs[13][5]~q\;
\inst1|ALT_INV_regs[12][5]~q\ <= NOT \inst1|regs[12][5]~q\;
\inst1|ALT_INV_Mux26~2_combout\ <= NOT \inst1|Mux26~2_combout\;
\inst1|ALT_INV_regs[11][5]~q\ <= NOT \inst1|regs[11][5]~q\;
\inst1|ALT_INV_regs[10][5]~q\ <= NOT \inst1|regs[10][5]~q\;
\inst1|ALT_INV_regs[9][5]~q\ <= NOT \inst1|regs[9][5]~q\;
\inst1|ALT_INV_regs[8][5]~q\ <= NOT \inst1|regs[8][5]~q\;
\inst1|ALT_INV_Mux26~1_combout\ <= NOT \inst1|Mux26~1_combout\;
\inst1|ALT_INV_regs[7][5]~q\ <= NOT \inst1|regs[7][5]~q\;
\inst1|ALT_INV_regs[6][5]~q\ <= NOT \inst1|regs[6][5]~q\;
\inst1|ALT_INV_regs[5][5]~q\ <= NOT \inst1|regs[5][5]~q\;
\inst1|ALT_INV_regs[4][5]~q\ <= NOT \inst1|regs[4][5]~q\;
\inst1|ALT_INV_Mux26~0_combout\ <= NOT \inst1|Mux26~0_combout\;
\inst1|ALT_INV_regs[3][5]~q\ <= NOT \inst1|regs[3][5]~q\;
\inst1|ALT_INV_regs[2][5]~q\ <= NOT \inst1|regs[2][5]~q\;
\inst1|ALT_INV_regs[1][5]~q\ <= NOT \inst1|regs[1][5]~q\;
\inst1|ALT_INV_regs[0][5]~q\ <= NOT \inst1|regs[0][5]~q\;
\inst1|ALT_INV_Mux25~4_combout\ <= NOT \inst1|Mux25~4_combout\;
\inst1|ALT_INV_Mux25~3_combout\ <= NOT \inst1|Mux25~3_combout\;
\inst1|ALT_INV_regs[15][6]~q\ <= NOT \inst1|regs[15][6]~q\;
\inst1|ALT_INV_regs[11][6]~q\ <= NOT \inst1|regs[11][6]~q\;
\inst1|ALT_INV_regs[7][6]~q\ <= NOT \inst1|regs[7][6]~q\;
\inst1|ALT_INV_regs[3][6]~q\ <= NOT \inst1|regs[3][6]~q\;
\inst1|ALT_INV_Mux25~2_combout\ <= NOT \inst1|Mux25~2_combout\;
\inst1|ALT_INV_regs[14][6]~q\ <= NOT \inst1|regs[14][6]~q\;
\inst1|ALT_INV_regs[10][6]~q\ <= NOT \inst1|regs[10][6]~q\;
\inst1|ALT_INV_regs[6][6]~q\ <= NOT \inst1|regs[6][6]~q\;
\inst1|ALT_INV_regs[2][6]~q\ <= NOT \inst1|regs[2][6]~q\;
\inst1|ALT_INV_Mux25~1_combout\ <= NOT \inst1|Mux25~1_combout\;
\inst1|ALT_INV_regs[13][6]~q\ <= NOT \inst1|regs[13][6]~q\;
\inst1|ALT_INV_regs[9][6]~q\ <= NOT \inst1|regs[9][6]~q\;
\inst1|ALT_INV_regs[5][6]~q\ <= NOT \inst1|regs[5][6]~q\;
\inst1|ALT_INV_regs[1][6]~q\ <= NOT \inst1|regs[1][6]~q\;
\inst1|ALT_INV_Mux25~0_combout\ <= NOT \inst1|Mux25~0_combout\;
\inst1|ALT_INV_regs[12][6]~q\ <= NOT \inst1|regs[12][6]~q\;
\inst1|ALT_INV_regs[8][6]~q\ <= NOT \inst1|regs[8][6]~q\;
\inst1|ALT_INV_regs[4][6]~q\ <= NOT \inst1|regs[4][6]~q\;
\inst1|ALT_INV_regs[0][6]~q\ <= NOT \inst1|regs[0][6]~q\;
\inst1|ALT_INV_Mux24~4_combout\ <= NOT \inst1|Mux24~4_combout\;
\inst1|ALT_INV_Mux24~3_combout\ <= NOT \inst1|Mux24~3_combout\;
\inst1|ALT_INV_regs[15][7]~q\ <= NOT \inst1|regs[15][7]~q\;
\inst1|ALT_INV_regs[14][7]~q\ <= NOT \inst1|regs[14][7]~q\;
\inst1|ALT_INV_regs[13][7]~q\ <= NOT \inst1|regs[13][7]~q\;
\inst1|ALT_INV_regs[12][7]~q\ <= NOT \inst1|regs[12][7]~q\;
\inst1|ALT_INV_Mux24~2_combout\ <= NOT \inst1|Mux24~2_combout\;
\inst1|ALT_INV_regs[11][7]~q\ <= NOT \inst1|regs[11][7]~q\;
\inst1|ALT_INV_regs[10][7]~q\ <= NOT \inst1|regs[10][7]~q\;
\inst1|ALT_INV_regs[9][7]~q\ <= NOT \inst1|regs[9][7]~q\;
\inst1|ALT_INV_regs[8][7]~q\ <= NOT \inst1|regs[8][7]~q\;
\inst1|ALT_INV_Mux24~1_combout\ <= NOT \inst1|Mux24~1_combout\;
\inst1|ALT_INV_regs[7][7]~q\ <= NOT \inst1|regs[7][7]~q\;
\inst1|ALT_INV_regs[6][7]~q\ <= NOT \inst1|regs[6][7]~q\;
\inst1|ALT_INV_regs[5][7]~q\ <= NOT \inst1|regs[5][7]~q\;
\inst1|ALT_INV_regs[4][7]~q\ <= NOT \inst1|regs[4][7]~q\;
\inst1|ALT_INV_Mux24~0_combout\ <= NOT \inst1|Mux24~0_combout\;
\inst1|ALT_INV_regs[3][7]~q\ <= NOT \inst1|regs[3][7]~q\;
\inst1|ALT_INV_regs[2][7]~q\ <= NOT \inst1|regs[2][7]~q\;
\inst1|ALT_INV_regs[1][7]~q\ <= NOT \inst1|regs[1][7]~q\;
\inst1|ALT_INV_regs[0][7]~q\ <= NOT \inst1|regs[0][7]~q\;
\inst1|ALT_INV_Mux23~4_combout\ <= NOT \inst1|Mux23~4_combout\;
\inst1|ALT_INV_Mux23~3_combout\ <= NOT \inst1|Mux23~3_combout\;
\inst1|ALT_INV_regs[15][8]~q\ <= NOT \inst1|regs[15][8]~q\;
\inst1|ALT_INV_regs[11][8]~q\ <= NOT \inst1|regs[11][8]~q\;
\inst1|ALT_INV_regs[7][8]~q\ <= NOT \inst1|regs[7][8]~q\;
\inst1|ALT_INV_regs[3][8]~q\ <= NOT \inst1|regs[3][8]~q\;
\inst1|ALT_INV_Mux23~2_combout\ <= NOT \inst1|Mux23~2_combout\;
\inst1|ALT_INV_regs[14][8]~q\ <= NOT \inst1|regs[14][8]~q\;
\inst1|ALT_INV_regs[10][8]~q\ <= NOT \inst1|regs[10][8]~q\;
\inst1|ALT_INV_regs[6][8]~q\ <= NOT \inst1|regs[6][8]~q\;
\inst1|ALT_INV_regs[2][8]~q\ <= NOT \inst1|regs[2][8]~q\;
\inst1|ALT_INV_Mux23~1_combout\ <= NOT \inst1|Mux23~1_combout\;
\inst1|ALT_INV_regs[13][8]~q\ <= NOT \inst1|regs[13][8]~q\;
\inst1|ALT_INV_regs[9][8]~q\ <= NOT \inst1|regs[9][8]~q\;
\inst1|ALT_INV_regs[5][8]~q\ <= NOT \inst1|regs[5][8]~q\;
\inst1|ALT_INV_regs[1][8]~q\ <= NOT \inst1|regs[1][8]~q\;
\inst1|ALT_INV_Mux23~0_combout\ <= NOT \inst1|Mux23~0_combout\;
\inst1|ALT_INV_regs[12][8]~q\ <= NOT \inst1|regs[12][8]~q\;
\inst1|ALT_INV_regs[8][8]~q\ <= NOT \inst1|regs[8][8]~q\;
\inst1|ALT_INV_regs[4][8]~q\ <= NOT \inst1|regs[4][8]~q\;
\inst1|ALT_INV_regs[0][8]~q\ <= NOT \inst1|regs[0][8]~q\;
\inst1|ALT_INV_Mux22~4_combout\ <= NOT \inst1|Mux22~4_combout\;
\inst1|ALT_INV_Mux22~3_combout\ <= NOT \inst1|Mux22~3_combout\;
\inst1|ALT_INV_regs[15][9]~q\ <= NOT \inst1|regs[15][9]~q\;
\inst1|ALT_INV_regs[14][9]~q\ <= NOT \inst1|regs[14][9]~q\;
\inst1|ALT_INV_regs[13][9]~q\ <= NOT \inst1|regs[13][9]~q\;
\inst1|ALT_INV_regs[12][9]~q\ <= NOT \inst1|regs[12][9]~q\;
\inst1|ALT_INV_Mux22~2_combout\ <= NOT \inst1|Mux22~2_combout\;
\inst1|ALT_INV_regs[11][9]~q\ <= NOT \inst1|regs[11][9]~q\;
\inst1|ALT_INV_regs[10][9]~q\ <= NOT \inst1|regs[10][9]~q\;
\inst1|ALT_INV_regs[9][9]~q\ <= NOT \inst1|regs[9][9]~q\;
\inst1|ALT_INV_regs[8][9]~q\ <= NOT \inst1|regs[8][9]~q\;
\inst1|ALT_INV_Mux22~1_combout\ <= NOT \inst1|Mux22~1_combout\;
\inst1|ALT_INV_regs[7][9]~q\ <= NOT \inst1|regs[7][9]~q\;
\inst1|ALT_INV_regs[6][9]~q\ <= NOT \inst1|regs[6][9]~q\;
\inst1|ALT_INV_regs[5][9]~q\ <= NOT \inst1|regs[5][9]~q\;
\inst1|ALT_INV_regs[4][9]~q\ <= NOT \inst1|regs[4][9]~q\;
\inst1|ALT_INV_Mux22~0_combout\ <= NOT \inst1|Mux22~0_combout\;
\inst1|ALT_INV_regs[3][9]~q\ <= NOT \inst1|regs[3][9]~q\;
\inst1|ALT_INV_regs[2][9]~q\ <= NOT \inst1|regs[2][9]~q\;
\inst1|ALT_INV_regs[1][9]~q\ <= NOT \inst1|regs[1][9]~q\;
\inst1|ALT_INV_regs[0][9]~q\ <= NOT \inst1|regs[0][9]~q\;
\inst1|ALT_INV_Mux21~4_combout\ <= NOT \inst1|Mux21~4_combout\;
\inst1|ALT_INV_Mux21~3_combout\ <= NOT \inst1|Mux21~3_combout\;
\inst1|ALT_INV_regs[15][10]~q\ <= NOT \inst1|regs[15][10]~q\;
\inst1|ALT_INV_regs[11][10]~q\ <= NOT \inst1|regs[11][10]~q\;
\inst1|ALT_INV_regs[7][10]~q\ <= NOT \inst1|regs[7][10]~q\;
\inst1|ALT_INV_regs[3][10]~q\ <= NOT \inst1|regs[3][10]~q\;
\inst1|ALT_INV_Mux21~2_combout\ <= NOT \inst1|Mux21~2_combout\;
\inst1|ALT_INV_regs[14][10]~q\ <= NOT \inst1|regs[14][10]~q\;
\inst1|ALT_INV_Mux38~0_combout\ <= NOT \inst1|Mux38~0_combout\;
\inst1|ALT_INV_Mux37~4_combout\ <= NOT \inst1|Mux37~4_combout\;
\inst1|ALT_INV_Mux37~3_combout\ <= NOT \inst1|Mux37~3_combout\;
\inst1|ALT_INV_Mux37~2_combout\ <= NOT \inst1|Mux37~2_combout\;
\inst1|ALT_INV_Mux37~1_combout\ <= NOT \inst1|Mux37~1_combout\;
\inst1|ALT_INV_Mux37~0_combout\ <= NOT \inst1|Mux37~0_combout\;
\inst1|ALT_INV_Mux36~4_combout\ <= NOT \inst1|Mux36~4_combout\;
\inst1|ALT_INV_Mux36~3_combout\ <= NOT \inst1|Mux36~3_combout\;
\inst1|ALT_INV_Mux36~2_combout\ <= NOT \inst1|Mux36~2_combout\;
\inst1|ALT_INV_Mux36~1_combout\ <= NOT \inst1|Mux36~1_combout\;
\inst1|ALT_INV_Mux36~0_combout\ <= NOT \inst1|Mux36~0_combout\;
\inst1|ALT_INV_Mux35~4_combout\ <= NOT \inst1|Mux35~4_combout\;
\inst1|ALT_INV_Mux35~3_combout\ <= NOT \inst1|Mux35~3_combout\;
\inst1|ALT_INV_Mux35~2_combout\ <= NOT \inst1|Mux35~2_combout\;
\inst1|ALT_INV_Mux35~1_combout\ <= NOT \inst1|Mux35~1_combout\;
\inst1|ALT_INV_Mux35~0_combout\ <= NOT \inst1|Mux35~0_combout\;
\inst1|ALT_INV_Mux34~4_combout\ <= NOT \inst1|Mux34~4_combout\;
\inst1|ALT_INV_Mux34~3_combout\ <= NOT \inst1|Mux34~3_combout\;
\inst1|ALT_INV_Mux34~2_combout\ <= NOT \inst1|Mux34~2_combout\;
\inst1|ALT_INV_Mux34~1_combout\ <= NOT \inst1|Mux34~1_combout\;
\inst1|ALT_INV_Mux34~0_combout\ <= NOT \inst1|Mux34~0_combout\;
\inst1|ALT_INV_Mux33~4_combout\ <= NOT \inst1|Mux33~4_combout\;
\inst1|ALT_INV_Mux33~3_combout\ <= NOT \inst1|Mux33~3_combout\;
\inst1|ALT_INV_Mux33~2_combout\ <= NOT \inst1|Mux33~2_combout\;
\inst1|ALT_INV_Mux33~1_combout\ <= NOT \inst1|Mux33~1_combout\;
\inst1|ALT_INV_Mux33~0_combout\ <= NOT \inst1|Mux33~0_combout\;
\inst1|ALT_INV_Mux32~4_combout\ <= NOT \inst1|Mux32~4_combout\;
\inst6|ALT_INV_temp_rz\(3) <= NOT \inst6|temp_rz\(3);
\inst6|ALT_INV_temp_rz\(2) <= NOT \inst6|temp_rz\(2);
\inst1|ALT_INV_Mux32~3_combout\ <= NOT \inst1|Mux32~3_combout\;
\inst1|ALT_INV_Mux32~2_combout\ <= NOT \inst1|Mux32~2_combout\;
\inst1|ALT_INV_Mux32~1_combout\ <= NOT \inst1|Mux32~1_combout\;
\inst1|ALT_INV_Mux32~0_combout\ <= NOT \inst1|Mux32~0_combout\;
\inst6|ALT_INV_temp_rz\(1) <= NOT \inst6|temp_rz\(1);
\inst6|ALT_INV_temp_rz\(0) <= NOT \inst6|temp_rz\(0);
\inst1|ALT_INV_Mux31~4_combout\ <= NOT \inst1|Mux31~4_combout\;
\inst1|ALT_INV_Mux31~3_combout\ <= NOT \inst1|Mux31~3_combout\;
\inst1|ALT_INV_regs[15][0]~q\ <= NOT \inst1|regs[15][0]~q\;
\inst1|ALT_INV_regs[11][0]~q\ <= NOT \inst1|regs[11][0]~q\;
\inst1|ALT_INV_regs[7][0]~q\ <= NOT \inst1|regs[7][0]~q\;
\inst1|ALT_INV_regs[3][0]~q\ <= NOT \inst1|regs[3][0]~q\;
\inst1|ALT_INV_Mux31~2_combout\ <= NOT \inst1|Mux31~2_combout\;
\inst1|ALT_INV_regs[14][0]~q\ <= NOT \inst1|regs[14][0]~q\;
\inst1|ALT_INV_regs[10][0]~q\ <= NOT \inst1|regs[10][0]~q\;
\inst1|ALT_INV_regs[6][0]~q\ <= NOT \inst1|regs[6][0]~q\;
\inst1|ALT_INV_regs[2][0]~q\ <= NOT \inst1|regs[2][0]~q\;
\inst1|ALT_INV_Mux31~1_combout\ <= NOT \inst1|Mux31~1_combout\;
\inst1|ALT_INV_regs[13][0]~q\ <= NOT \inst1|regs[13][0]~q\;
\inst1|ALT_INV_regs[9][0]~q\ <= NOT \inst1|regs[9][0]~q\;
\inst1|ALT_INV_regs[5][0]~q\ <= NOT \inst1|regs[5][0]~q\;
\inst1|ALT_INV_regs[1][0]~q\ <= NOT \inst1|regs[1][0]~q\;
\inst1|ALT_INV_Mux31~0_combout\ <= NOT \inst1|Mux31~0_combout\;
\inst1|ALT_INV_regs[12][0]~q\ <= NOT \inst1|regs[12][0]~q\;
\inst1|ALT_INV_regs[8][0]~q\ <= NOT \inst1|regs[8][0]~q\;
\inst1|ALT_INV_regs[4][0]~q\ <= NOT \inst1|regs[4][0]~q\;
\inst1|ALT_INV_regs[0][0]~q\ <= NOT \inst1|regs[0][0]~q\;
\inst1|ALT_INV_Mux30~4_combout\ <= NOT \inst1|Mux30~4_combout\;
\inst1|ALT_INV_Mux30~3_combout\ <= NOT \inst1|Mux30~3_combout\;
\inst1|ALT_INV_regs[15][1]~q\ <= NOT \inst1|regs[15][1]~q\;
\inst1|ALT_INV_regs[14][1]~q\ <= NOT \inst1|regs[14][1]~q\;
\inst1|ALT_INV_regs[13][1]~q\ <= NOT \inst1|regs[13][1]~q\;
\inst1|ALT_INV_regs[12][1]~q\ <= NOT \inst1|regs[12][1]~q\;
\inst1|ALT_INV_Mux30~2_combout\ <= NOT \inst1|Mux30~2_combout\;
\inst1|ALT_INV_regs[11][1]~q\ <= NOT \inst1|regs[11][1]~q\;
\inst1|ALT_INV_regs[10][1]~q\ <= NOT \inst1|regs[10][1]~q\;
\inst1|ALT_INV_regs[9][1]~q\ <= NOT \inst1|regs[9][1]~q\;
\inst1|ALT_INV_regs[8][1]~q\ <= NOT \inst1|regs[8][1]~q\;
\inst1|ALT_INV_Mux30~1_combout\ <= NOT \inst1|Mux30~1_combout\;
\inst1|ALT_INV_regs[7][1]~q\ <= NOT \inst1|regs[7][1]~q\;
\inst1|ALT_INV_regs[6][1]~q\ <= NOT \inst1|regs[6][1]~q\;
\inst1|ALT_INV_regs[5][1]~q\ <= NOT \inst1|regs[5][1]~q\;
\inst1|ALT_INV_regs[4][1]~q\ <= NOT \inst1|regs[4][1]~q\;
\inst1|ALT_INV_Mux30~0_combout\ <= NOT \inst1|Mux30~0_combout\;
\inst1|ALT_INV_regs[3][1]~q\ <= NOT \inst1|regs[3][1]~q\;
\inst1|ALT_INV_regs[2][1]~q\ <= NOT \inst1|regs[2][1]~q\;
\inst1|ALT_INV_regs[1][1]~q\ <= NOT \inst1|regs[1][1]~q\;
\inst1|ALT_INV_regs[0][1]~q\ <= NOT \inst1|regs[0][1]~q\;
\inst1|ALT_INV_Mux29~4_combout\ <= NOT \inst1|Mux29~4_combout\;
\inst1|ALT_INV_Mux29~3_combout\ <= NOT \inst1|Mux29~3_combout\;
\inst1|ALT_INV_regs[15][2]~q\ <= NOT \inst1|regs[15][2]~q\;
\inst1|ALT_INV_regs[11][2]~q\ <= NOT \inst1|regs[11][2]~q\;
\inst1|ALT_INV_regs[7][2]~q\ <= NOT \inst1|regs[7][2]~q\;
\inst1|ALT_INV_regs[3][2]~q\ <= NOT \inst1|regs[3][2]~q\;
\inst1|ALT_INV_Mux29~2_combout\ <= NOT \inst1|Mux29~2_combout\;
\inst1|ALT_INV_regs[14][2]~q\ <= NOT \inst1|regs[14][2]~q\;
\inst1|ALT_INV_regs[10][2]~q\ <= NOT \inst1|regs[10][2]~q\;
\inst1|ALT_INV_regs[6][2]~q\ <= NOT \inst1|regs[6][2]~q\;
\inst1|ALT_INV_regs[2][2]~q\ <= NOT \inst1|regs[2][2]~q\;
\inst1|ALT_INV_Mux29~1_combout\ <= NOT \inst1|Mux29~1_combout\;
\inst1|ALT_INV_regs[13][2]~q\ <= NOT \inst1|regs[13][2]~q\;
\inst1|ALT_INV_regs[9][2]~q\ <= NOT \inst1|regs[9][2]~q\;
\inst1|ALT_INV_regs[5][2]~q\ <= NOT \inst1|regs[5][2]~q\;
\inst1|ALT_INV_regs[1][2]~q\ <= NOT \inst1|regs[1][2]~q\;
\inst1|ALT_INV_Mux29~0_combout\ <= NOT \inst1|Mux29~0_combout\;
\inst1|ALT_INV_regs[12][2]~q\ <= NOT \inst1|regs[12][2]~q\;
\inst1|ALT_INV_regs[8][2]~q\ <= NOT \inst1|regs[8][2]~q\;
\inst1|ALT_INV_regs[4][2]~q\ <= NOT \inst1|regs[4][2]~q\;
\inst1|ALT_INV_regs[0][2]~q\ <= NOT \inst1|regs[0][2]~q\;
\inst1|ALT_INV_Mux28~4_combout\ <= NOT \inst1|Mux28~4_combout\;
\inst1|ALT_INV_Mux28~3_combout\ <= NOT \inst1|Mux28~3_combout\;
\inst1|ALT_INV_regs[15][3]~q\ <= NOT \inst1|regs[15][3]~q\;
\inst1|ALT_INV_regs[14][3]~q\ <= NOT \inst1|regs[14][3]~q\;
\inst1|ALT_INV_regs[13][3]~q\ <= NOT \inst1|regs[13][3]~q\;
\inst1|ALT_INV_regs[12][3]~q\ <= NOT \inst1|regs[12][3]~q\;
\inst1|ALT_INV_Mux28~2_combout\ <= NOT \inst1|Mux28~2_combout\;
\inst1|ALT_INV_regs[11][3]~q\ <= NOT \inst1|regs[11][3]~q\;
\inst1|ALT_INV_regs[10][3]~q\ <= NOT \inst1|regs[10][3]~q\;
\inst1|ALT_INV_regs[9][3]~q\ <= NOT \inst1|regs[9][3]~q\;
\inst1|ALT_INV_regs[8][3]~q\ <= NOT \inst1|regs[8][3]~q\;
\inst1|ALT_INV_Mux28~1_combout\ <= NOT \inst1|Mux28~1_combout\;
\inst1|ALT_INV_regs[7][3]~q\ <= NOT \inst1|regs[7][3]~q\;
\inst1|ALT_INV_regs[6][3]~q\ <= NOT \inst1|regs[6][3]~q\;
\inst1|ALT_INV_regs[5][3]~q\ <= NOT \inst1|regs[5][3]~q\;
\inst1|ALT_INV_regs[4][3]~q\ <= NOT \inst1|regs[4][3]~q\;
\inst1|ALT_INV_Mux28~0_combout\ <= NOT \inst1|Mux28~0_combout\;
\inst1|ALT_INV_regs[3][3]~q\ <= NOT \inst1|regs[3][3]~q\;
\inst1|ALT_INV_regs[2][3]~q\ <= NOT \inst1|regs[2][3]~q\;
\inst1|ALT_INV_regs[1][3]~q\ <= NOT \inst1|regs[1][3]~q\;
\inst1|ALT_INV_regs[0][3]~q\ <= NOT \inst1|regs[0][3]~q\;
\inst1|ALT_INV_Mux27~4_combout\ <= NOT \inst1|Mux27~4_combout\;
\inst1|ALT_INV_Mux27~3_combout\ <= NOT \inst1|Mux27~3_combout\;
\inst1|ALT_INV_regs[15][4]~q\ <= NOT \inst1|regs[15][4]~q\;
\inst1|ALT_INV_regs[11][4]~q\ <= NOT \inst1|regs[11][4]~q\;
\inst1|ALT_INV_regs[7][4]~q\ <= NOT \inst1|regs[7][4]~q\;
\inst1|ALT_INV_regs[3][4]~q\ <= NOT \inst1|regs[3][4]~q\;
\inst1|ALT_INV_Mux27~2_combout\ <= NOT \inst1|Mux27~2_combout\;
\inst15|ALT_INV_Mux12~0_combout\ <= NOT \inst15|Mux12~0_combout\;
\inst15|ALT_INV_Mux11~0_combout\ <= NOT \inst15|Mux11~0_combout\;
\inst15|ALT_INV_Mux10~0_combout\ <= NOT \inst15|Mux10~0_combout\;
\inst15|ALT_INV_Mux9~0_combout\ <= NOT \inst15|Mux9~0_combout\;
\inst15|ALT_INV_Mux8~0_combout\ <= NOT \inst15|Mux8~0_combout\;
\inst15|ALT_INV_Mux7~0_combout\ <= NOT \inst15|Mux7~0_combout\;
\inst15|ALT_INV_Mux6~0_combout\ <= NOT \inst15|Mux6~0_combout\;
\inst15|ALT_INV_Mux5~0_combout\ <= NOT \inst15|Mux5~0_combout\;
\inst15|ALT_INV_Mux4~0_combout\ <= NOT \inst15|Mux4~0_combout\;
\inst15|ALT_INV_Mux3~0_combout\ <= NOT \inst15|Mux3~0_combout\;
\inst15|ALT_INV_Mux2~0_combout\ <= NOT \inst15|Mux2~0_combout\;
\inst15|ALT_INV_Mux1~0_combout\ <= NOT \inst15|Mux1~0_combout\;
\inst15|ALT_INV_Mux0~1_combout\ <= NOT \inst15|Mux0~1_combout\;
\inst15|ALT_INV_Mux0~0_combout\ <= NOT \inst15|Mux0~0_combout\;
\inst15|ALT_INV_Mux15~0_combout\ <= NOT \inst15|Mux15~0_combout\;
\inst5|ALT_INV_Mux13~1_combout\ <= NOT \inst5|Mux13~1_combout\;
\inst19|ALT_INV_store[15]~2_combout\ <= NOT \inst19|store[15]~2_combout\;
\inst19|ALT_INV_store[15]~1_combout\ <= NOT \inst19|store[15]~1_combout\;
\inst19|ALT_INV_store[15]~0_combout\ <= NOT \inst19|store[15]~0_combout\;
\inst15|ALT_INV_z_flag~1_combout\ <= NOT \inst15|z_flag~1_combout\;
\inst15|ALT_INV_z_flag~0_combout\ <= NOT \inst15|z_flag~0_combout\;
\inst5|ALT_INV_WideOr4~combout\ <= NOT \inst5|WideOr4~combout\;
\inst5|ALT_INV_next_state.T1~0_combout\ <= NOT \inst5|next_state.T1~0_combout\;
\inst5|ALT_INV_WideOr3~combout\ <= NOT \inst5|WideOr3~combout\;
\inst1|ALT_INV_Mux47~4_combout\ <= NOT \inst1|Mux47~4_combout\;
\inst1|ALT_INV_Mux47~3_combout\ <= NOT \inst1|Mux47~3_combout\;
\inst1|ALT_INV_Mux47~2_combout\ <= NOT \inst1|Mux47~2_combout\;
\inst1|ALT_INV_Mux47~1_combout\ <= NOT \inst1|Mux47~1_combout\;
\inst1|ALT_INV_Mux47~0_combout\ <= NOT \inst1|Mux47~0_combout\;
\inst1|ALT_INV_Mux46~4_combout\ <= NOT \inst1|Mux46~4_combout\;
\inst1|ALT_INV_Mux46~3_combout\ <= NOT \inst1|Mux46~3_combout\;
\inst1|ALT_INV_Mux46~2_combout\ <= NOT \inst1|Mux46~2_combout\;
\inst1|ALT_INV_Mux46~1_combout\ <= NOT \inst1|Mux46~1_combout\;
\inst1|ALT_INV_Mux46~0_combout\ <= NOT \inst1|Mux46~0_combout\;
\inst1|ALT_INV_Mux45~4_combout\ <= NOT \inst1|Mux45~4_combout\;
\inst1|ALT_INV_Mux45~3_combout\ <= NOT \inst1|Mux45~3_combout\;
\inst1|ALT_INV_Mux45~2_combout\ <= NOT \inst1|Mux45~2_combout\;
\inst1|ALT_INV_Mux45~1_combout\ <= NOT \inst1|Mux45~1_combout\;
\inst1|ALT_INV_Mux45~0_combout\ <= NOT \inst1|Mux45~0_combout\;
\inst1|ALT_INV_Mux44~4_combout\ <= NOT \inst1|Mux44~4_combout\;
\inst1|ALT_INV_Mux44~3_combout\ <= NOT \inst1|Mux44~3_combout\;
\inst1|ALT_INV_Mux44~2_combout\ <= NOT \inst1|Mux44~2_combout\;
\inst1|ALT_INV_Mux44~1_combout\ <= NOT \inst1|Mux44~1_combout\;
\inst1|ALT_INV_Mux44~0_combout\ <= NOT \inst1|Mux44~0_combout\;
\inst1|ALT_INV_Mux43~4_combout\ <= NOT \inst1|Mux43~4_combout\;
\inst1|ALT_INV_Mux43~3_combout\ <= NOT \inst1|Mux43~3_combout\;
\inst1|ALT_INV_Mux43~2_combout\ <= NOT \inst1|Mux43~2_combout\;
\inst1|ALT_INV_Mux43~1_combout\ <= NOT \inst1|Mux43~1_combout\;
\inst1|ALT_INV_Mux43~0_combout\ <= NOT \inst1|Mux43~0_combout\;
\inst1|ALT_INV_Mux42~4_combout\ <= NOT \inst1|Mux42~4_combout\;
\inst1|ALT_INV_Mux42~3_combout\ <= NOT \inst1|Mux42~3_combout\;
\inst1|ALT_INV_Mux42~2_combout\ <= NOT \inst1|Mux42~2_combout\;
\inst1|ALT_INV_Mux42~1_combout\ <= NOT \inst1|Mux42~1_combout\;
\inst1|ALT_INV_Mux42~0_combout\ <= NOT \inst1|Mux42~0_combout\;
\inst1|ALT_INV_Mux41~4_combout\ <= NOT \inst1|Mux41~4_combout\;
\inst1|ALT_INV_Mux41~3_combout\ <= NOT \inst1|Mux41~3_combout\;
\inst1|ALT_INV_Mux41~2_combout\ <= NOT \inst1|Mux41~2_combout\;
\inst1|ALT_INV_Mux41~1_combout\ <= NOT \inst1|Mux41~1_combout\;
\inst1|ALT_INV_Mux41~0_combout\ <= NOT \inst1|Mux41~0_combout\;
\inst1|ALT_INV_Mux40~4_combout\ <= NOT \inst1|Mux40~4_combout\;
\inst1|ALT_INV_Mux40~3_combout\ <= NOT \inst1|Mux40~3_combout\;
\inst1|ALT_INV_Mux40~2_combout\ <= NOT \inst1|Mux40~2_combout\;
\inst1|ALT_INV_Mux40~1_combout\ <= NOT \inst1|Mux40~1_combout\;
\inst1|ALT_INV_Mux40~0_combout\ <= NOT \inst1|Mux40~0_combout\;
\inst1|ALT_INV_Mux39~4_combout\ <= NOT \inst1|Mux39~4_combout\;
\inst1|ALT_INV_Mux39~3_combout\ <= NOT \inst1|Mux39~3_combout\;
\inst1|ALT_INV_Mux39~2_combout\ <= NOT \inst1|Mux39~2_combout\;
\inst1|ALT_INV_Mux39~1_combout\ <= NOT \inst1|Mux39~1_combout\;
\inst1|ALT_INV_Mux39~0_combout\ <= NOT \inst1|Mux39~0_combout\;
\inst1|ALT_INV_Mux38~4_combout\ <= NOT \inst1|Mux38~4_combout\;
\inst1|ALT_INV_Mux38~3_combout\ <= NOT \inst1|Mux38~3_combout\;
\inst1|ALT_INV_Mux38~2_combout\ <= NOT \inst1|Mux38~2_combout\;
\inst1|ALT_INV_Mux38~1_combout\ <= NOT \inst1|Mux38~1_combout\;
\inst15|ALT_INV_Mux15~2_combout\ <= NOT \inst15|Mux15~2_combout\;
\inst15|ALT_INV_Mux14~1_combout\ <= NOT \inst15|Mux14~1_combout\;
\inst15|ALT_INV_Mux13~1_combout\ <= NOT \inst15|Mux13~1_combout\;
\inst15|ALT_INV_Mux12~1_combout\ <= NOT \inst15|Mux12~1_combout\;
\inst15|ALT_INV_Mux10~1_combout\ <= NOT \inst15|Mux10~1_combout\;
\inst15|ALT_INV_Mux9~1_combout\ <= NOT \inst15|Mux9~1_combout\;
\inst15|ALT_INV_Mux8~1_combout\ <= NOT \inst15|Mux8~1_combout\;
\inst15|ALT_INV_Mux7~1_combout\ <= NOT \inst15|Mux7~1_combout\;
\inst15|ALT_INV_Mux6~1_combout\ <= NOT \inst15|Mux6~1_combout\;
\inst15|ALT_INV_Mux5~1_combout\ <= NOT \inst15|Mux5~1_combout\;
\inst15|ALT_INV_Mux4~1_combout\ <= NOT \inst15|Mux4~1_combout\;
\inst15|ALT_INV_Mux3~1_combout\ <= NOT \inst15|Mux3~1_combout\;
\inst15|ALT_INV_Mux2~1_combout\ <= NOT \inst15|Mux2~1_combout\;
\inst15|ALT_INV_Mux1~1_combout\ <= NOT \inst15|Mux1~1_combout\;
\inst15|ALT_INV_Mux0~3_combout\ <= NOT \inst15|Mux0~3_combout\;
\inst15|ALT_INV_Mux0~2_combout\ <= NOT \inst15|Mux0~2_combout\;
\inst15|ALT_INV_Mux11~1_combout\ <= NOT \inst15|Mux11~1_combout\;
\inst15|ALT_INV_z_flag~4_combout\ <= NOT \inst15|z_flag~4_combout\;
\inst15|ALT_INV_z_flag~3_combout\ <= NOT \inst15|z_flag~3_combout\;
\inst5|ALT_INV_Mux14~1_combout\ <= NOT \inst5|Mux14~1_combout\;
\inst1|ALT_INV_Mux15~0_combout\ <= NOT \inst1|Mux15~0_combout\;
\inst7|ALT_INV_sip_r\(0) <= NOT \inst7|sip_r\(0);
\inst1|ALT_INV_Mux14~0_combout\ <= NOT \inst1|Mux14~0_combout\;
\inst7|ALT_INV_sip_r\(1) <= NOT \inst7|sip_r\(1);
\inst1|ALT_INV_Mux13~0_combout\ <= NOT \inst1|Mux13~0_combout\;
\inst7|ALT_INV_sip_r\(2) <= NOT \inst7|sip_r\(2);
\inst1|ALT_INV_Mux12~0_combout\ <= NOT \inst1|Mux12~0_combout\;
\inst7|ALT_INV_sip_r\(3) <= NOT \inst7|sip_r\(3);
\inst1|ALT_INV_Mux11~0_combout\ <= NOT \inst1|Mux11~0_combout\;
\inst7|ALT_INV_sip_r\(4) <= NOT \inst7|sip_r\(4);
\inst1|ALT_INV_Mux10~0_combout\ <= NOT \inst1|Mux10~0_combout\;
\inst7|ALT_INV_sip_r\(5) <= NOT \inst7|sip_r\(5);
\inst1|ALT_INV_Mux9~0_combout\ <= NOT \inst1|Mux9~0_combout\;
\inst7|ALT_INV_sip_r\(6) <= NOT \inst7|sip_r\(6);
\inst1|ALT_INV_Mux8~0_combout\ <= NOT \inst1|Mux8~0_combout\;
\inst7|ALT_INV_sip_r\(7) <= NOT \inst7|sip_r\(7);
\inst1|ALT_INV_Mux7~0_combout\ <= NOT \inst1|Mux7~0_combout\;
\inst7|ALT_INV_sip_r\(8) <= NOT \inst7|sip_r\(8);
\inst1|ALT_INV_Mux6~0_combout\ <= NOT \inst1|Mux6~0_combout\;
\inst7|ALT_INV_sip_r\(9) <= NOT \inst7|sip_r\(9);
\inst1|ALT_INV_Mux5~0_combout\ <= NOT \inst1|Mux5~0_combout\;
\inst7|ALT_INV_sip_r\(10) <= NOT \inst7|sip_r\(10);
\inst1|ALT_INV_Mux4~0_combout\ <= NOT \inst1|Mux4~0_combout\;
\inst7|ALT_INV_sip_r\(11) <= NOT \inst7|sip_r\(11);
\inst1|ALT_INV_Mux3~0_combout\ <= NOT \inst1|Mux3~0_combout\;
\inst7|ALT_INV_sip_r\(12) <= NOT \inst7|sip_r\(12);
\inst1|ALT_INV_Mux2~0_combout\ <= NOT \inst1|Mux2~0_combout\;
\inst7|ALT_INV_sip_r\(13) <= NOT \inst7|sip_r\(13);
\inst1|ALT_INV_Mux1~2_combout\ <= NOT \inst1|Mux1~2_combout\;
\inst7|ALT_INV_sip_r\(14) <= NOT \inst7|sip_r\(14);
\inst1|ALT_INV_Mux0~2_combout\ <= NOT \inst1|Mux0~2_combout\;
\inst1|ALT_INV_Mux0~1_combout\ <= NOT \inst1|Mux0~1_combout\;
\inst1|ALT_INV_Mux0~0_combout\ <= NOT \inst1|Mux0~0_combout\;
\inst1|ALT_INV_Mux1~1_combout\ <= NOT \inst1|Mux1~1_combout\;
\inst7|ALT_INV_sip_r\(15) <= NOT \inst7|sip_r\(15);
\inst1|ALT_INV_Mux1~0_combout\ <= NOT \inst1|Mux1~0_combout\;
\inst15|ALT_INV_Mux15~1_combout\ <= NOT \inst15|Mux15~1_combout\;
\inst15|ALT_INV_Mux14~0_combout\ <= NOT \inst15|Mux14~0_combout\;
\inst15|ALT_INV_Mux13~0_combout\ <= NOT \inst15|Mux13~0_combout\;

\ir_write~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|ALT_INV_Selector1~0_combout\,
	devoe => ww_devoe,
	o => \ir_write~output_o\);

\z_flag~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst15|z_flag~q\,
	devoe => ww_devoe,
	o => \z_flag~output_o\);

\clr_z_flag~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|ALT_INV_clr_z_flag~0_combout\,
	devoe => ww_devoe,
	o => \clr_z_flag~output_o\);

\alu_operation[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Selector2~0_combout\,
	devoe => ww_devoe,
	o => \alu_operation[2]~output_o\);

\alu_operation[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|alu_operation[1]~0_combout\,
	devoe => ww_devoe,
	o => \alu_operation[1]~output_o\);

\alu_operation[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|alu_operation[0]~1_combout\,
	devoe => ww_devoe,
	o => \alu_operation[0]~output_o\);

\Op1_out[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|temp_op1_out\(15),
	devoe => ww_devoe,
	o => \Op1_out[15]~output_o\);

\Op1_out[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|temp_op1_out\(14),
	devoe => ww_devoe,
	o => \Op1_out[14]~output_o\);

\Op1_out[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|temp_op1_out\(13),
	devoe => ww_devoe,
	o => \Op1_out[13]~output_o\);

\Op1_out[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|temp_op1_out\(12),
	devoe => ww_devoe,
	o => \Op1_out[12]~output_o\);

\Op1_out[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|temp_op1_out\(11),
	devoe => ww_devoe,
	o => \Op1_out[11]~output_o\);

\Op1_out[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|temp_op1_out\(10),
	devoe => ww_devoe,
	o => \Op1_out[10]~output_o\);

\Op1_out[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|temp_op1_out\(9),
	devoe => ww_devoe,
	o => \Op1_out[9]~output_o\);

\Op1_out[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|temp_op1_out\(8),
	devoe => ww_devoe,
	o => \Op1_out[8]~output_o\);

\Op1_out[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|temp_op1_out\(7),
	devoe => ww_devoe,
	o => \Op1_out[7]~output_o\);

\Op1_out[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|temp_op1_out\(6),
	devoe => ww_devoe,
	o => \Op1_out[6]~output_o\);

\Op1_out[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|temp_op1_out\(5),
	devoe => ww_devoe,
	o => \Op1_out[5]~output_o\);

\Op1_out[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|temp_op1_out\(4),
	devoe => ww_devoe,
	o => \Op1_out[4]~output_o\);

\Op1_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|temp_op1_out\(3),
	devoe => ww_devoe,
	o => \Op1_out[3]~output_o\);

\Op1_out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|temp_op1_out\(2),
	devoe => ww_devoe,
	o => \Op1_out[2]~output_o\);

\Op1_out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|temp_op1_out\(1),
	devoe => ww_devoe,
	o => \Op1_out[1]~output_o\);

\Op1_out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|temp_op1_out\(0),
	devoe => ww_devoe,
	o => \Op1_out[0]~output_o\);

\Op1_write~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Op1_write~1_combout\,
	devoe => ww_devoe,
	o => \Op1_write~output_o\);

\op1_mux_select[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Op1_mux_select[1]~2_combout\,
	devoe => ww_devoe,
	o => \op1_mux_select[1]~output_o\);

\op1_mux_select[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Op1_mux_select[0]~3_combout\,
	devoe => ww_devoe,
	o => \op1_mux_select[0]~output_o\);

\op[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_op\(15),
	devoe => ww_devoe,
	o => \op[15]~output_o\);

\op[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_op\(14),
	devoe => ww_devoe,
	o => \op[14]~output_o\);

\op[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_op\(13),
	devoe => ww_devoe,
	o => \op[13]~output_o\);

\op[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_op\(12),
	devoe => ww_devoe,
	o => \op[12]~output_o\);

\op[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_op\(11),
	devoe => ww_devoe,
	o => \op[11]~output_o\);

\op[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_op\(10),
	devoe => ww_devoe,
	o => \op[10]~output_o\);

\op[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_op\(9),
	devoe => ww_devoe,
	o => \op[9]~output_o\);

\op[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_op\(8),
	devoe => ww_devoe,
	o => \op[8]~output_o\);

\op[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_op\(7),
	devoe => ww_devoe,
	o => \op[7]~output_o\);

\op[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_op\(6),
	devoe => ww_devoe,
	o => \op[6]~output_o\);

\op[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_op\(5),
	devoe => ww_devoe,
	o => \op[5]~output_o\);

\op[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_op\(4),
	devoe => ww_devoe,
	o => \op[4]~output_o\);

\op[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_op\(3),
	devoe => ww_devoe,
	o => \op[3]~output_o\);

\op[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_op\(2),
	devoe => ww_devoe,
	o => \op[2]~output_o\);

\op[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_op\(1),
	devoe => ww_devoe,
	o => \op[1]~output_o\);

\op[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_op\(0),
	devoe => ww_devoe,
	o => \op[0]~output_o\);

\check_AM~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Selector1~1_combout\,
	devoe => ww_devoe,
	o => \check_AM~output_o\);

\wr_en~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|wr_en~1_combout\,
	devoe => ww_devoe,
	o => \wr_en~output_o\);

\Op2_out[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|temp_op2_out\(15),
	devoe => ww_devoe,
	o => \Op2_out[15]~output_o\);

\Op2_out[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|temp_op2_out\(14),
	devoe => ww_devoe,
	o => \Op2_out[14]~output_o\);

\Op2_out[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|temp_op2_out\(13),
	devoe => ww_devoe,
	o => \Op2_out[13]~output_o\);

\Op2_out[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|temp_op2_out\(12),
	devoe => ww_devoe,
	o => \Op2_out[12]~output_o\);

\Op2_out[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|temp_op2_out\(11),
	devoe => ww_devoe,
	o => \Op2_out[11]~output_o\);

\Op2_out[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|temp_op2_out\(10),
	devoe => ww_devoe,
	o => \Op2_out[10]~output_o\);

\Op2_out[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|temp_op2_out\(9),
	devoe => ww_devoe,
	o => \Op2_out[9]~output_o\);

\Op2_out[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|temp_op2_out\(8),
	devoe => ww_devoe,
	o => \Op2_out[8]~output_o\);

\Op2_out[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|temp_op2_out\(7),
	devoe => ww_devoe,
	o => \Op2_out[7]~output_o\);

\Op2_out[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|temp_op2_out\(6),
	devoe => ww_devoe,
	o => \Op2_out[6]~output_o\);

\Op2_out[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|temp_op2_out\(5),
	devoe => ww_devoe,
	o => \Op2_out[5]~output_o\);

\Op2_out[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|temp_op2_out\(4),
	devoe => ww_devoe,
	o => \Op2_out[4]~output_o\);

\Op2_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|temp_op2_out\(3),
	devoe => ww_devoe,
	o => \Op2_out[3]~output_o\);

\Op2_out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|temp_op2_out\(2),
	devoe => ww_devoe,
	o => \Op2_out[2]~output_o\);

\Op2_out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|temp_op2_out\(1),
	devoe => ww_devoe,
	o => \Op2_out[1]~output_o\);

\Op2_out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst4|temp_op2_out\(0),
	devoe => ww_devoe,
	o => \Op2_out[0]~output_o\);

\Op2_write~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Op2_write~0_combout\,
	devoe => ww_devoe,
	o => \Op2_write~output_o\);

\op2_mux_select[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Op2_mux_select[1]~1_combout\,
	devoe => ww_devoe,
	o => \op2_mux_select[1]~output_o\);

\op2_mux_select[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Op2_mux_select[0]~2_combout\,
	devoe => ww_devoe,
	o => \op2_mux_select[0]~output_o\);

\pc_write~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Selector0~1_combout\,
	devoe => ww_devoe,
	o => \pc_write~output_o\);

\pc_mux_sel[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \pc_mux_sel[1]~output_o\);

\pc_mux_sel[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|Selector0~2_combout\,
	devoe => ww_devoe,
	o => \pc_mux_sel[0]~output_o\);

\present_out[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst19|store\(15),
	devoe => ww_devoe,
	o => \present_out[15]~output_o\);

\present_out[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst19|store\(14),
	devoe => ww_devoe,
	o => \present_out[14]~output_o\);

\present_out[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst19|store\(13),
	devoe => ww_devoe,
	o => \present_out[13]~output_o\);

\present_out[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst19|store\(12),
	devoe => ww_devoe,
	o => \present_out[12]~output_o\);

\present_out[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst19|store\(11),
	devoe => ww_devoe,
	o => \present_out[11]~output_o\);

\present_out[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst19|store\(10),
	devoe => ww_devoe,
	o => \present_out[10]~output_o\);

\present_out[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst19|store\(9),
	devoe => ww_devoe,
	o => \present_out[9]~output_o\);

\present_out[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst19|store\(8),
	devoe => ww_devoe,
	o => \present_out[8]~output_o\);

\present_out[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst19|store\(7),
	devoe => ww_devoe,
	o => \present_out[7]~output_o\);

\present_out[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst19|store\(6),
	devoe => ww_devoe,
	o => \present_out[6]~output_o\);

\present_out[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst19|store\(5),
	devoe => ww_devoe,
	o => \present_out[5]~output_o\);

\present_out[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst19|store\(4),
	devoe => ww_devoe,
	o => \present_out[4]~output_o\);

\present_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst19|store\(3),
	devoe => ww_devoe,
	o => \present_out[3]~output_o\);

\present_out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst19|store\(2),
	devoe => ww_devoe,
	o => \present_out[2]~output_o\);

\present_out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst19|store\(1),
	devoe => ww_devoe,
	o => \present_out[1]~output_o\);

\present_out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst19|store\(0),
	devoe => ww_devoe,
	o => \present_out[0]~output_o\);

\present_wr~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|present_wr~2_combout\,
	devoe => ww_devoe,
	o => \present_wr~output_o\);

\ld_r~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|ld_r~1_combout\,
	devoe => ww_devoe,
	o => \ld_r~output_o\);

\ALU_out[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst15|Mux0~1_combout\,
	devoe => ww_devoe,
	o => \ALU_out[15]~output_o\);

\ALU_out[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst15|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \ALU_out[14]~output_o\);

\ALU_out[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst15|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \ALU_out[13]~output_o\);

\ALU_out[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst15|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \ALU_out[12]~output_o\);

\ALU_out[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst15|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \ALU_out[11]~output_o\);

\ALU_out[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst15|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \ALU_out[10]~output_o\);

\ALU_out[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst15|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \ALU_out[9]~output_o\);

\ALU_out[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst15|Mux7~0_combout\,
	devoe => ww_devoe,
	o => \ALU_out[8]~output_o\);

\ALU_out[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst15|Mux8~0_combout\,
	devoe => ww_devoe,
	o => \ALU_out[7]~output_o\);

\ALU_out[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst15|Mux9~0_combout\,
	devoe => ww_devoe,
	o => \ALU_out[6]~output_o\);

\ALU_out[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst15|Mux10~0_combout\,
	devoe => ww_devoe,
	o => \ALU_out[5]~output_o\);

\ALU_out[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst15|Mux11~0_combout\,
	devoe => ww_devoe,
	o => \ALU_out[4]~output_o\);

\ALU_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst15|Mux12~0_combout\,
	devoe => ww_devoe,
	o => \ALU_out[3]~output_o\);

\ALU_out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst15|Mux13~0_combout\,
	devoe => ww_devoe,
	o => \ALU_out[2]~output_o\);

\ALU_out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst15|Mux14~0_combout\,
	devoe => ww_devoe,
	o => \ALU_out[1]~output_o\);

\ALU_out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst15|Mux15~1_combout\,
	devoe => ww_devoe,
	o => \ALU_out[0]~output_o\);

\dm_out[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_1|auto_generated|ram_block1a15~portbdataout\,
	devoe => ww_devoe,
	o => \dm_out[15]~output_o\);

\dm_out[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_1|auto_generated|ram_block1a14~portbdataout\,
	devoe => ww_devoe,
	o => \dm_out[14]~output_o\);

\dm_out[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_1|auto_generated|ram_block1a13~portbdataout\,
	devoe => ww_devoe,
	o => \dm_out[13]~output_o\);

\dm_out[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_1|auto_generated|ram_block1a12~portbdataout\,
	devoe => ww_devoe,
	o => \dm_out[12]~output_o\);

\dm_out[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_1|auto_generated|ram_block1a11~portbdataout\,
	devoe => ww_devoe,
	o => \dm_out[11]~output_o\);

\dm_out[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_1|auto_generated|ram_block1a10~portbdataout\,
	devoe => ww_devoe,
	o => \dm_out[10]~output_o\);

\dm_out[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_1|auto_generated|ram_block1a9~portbdataout\,
	devoe => ww_devoe,
	o => \dm_out[9]~output_o\);

\dm_out[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_1|auto_generated|ram_block1a8~portbdataout\,
	devoe => ww_devoe,
	o => \dm_out[8]~output_o\);

\dm_out[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_1|auto_generated|ram_block1a7~portbdataout\,
	devoe => ww_devoe,
	o => \dm_out[7]~output_o\);

\dm_out[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_1|auto_generated|ram_block1a6~portbdataout\,
	devoe => ww_devoe,
	o => \dm_out[6]~output_o\);

\dm_out[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_1|auto_generated|ram_block1a5~portbdataout\,
	devoe => ww_devoe,
	o => \dm_out[5]~output_o\);

\dm_out[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_1|auto_generated|ram_block1a4~portbdataout\,
	devoe => ww_devoe,
	o => \dm_out[4]~output_o\);

\dm_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_1|auto_generated|ram_block1a3~portbdataout\,
	devoe => ww_devoe,
	o => \dm_out[3]~output_o\);

\dm_out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_1|auto_generated|ram_block1a2~portbdataout\,
	devoe => ww_devoe,
	o => \dm_out[2]~output_o\);

\dm_out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_1|auto_generated|ram_block1a1~portbdataout\,
	devoe => ww_devoe,
	o => \dm_out[1]~output_o\);

\dm_out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_1|auto_generated|ram_block1a0~portbdataout\,
	devoe => ww_devoe,
	o => \dm_out[0]~output_o\);

\dpcr_lsb_sel~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|dpcr_lsb_sel~1_combout\,
	devoe => ww_devoe,
	o => \dpcr_lsb_sel~output_o\);

\dpcr_wr~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|dpcr_wr~0_combout\,
	devoe => ww_devoe,
	o => \dpcr_wr~output_o\);

\sop_wr~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|sop_wr~1_combout\,
	devoe => ww_devoe,
	o => \sop_wr~output_o\);

\AM[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_AM\(1),
	devoe => ww_devoe,
	o => \AM[1]~output_o\);

\AM[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_AM\(0),
	devoe => ww_devoe,
	o => \AM[0]~output_o\);

\opcode[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_opcode\(5),
	devoe => ww_devoe,
	o => \opcode[5]~output_o\);

\opcode[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_opcode\(4),
	devoe => ww_devoe,
	o => \opcode[4]~output_o\);

\opcode[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_opcode\(3),
	devoe => ww_devoe,
	o => \opcode[3]~output_o\);

\opcode[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_opcode\(2),
	devoe => ww_devoe,
	o => \opcode[2]~output_o\);

\opcode[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_opcode\(1),
	devoe => ww_devoe,
	o => \opcode[1]~output_o\);

\opcode[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_opcode\(0),
	devoe => ww_devoe,
	o => \opcode[0]~output_o\);

\alu_result_prev[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \alu_result_prev[15]~output_o\);

\alu_result_prev[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \alu_result_prev[14]~output_o\);

\alu_result_prev[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \alu_result_prev[13]~output_o\);

\alu_result_prev[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \alu_result_prev[12]~output_o\);

\alu_result_prev[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \alu_result_prev[11]~output_o\);

\alu_result_prev[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \alu_result_prev[10]~output_o\);

\alu_result_prev[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \alu_result_prev[9]~output_o\);

\alu_result_prev[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \alu_result_prev[8]~output_o\);

\alu_result_prev[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \alu_result_prev[7]~output_o\);

\alu_result_prev[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \alu_result_prev[6]~output_o\);

\alu_result_prev[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \alu_result_prev[5]~output_o\);

\alu_result_prev[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \alu_result_prev[4]~output_o\);

\alu_result_prev[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \alu_result_prev[3]~output_o\);

\alu_result_prev[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \alu_result_prev[2]~output_o\);

\alu_result_prev[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \alu_result_prev[1]~output_o\);

\alu_result_prev[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \alu_result_prev[0]~output_o\);

\dpcr[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(31),
	devoe => ww_devoe,
	o => \dpcr[31]~output_o\);

\dpcr[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(30),
	devoe => ww_devoe,
	o => \dpcr[30]~output_o\);

\dpcr[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(29),
	devoe => ww_devoe,
	o => \dpcr[29]~output_o\);

\dpcr[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(28),
	devoe => ww_devoe,
	o => \dpcr[28]~output_o\);

\dpcr[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(27),
	devoe => ww_devoe,
	o => \dpcr[27]~output_o\);

\dpcr[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(26),
	devoe => ww_devoe,
	o => \dpcr[26]~output_o\);

\dpcr[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(25),
	devoe => ww_devoe,
	o => \dpcr[25]~output_o\);

\dpcr[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(24),
	devoe => ww_devoe,
	o => \dpcr[24]~output_o\);

\dpcr[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(23),
	devoe => ww_devoe,
	o => \dpcr[23]~output_o\);

\dpcr[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(22),
	devoe => ww_devoe,
	o => \dpcr[22]~output_o\);

\dpcr[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(21),
	devoe => ww_devoe,
	o => \dpcr[21]~output_o\);

\dpcr[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(20),
	devoe => ww_devoe,
	o => \dpcr[20]~output_o\);

\dpcr[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(19),
	devoe => ww_devoe,
	o => \dpcr[19]~output_o\);

\dpcr[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(18),
	devoe => ww_devoe,
	o => \dpcr[18]~output_o\);

\dpcr[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(17),
	devoe => ww_devoe,
	o => \dpcr[17]~output_o\);

\dpcr[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(16),
	devoe => ww_devoe,
	o => \dpcr[16]~output_o\);

\dpcr[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(15),
	devoe => ww_devoe,
	o => \dpcr[15]~output_o\);

\dpcr[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(14),
	devoe => ww_devoe,
	o => \dpcr[14]~output_o\);

\dpcr[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(13),
	devoe => ww_devoe,
	o => \dpcr[13]~output_o\);

\dpcr[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(12),
	devoe => ww_devoe,
	o => \dpcr[12]~output_o\);

\dpcr[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(11),
	devoe => ww_devoe,
	o => \dpcr[11]~output_o\);

\dpcr[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(10),
	devoe => ww_devoe,
	o => \dpcr[10]~output_o\);

\dpcr[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(9),
	devoe => ww_devoe,
	o => \dpcr[9]~output_o\);

\dpcr[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(8),
	devoe => ww_devoe,
	o => \dpcr[8]~output_o\);

\dpcr[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(7),
	devoe => ww_devoe,
	o => \dpcr[7]~output_o\);

\dpcr[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(6),
	devoe => ww_devoe,
	o => \dpcr[6]~output_o\);

\dpcr[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(5),
	devoe => ww_devoe,
	o => \dpcr[5]~output_o\);

\dpcr[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(4),
	devoe => ww_devoe,
	o => \dpcr[4]~output_o\);

\dpcr[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(3),
	devoe => ww_devoe,
	o => \dpcr[3]~output_o\);

\dpcr[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(2),
	devoe => ww_devoe,
	o => \dpcr[2]~output_o\);

\dpcr[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(1),
	devoe => ww_devoe,
	o => \dpcr[1]~output_o\);

\dpcr[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|dpcr\(0),
	devoe => ww_devoe,
	o => \dpcr[0]~output_o\);

\PC_out[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|pc_counter\(15),
	devoe => ww_devoe,
	o => \PC_out[15]~output_o\);

\PC_out[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|pc_counter\(14),
	devoe => ww_devoe,
	o => \PC_out[14]~output_o\);

\PC_out[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|pc_counter\(13),
	devoe => ww_devoe,
	o => \PC_out[13]~output_o\);

\PC_out[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|pc_counter\(12),
	devoe => ww_devoe,
	o => \PC_out[12]~output_o\);

\PC_out[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|pc_counter\(11),
	devoe => ww_devoe,
	o => \PC_out[11]~output_o\);

\PC_out[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|pc_counter\(10),
	devoe => ww_devoe,
	o => \PC_out[10]~output_o\);

\PC_out[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|pc_counter\(9),
	devoe => ww_devoe,
	o => \PC_out[9]~output_o\);

\PC_out[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|pc_counter\(8),
	devoe => ww_devoe,
	o => \PC_out[8]~output_o\);

\PC_out[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|pc_counter\(7),
	devoe => ww_devoe,
	o => \PC_out[7]~output_o\);

\PC_out[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|pc_counter\(6),
	devoe => ww_devoe,
	o => \PC_out[6]~output_o\);

\PC_out[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|pc_counter\(5),
	devoe => ww_devoe,
	o => \PC_out[5]~output_o\);

\PC_out[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|pc_counter\(4),
	devoe => ww_devoe,
	o => \PC_out[4]~output_o\);

\PC_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|pc_counter\(3),
	devoe => ww_devoe,
	o => \PC_out[3]~output_o\);

\PC_out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|pc_counter\(2),
	devoe => ww_devoe,
	o => \PC_out[2]~output_o\);

\PC_out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|pc_counter\(1),
	devoe => ww_devoe,
	o => \PC_out[1]~output_o\);

\PC_out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|pc_counter\(0),
	devoe => ww_devoe,
	o => \PC_out[0]~output_o\);

\pm_outdata[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	devoe => ww_devoe,
	o => \pm_outdata[15]~output_o\);

\pm_outdata[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	devoe => ww_devoe,
	o => \pm_outdata[14]~output_o\);

\pm_outdata[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	devoe => ww_devoe,
	o => \pm_outdata[13]~output_o\);

\pm_outdata[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	devoe => ww_devoe,
	o => \pm_outdata[12]~output_o\);

\pm_outdata[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	devoe => ww_devoe,
	o => \pm_outdata[11]~output_o\);

\pm_outdata[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	devoe => ww_devoe,
	o => \pm_outdata[10]~output_o\);

\pm_outdata[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	devoe => ww_devoe,
	o => \pm_outdata[9]~output_o\);

\pm_outdata[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	devoe => ww_devoe,
	o => \pm_outdata[8]~output_o\);

\pm_outdata[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	devoe => ww_devoe,
	o => \pm_outdata[7]~output_o\);

\pm_outdata[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	devoe => ww_devoe,
	o => \pm_outdata[6]~output_o\);

\pm_outdata[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	devoe => ww_devoe,
	o => \pm_outdata[5]~output_o\);

\pm_outdata[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	devoe => ww_devoe,
	o => \pm_outdata[4]~output_o\);

\pm_outdata[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	devoe => ww_devoe,
	o => \pm_outdata[3]~output_o\);

\pm_outdata[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	devoe => ww_devoe,
	o => \pm_outdata[2]~output_o\);

\pm_outdata[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	devoe => ww_devoe,
	o => \pm_outdata[1]~output_o\);

\pm_outdata[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|memory_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	devoe => ww_devoe,
	o => \pm_outdata[0]~output_o\);

\rf_mux[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|rf_input_sel[2]~0_combout\,
	devoe => ww_devoe,
	o => \rf_mux[2]~output_o\);

\rf_mux[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|rf_input_sel[1]~1_combout\,
	devoe => ww_devoe,
	o => \rf_mux[1]~output_o\);

\rf_mux[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|ALT_INV_rf_input_sel[0]~2_combout\,
	devoe => ww_devoe,
	o => \rf_mux[0]~output_o\);

\Rx[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux16~4_combout\,
	devoe => ww_devoe,
	o => \Rx[15]~output_o\);

\Rx[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux17~4_combout\,
	devoe => ww_devoe,
	o => \Rx[14]~output_o\);

\Rx[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux18~4_combout\,
	devoe => ww_devoe,
	o => \Rx[13]~output_o\);

\Rx[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux19~4_combout\,
	devoe => ww_devoe,
	o => \Rx[12]~output_o\);

\Rx[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux20~4_combout\,
	devoe => ww_devoe,
	o => \Rx[11]~output_o\);

\Rx[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux21~4_combout\,
	devoe => ww_devoe,
	o => \Rx[10]~output_o\);

\Rx[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux22~4_combout\,
	devoe => ww_devoe,
	o => \Rx[9]~output_o\);

\Rx[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux23~4_combout\,
	devoe => ww_devoe,
	o => \Rx[8]~output_o\);

\Rx[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux24~4_combout\,
	devoe => ww_devoe,
	o => \Rx[7]~output_o\);

\Rx[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux25~4_combout\,
	devoe => ww_devoe,
	o => \Rx[6]~output_o\);

\Rx[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux26~4_combout\,
	devoe => ww_devoe,
	o => \Rx[5]~output_o\);

\Rx[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux27~4_combout\,
	devoe => ww_devoe,
	o => \Rx[4]~output_o\);

\Rx[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux28~4_combout\,
	devoe => ww_devoe,
	o => \Rx[3]~output_o\);

\Rx[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux29~4_combout\,
	devoe => ww_devoe,
	o => \Rx[2]~output_o\);

\Rx[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux30~4_combout\,
	devoe => ww_devoe,
	o => \Rx[1]~output_o\);

\Rx[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux31~4_combout\,
	devoe => ww_devoe,
	o => \Rx[0]~output_o\);

\Rx_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_rx\(3),
	devoe => ww_devoe,
	o => \Rx_out[3]~output_o\);

\Rx_out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_rx\(2),
	devoe => ww_devoe,
	o => \Rx_out[2]~output_o\);

\Rx_out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_rx\(1),
	devoe => ww_devoe,
	o => \Rx_out[1]~output_o\);

\Rx_out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_rx\(0),
	devoe => ww_devoe,
	o => \Rx_out[0]~output_o\);

\Rz[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux32~4_combout\,
	devoe => ww_devoe,
	o => \Rz[15]~output_o\);

\Rz[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux33~4_combout\,
	devoe => ww_devoe,
	o => \Rz[14]~output_o\);

\Rz[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux34~4_combout\,
	devoe => ww_devoe,
	o => \Rz[13]~output_o\);

\Rz[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux35~4_combout\,
	devoe => ww_devoe,
	o => \Rz[12]~output_o\);

\Rz[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux36~4_combout\,
	devoe => ww_devoe,
	o => \Rz[11]~output_o\);

\Rz[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux37~4_combout\,
	devoe => ww_devoe,
	o => \Rz[10]~output_o\);

\Rz[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux38~4_combout\,
	devoe => ww_devoe,
	o => \Rz[9]~output_o\);

\Rz[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux39~4_combout\,
	devoe => ww_devoe,
	o => \Rz[8]~output_o\);

\Rz[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux40~4_combout\,
	devoe => ww_devoe,
	o => \Rz[7]~output_o\);

\Rz[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux41~4_combout\,
	devoe => ww_devoe,
	o => \Rz[6]~output_o\);

\Rz[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux42~4_combout\,
	devoe => ww_devoe,
	o => \Rz[5]~output_o\);

\Rz[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux43~4_combout\,
	devoe => ww_devoe,
	o => \Rz[4]~output_o\);

\Rz[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux44~4_combout\,
	devoe => ww_devoe,
	o => \Rz[3]~output_o\);

\Rz[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux45~4_combout\,
	devoe => ww_devoe,
	o => \Rz[2]~output_o\);

\Rz[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux46~4_combout\,
	devoe => ww_devoe,
	o => \Rz[1]~output_o\);

\Rz[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|Mux47~4_combout\,
	devoe => ww_devoe,
	o => \Rz[0]~output_o\);

\Rz_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_rz\(3),
	devoe => ww_devoe,
	o => \Rz_out[3]~output_o\);

\Rz_out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_rz\(2),
	devoe => ww_devoe,
	o => \Rz_out[2]~output_o\);

\Rz_out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_rz\(1),
	devoe => ww_devoe,
	o => \Rz_out[1]~output_o\);

\Rz_out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|temp_rz\(0),
	devoe => ww_devoe,
	o => \Rz_out[0]~output_o\);

\sop[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|sop\(15),
	devoe => ww_devoe,
	o => \sop[15]~output_o\);

\sop[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|sop\(14),
	devoe => ww_devoe,
	o => \sop[14]~output_o\);

\sop[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|sop\(13),
	devoe => ww_devoe,
	o => \sop[13]~output_o\);

\sop[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|sop\(12),
	devoe => ww_devoe,
	o => \sop[12]~output_o\);

\sop[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|sop\(11),
	devoe => ww_devoe,
	o => \sop[11]~output_o\);

\sop[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|sop\(10),
	devoe => ww_devoe,
	o => \sop[10]~output_o\);

\sop[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|sop\(9),
	devoe => ww_devoe,
	o => \sop[9]~output_o\);

\sop[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|sop\(8),
	devoe => ww_devoe,
	o => \sop[8]~output_o\);

\sop[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|sop\(7),
	devoe => ww_devoe,
	o => \sop[7]~output_o\);

\sop[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|sop\(6),
	devoe => ww_devoe,
	o => \sop[6]~output_o\);

\sop[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|sop\(5),
	devoe => ww_devoe,
	o => \sop[5]~output_o\);

\sop[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|sop\(4),
	devoe => ww_devoe,
	o => \sop[4]~output_o\);

\sop[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|sop\(3),
	devoe => ww_devoe,
	o => \sop[3]~output_o\);

\sop[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|sop\(2),
	devoe => ww_devoe,
	o => \sop[2]~output_o\);

\sop[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|sop\(1),
	devoe => ww_devoe,
	o => \sop[1]~output_o\);

\sop[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst7|sop\(0),
	devoe => ww_devoe,
	o => \sop[0]~output_o\);

\state_is[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|state_is\(2),
	devoe => ww_devoe,
	o => \state_is[2]~output_o\);

\state_is[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|ALT_INV_WideOr3~combout\,
	devoe => ww_devoe,
	o => \state_is[1]~output_o\);

\state_is[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5|ALT_INV_WideOr4~combout\,
	devoe => ww_devoe,
	o => \state_is[0]~output_o\);

\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

\inst|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~61_sumout\ = SUM(( \inst|pc_counter\(0) ) + ( VCC ) + ( !VCC ))
-- \inst|Add0~62\ = CARRY(( \inst|pc_counter\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_pc_counter\(0),
	cin => GND,
	sumout => \inst|Add0~61_sumout\,
	cout => \inst|Add0~62\);

\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

\inst5|state.init\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => VCC,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|state.init~q\);

\inst5|state.T4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst5|state.T3~q\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|state.T4~q\);

\inst5|next_state.T1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|next_state.T1~0_combout\ = (!\inst5|state.init~q\) # (\inst5|state.T4~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101110111011101110111011101110111011101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.init~q\,
	datab => \inst5|ALT_INV_state.T4~q\,
	combout => \inst5|next_state.T1~0_combout\);

\inst5|state.T1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst5|next_state.T1~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|state.T1~q\);

\inst5|state.T1_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst5|state.T1~q\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|state.T1_1~q\);

\inst5|state.T2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst5|state.T1_1~q\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|state.T2~q\);

\inst5|state.T3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst5|state.T2~q\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst5|state.T3~q\);

\inst|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~13_sumout\ = SUM(( \inst|pc_counter\(12) ) + ( GND ) + ( \inst|Add0~18\ ))
-- \inst|Add0~14\ = CARRY(( \inst|pc_counter\(12) ) + ( GND ) + ( \inst|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_pc_counter\(12),
	cin => \inst|Add0~18\,
	sumout => \inst|Add0~13_sumout\,
	cout => \inst|Add0~14\);

\inst|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~9_sumout\ = SUM(( \inst|pc_counter\(13) ) + ( GND ) + ( \inst|Add0~14\ ))
-- \inst|Add0~10\ = CARRY(( \inst|pc_counter\(13) ) + ( GND ) + ( \inst|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_pc_counter\(13),
	cin => \inst|Add0~14\,
	sumout => \inst|Add0~9_sumout\,
	cout => \inst|Add0~10\);

\inst1|regs[4][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux5~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[4][10]~q\);

\inst1|regs[4][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux11~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[4][4]~q\);

\inst1|regs[8][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux11~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[8][4]~q\);

\inst1|regs[4][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux9~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[4][6]~q\);

\inst1|regs[8][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux9~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[8][6]~q\);

\inst1|regs[12][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux9~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[12][6]~q\);

\inst1|regs[1][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux8~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[1][7]~q\);

\inst1|Decoder0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Decoder0~2_combout\ = ( !\inst6|temp_rz\(3) & ( (\inst5|ld_r~1_combout\ & (!\inst6|temp_rz\(0) & (\inst6|temp_rz\(1) & !\inst6|temp_rz\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000000000000000000000000000100000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~1_combout\,
	datab => \inst6|ALT_INV_temp_rz\(0),
	datac => \inst6|ALT_INV_temp_rz\(1),
	datad => \inst6|ALT_INV_temp_rz\(2),
	datae => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Decoder0~2_combout\);

\inst1|regs[2][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux8~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[2][7]~q\);

\inst1|Decoder0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Decoder0~3_combout\ = ( !\inst6|temp_rz\(3) & ( (\inst5|ld_r~1_combout\ & (\inst6|temp_rz\(0) & (\inst6|temp_rz\(1) & !\inst6|temp_rz\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000000000000000000000000000001000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~1_combout\,
	datab => \inst6|ALT_INV_temp_rz\(0),
	datac => \inst6|ALT_INV_temp_rz\(1),
	datad => \inst6|ALT_INV_temp_rz\(2),
	datae => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Decoder0~3_combout\);

\inst1|regs[3][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux8~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[3][7]~q\);

\inst1|Mux40~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux40~0_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[3][7]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[2][7]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[1][7]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[0][7]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][7]~q\,
	datab => \inst1|ALT_INV_regs[1][7]~q\,
	datac => \inst1|ALT_INV_regs[2][7]~q\,
	datad => \inst1|ALT_INV_regs[3][7]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux40~0_combout\);

\inst1|regs[4][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux8~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[4][7]~q\);

\inst1|Decoder0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Decoder0~5_combout\ = ( !\inst6|temp_rz\(3) & ( (\inst5|ld_r~1_combout\ & (\inst6|temp_rz\(0) & (!\inst6|temp_rz\(1) & \inst6|temp_rz\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010000000000000000000000000000000100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~1_combout\,
	datab => \inst6|ALT_INV_temp_rz\(0),
	datac => \inst6|ALT_INV_temp_rz\(1),
	datad => \inst6|ALT_INV_temp_rz\(2),
	datae => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Decoder0~5_combout\);

\inst1|regs[5][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux8~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[5][7]~q\);

\inst1|Decoder0~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Decoder0~6_combout\ = ( !\inst6|temp_rz\(3) & ( (\inst5|ld_r~1_combout\ & (!\inst6|temp_rz\(0) & (\inst6|temp_rz\(1) & \inst6|temp_rz\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100000000000000000000000000000001000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~1_combout\,
	datab => \inst6|ALT_INV_temp_rz\(0),
	datac => \inst6|ALT_INV_temp_rz\(1),
	datad => \inst6|ALT_INV_temp_rz\(2),
	datae => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Decoder0~6_combout\);

\inst1|regs[6][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux8~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[6][7]~q\);

\inst1|Decoder0~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Decoder0~7_combout\ = ( !\inst6|temp_rz\(3) & ( (\inst5|ld_r~1_combout\ & (\inst6|temp_rz\(0) & (\inst6|temp_rz\(1) & \inst6|temp_rz\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000000000000000000010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~1_combout\,
	datab => \inst6|ALT_INV_temp_rz\(0),
	datac => \inst6|ALT_INV_temp_rz\(1),
	datad => \inst6|ALT_INV_temp_rz\(2),
	datae => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Decoder0~7_combout\);

\inst1|regs[7][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux8~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[7][7]~q\);

\inst1|Mux40~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux40~1_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[7][7]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[6][7]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[5][7]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[4][7]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[4][7]~q\,
	datab => \inst1|ALT_INV_regs[5][7]~q\,
	datac => \inst1|ALT_INV_regs[6][7]~q\,
	datad => \inst1|ALT_INV_regs[7][7]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux40~1_combout\);

\inst1|regs[8][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux8~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[8][7]~q\);

\inst1|Decoder0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Decoder0~9_combout\ = ( \inst6|temp_rz\(3) & ( (\inst5|ld_r~1_combout\ & (\inst6|temp_rz\(0) & (!\inst6|temp_rz\(1) & !\inst6|temp_rz\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000100000000000000000000000000000001000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~1_combout\,
	datab => \inst6|ALT_INV_temp_rz\(0),
	datac => \inst6|ALT_INV_temp_rz\(1),
	datad => \inst6|ALT_INV_temp_rz\(2),
	datae => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Decoder0~9_combout\);

\inst1|regs[9][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux8~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[9][7]~q\);

\inst1|Decoder0~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Decoder0~10_combout\ = ( \inst6|temp_rz\(3) & ( (\inst5|ld_r~1_combout\ & (!\inst6|temp_rz\(0) & (\inst6|temp_rz\(1) & !\inst6|temp_rz\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001000000000000000000000000000000010000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~1_combout\,
	datab => \inst6|ALT_INV_temp_rz\(0),
	datac => \inst6|ALT_INV_temp_rz\(1),
	datad => \inst6|ALT_INV_temp_rz\(2),
	datae => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Decoder0~10_combout\);

\inst1|regs[10][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux8~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[10][7]~q\);

\inst1|Decoder0~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Decoder0~11_combout\ = ( \inst6|temp_rz\(3) & ( (\inst5|ld_r~1_combout\ & (\inst6|temp_rz\(0) & (\inst6|temp_rz\(1) & !\inst6|temp_rz\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000010000000000000000000000000000000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~1_combout\,
	datab => \inst6|ALT_INV_temp_rz\(0),
	datac => \inst6|ALT_INV_temp_rz\(1),
	datad => \inst6|ALT_INV_temp_rz\(2),
	datae => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Decoder0~11_combout\);

\inst1|regs[11][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux8~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[11][7]~q\);

\inst1|Mux40~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux40~2_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[11][7]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[10][7]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[9][7]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[8][7]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[8][7]~q\,
	datab => \inst1|ALT_INV_regs[9][7]~q\,
	datac => \inst1|ALT_INV_regs[10][7]~q\,
	datad => \inst1|ALT_INV_regs[11][7]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux40~2_combout\);

\inst1|regs[12][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux8~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[12][7]~q\);

\inst1|Decoder0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Decoder0~13_combout\ = ( \inst6|temp_rz\(3) & ( (\inst5|ld_r~1_combout\ & (\inst6|temp_rz\(0) & (!\inst6|temp_rz\(1) & \inst6|temp_rz\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000001000000000000000000000000000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~1_combout\,
	datab => \inst6|ALT_INV_temp_rz\(0),
	datac => \inst6|ALT_INV_temp_rz\(1),
	datad => \inst6|ALT_INV_temp_rz\(2),
	datae => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Decoder0~13_combout\);

\inst1|regs[13][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux8~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[13][7]~q\);

\inst1|Decoder0~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Decoder0~14_combout\ = ( \inst6|temp_rz\(3) & ( (\inst5|ld_r~1_combout\ & (!\inst6|temp_rz\(0) & (\inst6|temp_rz\(1) & \inst6|temp_rz\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000010000000000000000000000000000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~1_combout\,
	datab => \inst6|ALT_INV_temp_rz\(0),
	datac => \inst6|ALT_INV_temp_rz\(1),
	datad => \inst6|ALT_INV_temp_rz\(2),
	datae => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Decoder0~14_combout\);

\inst1|regs[14][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux8~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[14][7]~q\);

\inst1|Decoder0~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Decoder0~15_combout\ = ( \inst6|temp_rz\(3) & ( (\inst5|ld_r~1_combout\ & (\inst6|temp_rz\(0) & (\inst6|temp_rz\(1) & \inst6|temp_rz\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000100000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~1_combout\,
	datab => \inst6|ALT_INV_temp_rz\(0),
	datac => \inst6|ALT_INV_temp_rz\(1),
	datad => \inst6|ALT_INV_temp_rz\(2),
	datae => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Decoder0~15_combout\);

\inst1|regs[15][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux8~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[15][7]~q\);

\inst1|Mux40~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux40~3_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[15][7]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[14][7]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[13][7]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[12][7]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[12][7]~q\,
	datab => \inst1|ALT_INV_regs[13][7]~q\,
	datac => \inst1|ALT_INV_regs[14][7]~q\,
	datad => \inst1|ALT_INV_regs[15][7]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux40~3_combout\);

\inst1|Mux40~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux40~4_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|Mux40~3_combout\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|Mux40~2_combout\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( 
-- \inst1|Mux40~1_combout\ ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|Mux40~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux40~0_combout\,
	datab => \inst1|ALT_INV_Mux40~1_combout\,
	datac => \inst1|ALT_INV_Mux40~2_combout\,
	datad => \inst1|ALT_INV_Mux40~3_combout\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux40~4_combout\);

\inst|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~5_sumout\ = SUM(( \inst|pc_counter\(14) ) + ( GND ) + ( \inst|Add0~10\ ))
-- \inst|Add0~6\ = CARRY(( \inst|pc_counter\(14) ) + ( GND ) + ( \inst|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_pc_counter\(14),
	cin => \inst|Add0~10\,
	sumout => \inst|Add0~5_sumout\,
	cout => \inst|Add0~6\);

\inst5|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Selector2~0_combout\ = (!\inst5|state.T3~q\ & ((\inst5|state.init~q\))) # (\inst5|state.T3~q\ & (!\inst5|Mux12~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100111001001110010011100100111001001110010011100100111001001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_Mux12~0_combout\,
	datac => \inst5|ALT_INV_state.init~q\,
	combout => \inst5|Selector2~0_combout\);

\inst5|ld_r~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|ld_r~0_combout\ = (\inst5|state.T3~q\ & (!\inst6|temp_opcode\(4) $ (\inst6|temp_opcode\(5))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000100100001001000010010000100100001001000010010000100100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(4),
	datab => \inst5|ALT_INV_state.T3~q\,
	datac => \inst6|ALT_INV_temp_opcode\(5),
	combout => \inst5|ld_r~0_combout\);

\inst5|Mux16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux16~0_combout\ = (!\inst6|temp_opcode\(3) & (!\inst6|temp_opcode\(2) & \inst5|Mux13~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000001000000010000000100000001000000010000000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(3),
	datab => \inst6|ALT_INV_temp_opcode\(2),
	datac => \inst5|ALT_INV_Mux13~0_combout\,
	combout => \inst5|Mux16~0_combout\);

\inst5|sop_wr~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|sop_wr~0_combout\ = (\inst6|temp_AM\(1) & (\inst6|temp_opcode\(5) & \inst6|temp_opcode\(1)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst6|ALT_INV_temp_opcode\(1),
	combout => \inst5|sop_wr~0_combout\);

\inst5|Mux16~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux16~1_combout\ = (\inst6|temp_AM\(0) & (!\inst6|temp_opcode\(3) & (\inst6|temp_opcode\(2) & \inst6|temp_opcode\(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100000000000000010000000000000001000000000000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(0),
	datab => \inst6|ALT_INV_temp_opcode\(3),
	datac => \inst6|ALT_INV_temp_opcode\(2),
	datad => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|Mux16~1_combout\);

\inst5|Mux16~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux16~2_combout\ = (\inst5|sop_wr~0_combout\ & \inst5|Mux16~1_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_sop_wr~0_combout\,
	datab => \inst5|ALT_INV_Mux16~1_combout\,
	combout => \inst5|Mux16~2_combout\);

\inst5|Mux16~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux16~3_combout\ = (!\inst5|Mux16~2_combout\ & ((!\inst6|temp_AM\(1)) # (!\inst5|Mux16~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110000011100000111000001110000011100000111000001110000011100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst5|ALT_INV_Mux16~0_combout\,
	datac => \inst5|ALT_INV_Mux16~2_combout\,
	combout => \inst5|Mux16~3_combout\);

\inst5|Mux17~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux17~0_combout\ = ( \inst6|temp_opcode\(0) & ( (!\inst6|temp_opcode\(3) & (!\inst6|temp_opcode\(2) & \inst6|temp_opcode\(1))) ) ) # ( !\inst6|temp_opcode\(0) & ( (!\inst6|temp_opcode\(1) & (((\inst6|temp_AM\(1) & !\inst6|temp_opcode\(2))) # 
-- (\inst6|temp_opcode\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111001100000000000000001100000001110011000000000000000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_opcode\(3),
	datac => \inst6|ALT_INV_temp_opcode\(2),
	datad => \inst6|ALT_INV_temp_opcode\(1),
	datae => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|Mux17~0_combout\);

\inst5|Mux17~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux17~1_combout\ = (!\inst6|temp_opcode\(5) & ((\inst5|Mux17~0_combout\))) # (\inst6|temp_opcode\(5) & (\inst5|dpcr_lsb_sel~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100011011000110110001101100011011000110110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(5),
	datab => \inst5|ALT_INV_dpcr_lsb_sel~0_combout\,
	datac => \inst5|ALT_INV_Mux17~0_combout\,
	combout => \inst5|Mux17~1_combout\);

\inst5|Mux18~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux18~0_combout\ = (!\inst5|Mux16~2_combout\ & ((!\inst6|temp_opcode\(5) & ((!\inst5|Mux17~0_combout\))) # (\inst6|temp_opcode\(5) & (!\inst5|dpcr_lsb_sel~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110000001000000111000000100000011100000010000001110000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(5),
	datab => \inst5|ALT_INV_dpcr_lsb_sel~0_combout\,
	datac => \inst5|ALT_INV_Mux16~2_combout\,
	datad => \inst5|ALT_INV_Mux17~0_combout\,
	combout => \inst5|Mux18~0_combout\);

\inst1|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux1~0_combout\ = (\inst5|ld_r~0_combout\ & (!\inst5|Mux17~1_combout\ & ((!\inst5|Mux16~3_combout\) # (!\inst5|Mux18~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001000000010100000100000001010000010000000101000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~0_combout\,
	datab => \inst5|ALT_INV_Mux16~3_combout\,
	datac => \inst5|ALT_INV_Mux17~1_combout\,
	datad => \inst5|ALT_INV_Mux18~0_combout\,
	combout => \inst1|Mux1~0_combout\);

\inst5|rf_input_sel[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|rf_input_sel[2]~0_combout\ = (\inst5|ld_r~0_combout\ & !\inst5|Mux16~3_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100010001000100010001000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~0_combout\,
	datab => \inst5|ALT_INV_Mux16~3_combout\,
	combout => \inst5|rf_input_sel[2]~0_combout\);

\inst1|Mux1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux1~1_combout\ = (\inst5|ld_r~0_combout\ & ((!\inst5|Mux16~3_combout\) # ((!\inst5|Mux18~0_combout\) # (\inst5|Mux17~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101000101010101010100010101010101010001010101010101000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~0_combout\,
	datab => \inst5|ALT_INV_Mux16~3_combout\,
	datac => \inst5|ALT_INV_Mux17~1_combout\,
	datad => \inst5|ALT_INV_Mux18~0_combout\,
	combout => \inst1|Mux1~1_combout\);

\inst1|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux0~0_combout\ = (\inst1|Mux1~1_combout\ & ((!\inst5|rf_input_sel[2]~0_combout\) # (!\inst5|Mux17~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111000001110000011100000111000001110000011100000111000001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_rf_input_sel[2]~0_combout\,
	datab => \inst5|ALT_INV_Mux17~1_combout\,
	datac => \inst1|ALT_INV_Mux1~1_combout\,
	combout => \inst1|Mux0~0_combout\);

\Sip_in[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sip_in(3),
	o => \Sip_in[3]~input_o\);

\inst7|sip_r[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Sip_in[3]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sip_r\(3));

\inst1|regs[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux12~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[1][3]~q\);

\inst1|regs[2][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux12~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[2][3]~q\);

\inst1|regs[3][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux12~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[3][3]~q\);

\inst1|Mux44~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux44~0_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[3][3]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[2][3]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[1][3]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[0][3]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][3]~q\,
	datab => \inst1|ALT_INV_regs[1][3]~q\,
	datac => \inst1|ALT_INV_regs[2][3]~q\,
	datad => \inst1|ALT_INV_regs[3][3]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux44~0_combout\);

\inst1|regs[4][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux12~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[4][3]~q\);

\inst1|regs[5][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux12~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[5][3]~q\);

\inst1|regs[6][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux12~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[6][3]~q\);

\inst1|regs[7][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux12~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[7][3]~q\);

\inst1|Mux44~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux44~1_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[7][3]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[6][3]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[5][3]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[4][3]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[4][3]~q\,
	datab => \inst1|ALT_INV_regs[5][3]~q\,
	datac => \inst1|ALT_INV_regs[6][3]~q\,
	datad => \inst1|ALT_INV_regs[7][3]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux44~1_combout\);

\inst1|regs[8][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux12~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[8][3]~q\);

\inst1|regs[9][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux12~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[9][3]~q\);

\inst1|regs[10][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux12~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[10][3]~q\);

\inst1|regs[11][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux12~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[11][3]~q\);

\inst1|Mux44~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux44~2_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[11][3]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[10][3]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[9][3]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[8][3]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[8][3]~q\,
	datab => \inst1|ALT_INV_regs[9][3]~q\,
	datac => \inst1|ALT_INV_regs[10][3]~q\,
	datad => \inst1|ALT_INV_regs[11][3]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux44~2_combout\);

\inst1|regs[12][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux12~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[12][3]~q\);

\inst1|regs[13][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux12~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[13][3]~q\);

\inst1|regs[14][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux12~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[14][3]~q\);

\inst1|regs[15][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux12~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[15][3]~q\);

\inst1|Mux44~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux44~3_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[15][3]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[14][3]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[13][3]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[12][3]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[12][3]~q\,
	datab => \inst1|ALT_INV_regs[13][3]~q\,
	datac => \inst1|ALT_INV_regs[14][3]~q\,
	datad => \inst1|ALT_INV_regs[15][3]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux44~3_combout\);

\inst1|Mux44~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux44~4_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|Mux44~3_combout\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|Mux44~2_combout\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( 
-- \inst1|Mux44~1_combout\ ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|Mux44~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux44~0_combout\,
	datab => \inst1|ALT_INV_Mux44~1_combout\,
	datac => \inst1|ALT_INV_Mux44~2_combout\,
	datad => \inst1|ALT_INV_Mux44~3_combout\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux44~4_combout\);

\inst1|regs[4][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux15~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[4][0]~q\);

\inst1|regs[8][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux15~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[8][0]~q\);

\inst1|regs[12][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux15~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[12][0]~q\);

\inst1|Mux47~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux47~0_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[12][0]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[8][0]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[4][0]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[0][0]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][0]~q\,
	datab => \inst1|ALT_INV_regs[4][0]~q\,
	datac => \inst1|ALT_INV_regs[8][0]~q\,
	datad => \inst1|ALT_INV_regs[12][0]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux47~0_combout\);

\inst1|regs[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux15~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[1][0]~q\);

\inst1|regs[5][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux15~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[5][0]~q\);

\inst1|regs[9][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux15~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[9][0]~q\);

\inst1|regs[13][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux15~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[13][0]~q\);

\inst1|Mux47~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux47~1_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[13][0]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[9][0]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[5][0]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[1][0]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[1][0]~q\,
	datab => \inst1|ALT_INV_regs[5][0]~q\,
	datac => \inst1|ALT_INV_regs[9][0]~q\,
	datad => \inst1|ALT_INV_regs[13][0]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux47~1_combout\);

\inst1|regs[2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux15~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[2][0]~q\);

\inst1|regs[6][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux15~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[6][0]~q\);

\inst1|regs[10][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux15~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[10][0]~q\);

\inst1|regs[14][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux15~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[14][0]~q\);

\inst1|Mux47~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux47~2_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[14][0]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[10][0]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[6][0]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[2][0]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[2][0]~q\,
	datab => \inst1|ALT_INV_regs[6][0]~q\,
	datac => \inst1|ALT_INV_regs[10][0]~q\,
	datad => \inst1|ALT_INV_regs[14][0]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux47~2_combout\);

\inst1|regs[3][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux15~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[3][0]~q\);

\inst1|regs[7][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux15~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[7][0]~q\);

\inst1|regs[11][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux15~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[11][0]~q\);

\inst1|regs[15][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux15~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[15][0]~q\);

\inst1|Mux47~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux47~3_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[15][0]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[11][0]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[7][0]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[3][0]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[3][0]~q\,
	datab => \inst1|ALT_INV_regs[7][0]~q\,
	datac => \inst1|ALT_INV_regs[11][0]~q\,
	datad => \inst1|ALT_INV_regs[15][0]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux47~3_combout\);

\inst1|Mux47~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux47~4_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|Mux47~3_combout\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|Mux47~2_combout\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( 
-- \inst1|Mux47~1_combout\ ) ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|Mux47~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux47~0_combout\,
	datab => \inst1|ALT_INV_Mux47~1_combout\,
	datac => \inst1|ALT_INV_Mux47~2_combout\,
	datad => \inst1|ALT_INV_Mux47~3_combout\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux47~4_combout\);

\inst1|regs[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux14~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[1][1]~q\);

\inst1|regs[2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux14~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[2][1]~q\);

\inst1|regs[3][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux14~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[3][1]~q\);

\inst1|Mux46~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux46~0_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[3][1]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[2][1]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[1][1]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[0][1]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][1]~q\,
	datab => \inst1|ALT_INV_regs[1][1]~q\,
	datac => \inst1|ALT_INV_regs[2][1]~q\,
	datad => \inst1|ALT_INV_regs[3][1]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux46~0_combout\);

\inst1|regs[4][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux14~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[4][1]~q\);

\inst1|regs[5][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux14~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[5][1]~q\);

\inst1|regs[6][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux14~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[6][1]~q\);

\inst1|regs[7][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux14~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[7][1]~q\);

\inst1|Mux46~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux46~1_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[7][1]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[6][1]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[5][1]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[4][1]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[4][1]~q\,
	datab => \inst1|ALT_INV_regs[5][1]~q\,
	datac => \inst1|ALT_INV_regs[6][1]~q\,
	datad => \inst1|ALT_INV_regs[7][1]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux46~1_combout\);

\inst1|regs[8][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux14~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[8][1]~q\);

\inst1|regs[9][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux14~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[9][1]~q\);

\inst1|regs[10][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux14~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[10][1]~q\);

\inst1|regs[11][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux14~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[11][1]~q\);

\inst1|Mux46~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux46~2_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[11][1]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[10][1]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[9][1]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[8][1]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[8][1]~q\,
	datab => \inst1|ALT_INV_regs[9][1]~q\,
	datac => \inst1|ALT_INV_regs[10][1]~q\,
	datad => \inst1|ALT_INV_regs[11][1]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux46~2_combout\);

\inst1|regs[12][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux14~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[12][1]~q\);

\inst1|regs[13][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux14~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[13][1]~q\);

\inst1|regs[14][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux14~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[14][1]~q\);

\inst1|regs[15][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux14~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[15][1]~q\);

\inst1|Mux46~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux46~3_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[15][1]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[14][1]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[13][1]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[12][1]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[12][1]~q\,
	datab => \inst1|ALT_INV_regs[13][1]~q\,
	datac => \inst1|ALT_INV_regs[14][1]~q\,
	datad => \inst1|ALT_INV_regs[15][1]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux46~3_combout\);

\inst1|Mux46~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux46~4_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|Mux46~3_combout\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|Mux46~2_combout\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( 
-- \inst1|Mux46~1_combout\ ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|Mux46~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux46~0_combout\,
	datab => \inst1|ALT_INV_Mux46~1_combout\,
	datac => \inst1|ALT_INV_Mux46~2_combout\,
	datad => \inst1|ALT_INV_Mux46~3_combout\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux46~4_combout\);

\inst1|regs[4][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux13~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[4][2]~q\);

\inst1|regs[8][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux13~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[8][2]~q\);

\inst1|regs[12][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux13~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[12][2]~q\);

\inst1|Mux45~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux45~0_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[12][2]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[8][2]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[4][2]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[0][2]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][2]~q\,
	datab => \inst1|ALT_INV_regs[4][2]~q\,
	datac => \inst1|ALT_INV_regs[8][2]~q\,
	datad => \inst1|ALT_INV_regs[12][2]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux45~0_combout\);

\inst1|regs[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux13~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[1][2]~q\);

\inst1|regs[5][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux13~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[5][2]~q\);

\inst1|regs[9][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux13~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[9][2]~q\);

\inst1|regs[13][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux13~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[13][2]~q\);

\inst1|Mux45~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux45~1_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[13][2]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[9][2]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[5][2]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[1][2]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[1][2]~q\,
	datab => \inst1|ALT_INV_regs[5][2]~q\,
	datac => \inst1|ALT_INV_regs[9][2]~q\,
	datad => \inst1|ALT_INV_regs[13][2]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux45~1_combout\);

\inst1|regs[2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux13~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[2][2]~q\);

\inst1|regs[6][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux13~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[6][2]~q\);

\inst1|regs[10][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux13~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[10][2]~q\);

\inst1|regs[14][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux13~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[14][2]~q\);

\inst1|Mux45~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux45~2_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[14][2]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[10][2]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[6][2]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[2][2]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[2][2]~q\,
	datab => \inst1|ALT_INV_regs[6][2]~q\,
	datac => \inst1|ALT_INV_regs[10][2]~q\,
	datad => \inst1|ALT_INV_regs[14][2]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux45~2_combout\);

\inst1|regs[3][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux13~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[3][2]~q\);

\inst1|regs[7][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux13~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[7][2]~q\);

\inst1|regs[11][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux13~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[11][2]~q\);

\inst1|regs[15][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux13~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[15][2]~q\);

\inst1|Mux45~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux45~3_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[15][2]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[11][2]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[7][2]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[3][2]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[3][2]~q\,
	datab => \inst1|ALT_INV_regs[7][2]~q\,
	datac => \inst1|ALT_INV_regs[11][2]~q\,
	datad => \inst1|ALT_INV_regs[15][2]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux45~3_combout\);

\inst1|Mux45~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux45~4_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|Mux45~3_combout\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|Mux45~2_combout\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( 
-- \inst1|Mux45~1_combout\ ) ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|Mux45~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux45~0_combout\,
	datab => \inst1|ALT_INV_Mux45~1_combout\,
	datac => \inst1|ALT_INV_Mux45~2_combout\,
	datad => \inst1|ALT_INV_Mux45~3_combout\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux45~4_combout\);

\inst3|memory_rtl_0|auto_generated|ram_block1a2\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000070",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_0|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 2,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_0|auto_generated|ram_block1a2_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a2_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a2_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_0|auto_generated|ram_block1a2_PORTBDATAOUT_bus\);

\inst6|temp_op[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(2));

\inst5|Mux1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux1~1_combout\ = ( \inst6|temp_opcode\(1) & ( \inst6|temp_opcode\(0) & ( (!\inst6|temp_AM\(1) & (\inst6|temp_AM\(0) & (!\inst6|temp_opcode\(3) & !\inst6|temp_opcode\(2)))) ) ) ) # ( \inst6|temp_opcode\(1) & ( !\inst6|temp_opcode\(0) & ( 
-- (!\inst6|temp_opcode\(3) & (!\inst6|temp_opcode\(2) & ((\inst6|temp_AM\(0)) # (\inst6|temp_AM\(1))))) ) ) ) # ( !\inst6|temp_opcode\(1) & ( !\inst6|temp_opcode\(0) & ( (\inst6|temp_AM\(0) & (((!\inst6|temp_AM\(1) & \inst6|temp_opcode\(2))) # 
-- (\inst6|temp_opcode\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100100011011100000000000000000000000000000010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst6|ALT_INV_temp_opcode\(3),
	datad => \inst6|ALT_INV_temp_opcode\(2),
	datae => \inst6|ALT_INV_temp_opcode\(1),
	dataf => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|Mux1~1_combout\);

\inst5|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux1~0_combout\ = ( !\inst6|temp_opcode\(0) & ( (\inst6|temp_AM\(0) & (\inst6|temp_opcode\(3) & (!\inst6|temp_opcode\(2) & !\inst6|temp_opcode\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000000000000000000000000000010000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(0),
	datab => \inst6|ALT_INV_temp_opcode\(3),
	datac => \inst6|ALT_INV_temp_opcode\(2),
	datad => \inst6|ALT_INV_temp_opcode\(1),
	datae => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|Mux1~0_combout\);

\inst5|Mux1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux1~2_combout\ = ( !\inst6|temp_opcode\(0) & ( (!\inst6|temp_AM\(1) & (\inst6|temp_AM\(0) & (\inst6|temp_opcode\(2) & !\inst6|temp_opcode\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000000000000000000000000000010000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst6|ALT_INV_temp_opcode\(2),
	datad => \inst6|ALT_INV_temp_opcode\(1),
	datae => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|Mux1~2_combout\);

\inst5|Mux1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux1~3_combout\ = (!\inst6|temp_AM\(1) & (\inst6|temp_AM\(0) & \inst5|dpcr_lsb_sel~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000010000000100000001000000010000000100000001000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst5|ALT_INV_dpcr_lsb_sel~0_combout\,
	combout => \inst5|Mux1~3_combout\);

\inst5|Op1_mux_select[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Op1_mux_select[0]~3_combout\ = ( !\inst6|temp_opcode\(4) & ( ((\inst5|state.T2~q\ & ((!\inst6|temp_opcode\(5) & (\inst5|Mux1~1_combout\)) # (\inst6|temp_opcode\(5) & ((\inst5|Mux1~3_combout\)))))) ) ) # ( \inst6|temp_opcode\(4) & ( 
-- ((\inst5|state.T2~q\ & (((!\inst6|temp_opcode\(5) & \inst5|Mux1~2_combout\)) # (\inst5|Mux1~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000000000000000000000000001000111010001110000111111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_Mux1~1_combout\,
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_Mux1~0_combout\,
	datad => \inst5|ALT_INV_Mux1~2_combout\,
	datae => \inst6|ALT_INV_temp_opcode\(4),
	dataf => \inst5|ALT_INV_state.T2~q\,
	datag => \inst5|ALT_INV_Mux1~3_combout\,
	combout => \inst5|Op1_mux_select[0]~3_combout\);

\inst5|Op1_mux_select[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Op1_mux_select[1]~0_combout\ = ( \inst6|temp_opcode\(1) & ( (!\inst6|temp_AM\(1) & (\inst6|temp_AM\(0) & (!\inst6|temp_opcode\(4) & !\inst6|temp_opcode\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001000000000000000000000000000000010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst6|ALT_INV_temp_opcode\(4),
	datad => \inst6|ALT_INV_temp_opcode\(2),
	datae => \inst6|ALT_INV_temp_opcode\(1),
	combout => \inst5|Op1_mux_select[1]~0_combout\);

\inst5|Op1_mux_select[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Op1_mux_select[1]~1_combout\ = ( \inst5|Mux1~3_combout\ & ( (!\inst6|temp_opcode\(4) & (((!\inst5|Mux1~2_combout\ & !\inst5|Op1_mux_select[1]~0_combout\)) # (\inst6|temp_opcode\(3)))) ) ) # ( !\inst5|Mux1~3_combout\ & ( (!\inst6|temp_opcode\(3) & 
-- (((!\inst5|Mux1~2_combout\ & !\inst5|Op1_mux_select[1]~0_combout\)))) # (\inst6|temp_opcode\(3) & ((!\inst6|temp_opcode\(4)) # ((!\inst5|Mux1~2_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111001000110010101000100010001011110010001100101010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(4),
	datab => \inst6|ALT_INV_temp_opcode\(3),
	datac => \inst5|ALT_INV_Mux1~2_combout\,
	datad => \inst5|ALT_INV_Op1_mux_select[1]~0_combout\,
	datae => \inst5|ALT_INV_Mux1~3_combout\,
	combout => \inst5|Op1_mux_select[1]~1_combout\);

\inst5|Op1_mux_select[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Op1_mux_select[1]~2_combout\ = ( \inst5|Op1_mux_select[1]~1_combout\ & ( (!\inst6|temp_opcode\(4) & (\inst6|temp_opcode\(5) & (\inst5|state.T2~q\ & \inst5|Mux1~0_combout\))) ) ) # ( !\inst5|Op1_mux_select[1]~1_combout\ & ( (\inst5|state.T2~q\ & 
-- ((!\inst6|temp_opcode\(5)) # ((!\inst6|temp_opcode\(4) & \inst5|Mux1~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001110000000000000001000001100000011100000000000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(4),
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_state.T2~q\,
	datad => \inst5|ALT_INV_Mux1~0_combout\,
	datae => \inst5|ALT_INV_Op1_mux_select[1]~1_combout\,
	combout => \inst5|Op1_mux_select[1]~2_combout\);

\inst2|OP1_Mux|Mux13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|OP1_Mux|Mux13~0_combout\ = ( \inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst6|temp_op\(2) ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux45~4_combout\ ) ) ) 
-- # ( \inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux29~4_combout\ ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst|pc_counter\(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(2),
	datab => \inst1|ALT_INV_Mux29~4_combout\,
	datac => \inst1|ALT_INV_Mux45~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(2),
	datae => \inst5|ALT_INV_Op1_mux_select[0]~3_combout\,
	dataf => \inst5|ALT_INV_Op1_mux_select[1]~2_combout\,
	combout => \inst2|OP1_Mux|Mux13~0_combout\);

\inst5|Op1_write~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Op1_write~0_combout\ = ( !\inst6|temp_opcode\(1) & ( \inst6|temp_opcode\(0) & ( (\inst6|temp_AM\(1) & (!\inst6|temp_AM\(0) & (\inst6|temp_opcode\(3) & \inst6|temp_opcode\(2)))) ) ) ) # ( !\inst6|temp_opcode\(1) & ( !\inst6|temp_opcode\(0) & ( 
-- (\inst6|temp_AM\(0) & ((!\inst6|temp_opcode\(2) & ((\inst6|temp_opcode\(3)))) # (\inst6|temp_opcode\(2) & (!\inst6|temp_AM\(1))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100100010000000000000000000000000000001000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst6|ALT_INV_temp_opcode\(3),
	datad => \inst6|ALT_INV_temp_opcode\(2),
	datae => \inst6|ALT_INV_temp_opcode\(1),
	dataf => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|Op1_write~0_combout\);

\inst5|Op1_write~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Op1_write~1_combout\ = ( \inst5|Mux1~1_combout\ & ( \inst5|Op1_write~0_combout\ & ( (\inst5|state.T2~q\ & ((!\inst6|temp_opcode\(5)) # (\inst5|Mux1~0_combout\))) ) ) ) # ( !\inst5|Mux1~1_combout\ & ( \inst5|Op1_write~0_combout\ & ( 
-- (\inst5|state.T2~q\ & ((!\inst6|temp_opcode\(5) & (\inst6|temp_opcode\(4))) # (\inst6|temp_opcode\(5) & ((\inst5|Mux1~0_combout\))))) ) ) ) # ( \inst5|Mux1~1_combout\ & ( !\inst5|Op1_write~0_combout\ & ( (\inst5|state.T2~q\ & ((!\inst6|temp_opcode\(5) & 
-- (!\inst6|temp_opcode\(4))) # (\inst6|temp_opcode\(5) & ((\inst5|Mux1~0_combout\))))) ) ) ) # ( !\inst5|Mux1~1_combout\ & ( !\inst5|Op1_write~0_combout\ & ( (\inst6|temp_opcode\(5) & (\inst5|state.T2~q\ & \inst5|Mux1~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000011000010000000101100000100000001110000110000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(4),
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_state.T2~q\,
	datad => \inst5|ALT_INV_Mux1~0_combout\,
	datae => \inst5|ALT_INV_Mux1~1_combout\,
	dataf => \inst5|ALT_INV_Op1_write~0_combout\,
	combout => \inst5|Op1_write~1_combout\);

\inst2|temp_op1_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|OP1_Mux|Mux13~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op1_write~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|temp_op1_out\(2));

\inst15|Add0~66\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Add0~66_cout\ = CARRY(( (!\inst6|temp_opcode\(5) & (\inst5|state.T3~q\ & \inst5|Mux14~1_combout\)) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_state.T3~q\,
	datad => \inst5|ALT_INV_Mux14~1_combout\,
	cin => GND,
	cout => \inst15|Add0~66_cout\);

\inst15|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Add0~61_sumout\ = SUM(( !\inst2|temp_op1_out\(0) $ ((((!\inst5|state.T3~q\) # (!\inst5|Mux14~1_combout\)) # (\inst6|temp_opcode\(5)))) ) + ( \inst4|temp_op2_out\(0) ) + ( \inst15|Add0~66_cout\ ))
-- \inst15|Add0~62\ = CARRY(( !\inst2|temp_op1_out\(0) $ ((((!\inst5|state.T3~q\) # (!\inst5|Mux14~1_combout\)) # (\inst6|temp_opcode\(5)))) ) + ( \inst4|temp_op2_out\(0) ) + ( \inst15|Add0~66_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000101010101011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|ALT_INV_temp_op1_out\(0),
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_state.T3~q\,
	datad => \inst5|ALT_INV_Mux14~1_combout\,
	dataf => \inst4|ALT_INV_temp_op2_out\(0),
	cin => \inst15|Add0~66_cout\,
	sumout => \inst15|Add0~61_sumout\,
	cout => \inst15|Add0~62\);

\inst15|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Add0~57_sumout\ = SUM(( !\inst2|temp_op1_out\(1) $ (((!\inst5|Mux14~1_combout\) # ((!\inst5|state.T3~q\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(1) ) + ( \inst15|Add0~62\ ))
-- \inst15|Add0~58\ = CARRY(( !\inst2|temp_op1_out\(1) $ (((!\inst5|Mux14~1_combout\) # ((!\inst5|state.T3~q\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(1) ) + ( \inst15|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000010011111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_Mux14~1_combout\,
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_state.T3~q\,
	datad => \inst2|ALT_INV_temp_op1_out\(1),
	dataf => \inst4|ALT_INV_temp_op2_out\(1),
	cin => \inst15|Add0~62\,
	sumout => \inst15|Add0~57_sumout\,
	cout => \inst15|Add0~58\);

\inst15|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Add0~53_sumout\ = SUM(( !\inst2|temp_op1_out\(2) $ (((!\inst5|Mux14~1_combout\) # ((!\inst5|state.T3~q\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(2) ) + ( \inst15|Add0~58\ ))
-- \inst15|Add0~54\ = CARRY(( !\inst2|temp_op1_out\(2) $ (((!\inst5|Mux14~1_combout\) # ((!\inst5|state.T3~q\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(2) ) + ( \inst15|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000010011111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_Mux14~1_combout\,
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_state.T3~q\,
	datad => \inst2|ALT_INV_temp_op1_out\(2),
	dataf => \inst4|ALT_INV_temp_op2_out\(2),
	cin => \inst15|Add0~58\,
	sumout => \inst15|Add0~53_sumout\,
	cout => \inst15|Add0~54\);

\inst5|Mux14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux14~0_combout\ = ( \inst6|temp_opcode\(2) & ( \inst6|temp_opcode\(3) & ( (!\inst6|temp_opcode\(4) & (!\inst6|temp_opcode\(5) & (!\inst6|temp_opcode\(0) & !\inst6|temp_opcode\(1)))) ) ) ) # ( \inst6|temp_opcode\(2) & ( !\inst6|temp_opcode\(3) & ( 
-- (!\inst6|temp_opcode\(4) & (!\inst6|temp_opcode\(5) & (!\inst6|temp_opcode\(0) & !\inst6|temp_opcode\(1)))) ) ) ) # ( !\inst6|temp_opcode\(2) & ( !\inst6|temp_opcode\(3) & ( (!\inst6|temp_opcode\(4) & (!\inst6|temp_opcode\(5) & (\inst6|temp_opcode\(0) & 
-- \inst6|temp_opcode\(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001000100000000000000000000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(4),
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst6|ALT_INV_temp_opcode\(0),
	datad => \inst6|ALT_INV_temp_opcode\(1),
	datae => \inst6|ALT_INV_temp_opcode\(2),
	dataf => \inst6|ALT_INV_temp_opcode\(3),
	combout => \inst5|Mux14~0_combout\);

\inst15|Mux13~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux13~1_combout\ = ( \inst4|temp_op2_out\(2) & ( (\inst5|state.T3~q\ & (\inst5|Mux13~1_combout\ & ((\inst2|temp_op1_out\(2)) # (\inst5|Mux14~0_combout\)))) ) ) # ( !\inst4|temp_op2_out\(2) & ( (\inst5|state.T3~q\ & (\inst5|Mux13~1_combout\ & 
-- (\inst5|Mux14~0_combout\ & \inst2|temp_op1_out\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000010001000100000000000000010000000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_Mux13~1_combout\,
	datac => \inst5|ALT_INV_Mux14~0_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(2),
	datae => \inst4|ALT_INV_temp_op2_out\(2),
	combout => \inst15|Mux13~1_combout\);

\inst15|Mux13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux13~0_combout\ = ( \inst5|Mux12~0_combout\ & ( \inst15|Mux13~1_combout\ ) ) # ( !\inst5|Mux12~0_combout\ & ( \inst15|Mux13~1_combout\ & ( (!\inst15|Mux13~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~53_sumout\)))) # 
-- (\inst15|Mux13~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~53_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( \inst5|Mux12~0_combout\ & ( !\inst15|Mux13~1_combout\ & ( (!\inst15|Mux13~0_combout\ & (((\inst15|Mux0~0_combout\ & 
-- \inst15|Add0~53_sumout\)))) # (\inst15|Mux13~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~53_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( !\inst5|Mux12~0_combout\ & ( !\inst15|Mux13~1_combout\ & ( (!\inst15|Mux13~0_combout\ & 
-- (((\inst15|Mux0~0_combout\ & \inst15|Add0~53_sumout\)))) # (\inst15|Mux13~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~53_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011111000100010001111100010001000111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux13~0_combout\,
	datab => \inst15|ALT_INV_Mux15~0_combout\,
	datac => \inst15|ALT_INV_Mux0~0_combout\,
	datad => \inst15|ALT_INV_Add0~53_sumout\,
	datae => \inst5|ALT_INV_Mux12~0_combout\,
	dataf => \inst15|ALT_INV_Mux13~1_combout\,
	combout => \inst15|Mux13~0_combout\);

\Sip_in[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sip_in(2),
	o => \Sip_in[2]~input_o\);

\inst7|sip_r[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Sip_in[2]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sip_r\(2));

\inst3|memory_rtl_1|auto_generated|ram_block1a2\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000070",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_1|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 2,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_1|auto_generated|ram_block1a2_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a2_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a2_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_1|auto_generated|ram_block1a2_PORTBDATAOUT_bus\);

\inst1|Mux0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux0~1_combout\ = (\inst5|ld_r~0_combout\ & (!\inst5|Mux16~3_combout\ & \inst5|Mux17~1_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000100000001000000010000000100000001000000010000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~0_combout\,
	datab => \inst5|ALT_INV_Mux16~3_combout\,
	datac => \inst5|ALT_INV_Mux17~1_combout\,
	combout => \inst1|Mux0~1_combout\);

\inst1|Mux13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux13~0_combout\ = (!\inst4|temp_op2_out\(2) & (\inst3|memory_rtl_1|auto_generated|ram_block1a2~portbdataout\ & ((\inst1|Mux0~1_combout\)))) # (\inst4|temp_op2_out\(2) & ((!\inst1|Mux1~1_combout\) # 
-- ((\inst3|memory_rtl_1|auto_generated|ram_block1a2~portbdataout\ & \inst1|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001110011010100000111001101010000011100110101000001110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(2),
	datab => \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a2~portbdataout\,
	datac => \inst1|ALT_INV_Mux1~1_combout\,
	datad => \inst1|ALT_INV_Mux0~1_combout\,
	combout => \inst1|Mux13~0_combout\);

\inst1|Mux13~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux13~1_combout\ = ( \inst1|Mux13~0_combout\ ) # ( !\inst1|Mux13~0_combout\ & ( (\inst1|Mux0~0_combout\ & ((!\inst1|Mux1~0_combout\ & (\inst15|Mux13~0_combout\)) # (\inst1|Mux1~0_combout\ & ((\inst7|sip_r\(2)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000111111111111111111100000100000001111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux13~0_combout\,
	datab => \inst1|ALT_INV_Mux1~0_combout\,
	datac => \inst1|ALT_INV_Mux0~0_combout\,
	datad => \inst7|ALT_INV_sip_r\(2),
	datae => \inst1|ALT_INV_Mux13~0_combout\,
	combout => \inst1|Mux13~1_combout\);

\inst1|Decoder0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Decoder0~0_combout\ = ( !\inst6|temp_rz\(3) & ( (\inst5|ld_r~1_combout\ & (!\inst6|temp_rz\(0) & (!\inst6|temp_rz\(1) & !\inst6|temp_rz\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000000000000000000000001000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~1_combout\,
	datab => \inst6|ALT_INV_temp_rz\(0),
	datac => \inst6|ALT_INV_temp_rz\(1),
	datad => \inst6|ALT_INV_temp_rz\(2),
	datae => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Decoder0~0_combout\);

\inst1|regs[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux13~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[0][2]~q\);

\inst6|temp_AM[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|temp_AM[1]~0_combout\ = (\inst5|state.T1~q\ & ((!\inst5|state.T1_1~q\) # (!\inst6|temp_AM\(1) $ (\inst6|temp_AM\(0)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111001000000001111100100000000111110010000000011111001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst5|ALT_INV_state.T1_1~q\,
	datad => \inst5|ALT_INV_state.T1~q\,
	combout => \inst6|temp_AM[1]~0_combout\);

\inst6|temp_rx[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a2~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_rx\(2));

\inst6|temp_rx[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_rx\(3));

\inst1|Mux29~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux29~0_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[12][2]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[8][2]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[4][2]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[0][2]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][2]~q\,
	datab => \inst1|ALT_INV_regs[4][2]~q\,
	datac => \inst1|ALT_INV_regs[8][2]~q\,
	datad => \inst1|ALT_INV_regs[12][2]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux29~0_combout\);

\inst1|Mux29~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux29~1_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[13][2]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[9][2]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[5][2]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[1][2]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[1][2]~q\,
	datab => \inst1|ALT_INV_regs[5][2]~q\,
	datac => \inst1|ALT_INV_regs[9][2]~q\,
	datad => \inst1|ALT_INV_regs[13][2]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux29~1_combout\);

\inst1|Mux29~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux29~2_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[14][2]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[10][2]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[6][2]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[2][2]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[2][2]~q\,
	datab => \inst1|ALT_INV_regs[6][2]~q\,
	datac => \inst1|ALT_INV_regs[10][2]~q\,
	datad => \inst1|ALT_INV_regs[14][2]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux29~2_combout\);

\inst1|Mux29~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux29~3_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[15][2]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[11][2]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[7][2]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[3][2]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[3][2]~q\,
	datab => \inst1|ALT_INV_regs[7][2]~q\,
	datac => \inst1|ALT_INV_regs[11][2]~q\,
	datad => \inst1|ALT_INV_regs[15][2]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux29~3_combout\);

\inst6|temp_rx[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_rx\(0));

\inst6|temp_rx[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_rx\(1));

\inst1|Mux29~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux29~4_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|Mux29~3_combout\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|Mux29~2_combout\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( 
-- \inst1|Mux29~1_combout\ ) ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|Mux29~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux29~0_combout\,
	datab => \inst1|ALT_INV_Mux29~1_combout\,
	datac => \inst1|ALT_INV_Mux29~2_combout\,
	datad => \inst1|ALT_INV_Mux29~3_combout\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux29~4_combout\);

\inst5|Mux1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux1~9_combout\ = (\inst6|temp_AM\(0) & (\inst6|temp_opcode\(3) & (!\inst6|temp_opcode\(2) & !\inst6|temp_opcode\(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000000000000100000000000000010000000000000001000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(0),
	datab => \inst6|ALT_INV_temp_opcode\(3),
	datac => \inst6|ALT_INV_temp_opcode\(2),
	datad => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|Mux1~9_combout\);

\inst5|Mux1~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux1~10_combout\ = (\inst5|Mux1~9_combout\ & (!\inst6|temp_AM\(1) $ (\inst6|temp_opcode\(1))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100100001001000010010000100100001001000010010000100100001001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_opcode\(1),
	datac => \inst5|ALT_INV_Mux1~9_combout\,
	combout => \inst5|Mux1~10_combout\);

\inst5|Mux1~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux1~4_combout\ = ( !\inst6|temp_opcode\(1) & ( \inst6|temp_opcode\(0) & ( (\inst6|temp_AM\(1) & (!\inst6|temp_AM\(0) & (\inst6|temp_opcode\(3) & \inst6|temp_opcode\(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000001000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst6|ALT_INV_temp_opcode\(3),
	datad => \inst6|ALT_INV_temp_opcode\(2),
	datae => \inst6|ALT_INV_temp_opcode\(1),
	dataf => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|Mux1~4_combout\);

\inst5|Mux1~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux1~8_combout\ = ( \inst6|temp_opcode\(1) & ( !\inst6|temp_opcode\(0) & ( (\inst6|temp_AM\(1) & (!\inst6|temp_AM\(0) & (!\inst6|temp_opcode\(3) & !\inst6|temp_opcode\(2)))) ) ) ) # ( !\inst6|temp_opcode\(1) & ( !\inst6|temp_opcode\(0) & ( 
-- (!\inst6|temp_AM\(1) & (\inst6|temp_AM\(0) & ((!\inst6|temp_opcode\(2)) # (\inst6|temp_opcode\(3))))) # (\inst6|temp_AM\(1) & (((!\inst6|temp_opcode\(3) & !\inst6|temp_opcode\(2))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111001000000010010000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst6|ALT_INV_temp_opcode\(3),
	datad => \inst6|ALT_INV_temp_opcode\(2),
	datae => \inst6|ALT_INV_temp_opcode\(1),
	dataf => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|Mux1~8_combout\);

\inst5|Op2_mux_select[0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Op2_mux_select[0]~2_combout\ = ( !\inst6|temp_opcode\(5) & ( ((\inst5|state.T2~q\ & ((!\inst6|temp_opcode\(4) & (\inst5|Mux1~8_combout\)) # (\inst6|temp_opcode\(4) & ((\inst5|Mux1~4_combout\)))))) ) ) # ( \inst6|temp_opcode\(5) & ( 
-- ((\inst5|state.T2~q\ & ((!\inst6|temp_opcode\(4) & ((\inst5|Mux1~0_combout\))) # (\inst6|temp_opcode\(4) & (\inst5|Mux1~10_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000000000000000000000000000001010010111110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(4),
	datab => \inst5|ALT_INV_Mux1~10_combout\,
	datac => \inst5|ALT_INV_Mux1~0_combout\,
	datad => \inst5|ALT_INV_Mux1~4_combout\,
	datae => \inst6|ALT_INV_temp_opcode\(5),
	dataf => \inst5|ALT_INV_state.T2~q\,
	datag => \inst5|ALT_INV_Mux1~8_combout\,
	combout => \inst5|Op2_mux_select[0]~2_combout\);

\inst5|Mux1~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux1~6_combout\ = ( !\inst6|temp_opcode\(1) & ( \inst6|temp_opcode\(0) & ( (\inst6|temp_AM\(1) & (!\inst6|temp_AM\(0) & (\inst6|temp_opcode\(3) & \inst6|temp_opcode\(2)))) ) ) ) # ( !\inst6|temp_opcode\(1) & ( !\inst6|temp_opcode\(0) & ( 
-- (!\inst6|temp_AM\(1) & (\inst6|temp_AM\(0) & (\inst6|temp_opcode\(3) & \inst6|temp_opcode\(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000010000000000000000000000000000001000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst6|ALT_INV_temp_opcode\(3),
	datad => \inst6|ALT_INV_temp_opcode\(2),
	datae => \inst6|ALT_INV_temp_opcode\(1),
	dataf => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|Mux1~6_combout\);

\inst5|Op2_mux_select[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Op2_mux_select[1]~0_combout\ = ( \inst6|temp_opcode\(1) & ( \inst6|temp_opcode\(0) & ( (!\inst6|temp_AM\(1) & (\inst6|temp_AM\(0) & (!\inst6|temp_opcode\(3) & !\inst6|temp_opcode\(2)))) ) ) ) # ( \inst6|temp_opcode\(1) & ( !\inst6|temp_opcode\(0) & 
-- ( (!\inst6|temp_opcode\(3) & (!\inst6|temp_opcode\(2) & ((\inst6|temp_AM\(0)) # (\inst6|temp_AM\(1))))) ) ) ) # ( !\inst6|temp_opcode\(1) & ( !\inst6|temp_opcode\(0) & ( (!\inst6|temp_AM\(1) & (\inst6|temp_AM\(0))) # (\inst6|temp_AM\(1) & 
-- ((!\inst6|temp_AM\(0) & (!\inst6|temp_opcode\(3) & !\inst6|temp_opcode\(2))) # (\inst6|temp_AM\(0) & (\inst6|temp_opcode\(3))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110001100100011011100000000000000000000000000000010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst6|ALT_INV_temp_opcode\(3),
	datad => \inst6|ALT_INV_temp_opcode\(2),
	datae => \inst6|ALT_INV_temp_opcode\(1),
	dataf => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|Op2_mux_select[1]~0_combout\);

\inst5|Op2_mux_select[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Op2_mux_select[1]~1_combout\ = ( \inst5|Mux1~6_combout\ & ( \inst5|Op2_mux_select[1]~0_combout\ & ( (\inst5|state.T2~q\ & ((!\inst6|temp_opcode\(5)) # ((\inst6|temp_opcode\(4) & \inst5|Mux1~0_combout\)))) ) ) ) # ( !\inst5|Mux1~6_combout\ & ( 
-- \inst5|Op2_mux_select[1]~0_combout\ & ( (\inst5|state.T2~q\ & ((!\inst6|temp_opcode\(4) & (!\inst6|temp_opcode\(5))) # (\inst6|temp_opcode\(4) & (\inst6|temp_opcode\(5) & \inst5|Mux1~0_combout\)))) ) ) ) # ( \inst5|Mux1~6_combout\ & ( 
-- !\inst5|Op2_mux_select[1]~0_combout\ & ( (\inst6|temp_opcode\(4) & (\inst5|state.T2~q\ & ((!\inst6|temp_opcode\(5)) # (\inst5|Mux1~0_combout\)))) ) ) ) # ( !\inst5|Mux1~6_combout\ & ( !\inst5|Op2_mux_select[1]~0_combout\ & ( (\inst6|temp_opcode\(4) & 
-- (\inst6|temp_opcode\(5) & (\inst5|state.T2~q\ & \inst5|Mux1~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000001000000010100001000000010010000110000001101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(4),
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_state.T2~q\,
	datad => \inst5|ALT_INV_Mux1~0_combout\,
	datae => \inst5|ALT_INV_Mux1~6_combout\,
	dataf => \inst5|ALT_INV_Op2_mux_select[1]~0_combout\,
	combout => \inst5|Op2_mux_select[1]~1_combout\);

\inst4|OP2_Mux|Mux13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4|OP2_Mux|Mux13~0_combout\ = ( \inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst6|temp_op\(2) ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux45~4_combout\ ) ) ) 
-- # ( \inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux29~4_combout\ ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst|pc_counter\(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(2),
	datab => \inst1|ALT_INV_Mux29~4_combout\,
	datac => \inst1|ALT_INV_Mux45~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(2),
	datae => \inst5|ALT_INV_Op2_mux_select[0]~2_combout\,
	dataf => \inst5|ALT_INV_Op2_mux_select[1]~1_combout\,
	combout => \inst4|OP2_Mux|Mux13~0_combout\);

\inst5|Mux1~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux1~7_combout\ = ( \inst6|temp_opcode\(1) & ( !\inst6|temp_opcode\(0) & ( (\inst6|temp_AM\(1) & (\inst6|temp_AM\(0) & (\inst6|temp_opcode\(3) & !\inst6|temp_opcode\(2)))) ) ) ) # ( !\inst6|temp_opcode\(1) & ( !\inst6|temp_opcode\(0) & ( 
-- (\inst6|temp_AM\(0) & (\inst6|temp_opcode\(3) & !\inst6|temp_opcode\(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000000000000010000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst6|ALT_INV_temp_opcode\(3),
	datad => \inst6|ALT_INV_temp_opcode\(2),
	datae => \inst6|ALT_INV_temp_opcode\(1),
	dataf => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|Mux1~7_combout\);

\inst5|Mux1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux1~5_combout\ = ( \inst6|temp_opcode\(1) & ( \inst6|temp_opcode\(0) & ( (!\inst6|temp_AM\(1) & (\inst6|temp_AM\(0) & (!\inst6|temp_opcode\(3) & !\inst6|temp_opcode\(2)))) ) ) ) # ( \inst6|temp_opcode\(1) & ( !\inst6|temp_opcode\(0) & ( 
-- (!\inst6|temp_opcode\(3) & (!\inst6|temp_opcode\(2) & ((\inst6|temp_AM\(0)) # (\inst6|temp_AM\(1))))) ) ) ) # ( !\inst6|temp_opcode\(1) & ( !\inst6|temp_opcode\(0) & ( (!\inst6|temp_AM\(1) & (\inst6|temp_AM\(0))) # (\inst6|temp_AM\(1) & 
-- ((!\inst6|temp_opcode\(3) & ((!\inst6|temp_opcode\(2)))) # (\inst6|temp_opcode\(3) & (\inst6|temp_AM\(0))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111001100100011011100000000000000000000000000000010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst6|ALT_INV_temp_opcode\(3),
	datad => \inst6|ALT_INV_temp_opcode\(2),
	datae => \inst6|ALT_INV_temp_opcode\(1),
	dataf => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|Mux1~5_combout\);

\inst5|Op2_write~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Op2_write~0_combout\ = ( !\inst6|temp_opcode\(5) & ( ((\inst5|state.T2~q\ & ((!\inst6|temp_opcode\(4) & (\inst5|Mux1~5_combout\)) # (\inst6|temp_opcode\(4) & ((\inst5|Mux1~6_combout\)))))) ) ) # ( \inst6|temp_opcode\(5) & ( ((\inst5|state.T2~q\ & 
-- ((!\inst6|temp_opcode\(4) & ((\inst5|Mux1~0_combout\))) # (\inst6|temp_opcode\(4) & (\inst5|Mux1~7_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000000000000000000000000000001010010111110001101100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(4),
	datab => \inst5|ALT_INV_Mux1~7_combout\,
	datac => \inst5|ALT_INV_Mux1~0_combout\,
	datad => \inst5|ALT_INV_Mux1~6_combout\,
	datae => \inst6|ALT_INV_temp_opcode\(5),
	dataf => \inst5|ALT_INV_state.T2~q\,
	datag => \inst5|ALT_INV_Mux1~5_combout\,
	combout => \inst5|Op2_write~0_combout\);

\inst4|temp_op2_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|OP2_Mux|Mux13~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op2_write~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|temp_op2_out\(2));

\inst3|memory_rtl_0|auto_generated|ram_block1a1\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "00000060",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_0|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 1,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_0|auto_generated|ram_block1a1_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a1_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a1_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_0|auto_generated|ram_block1a1_PORTBDATAOUT_bus\);

\inst6|temp_op[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a1~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(1));

\inst2|OP1_Mux|Mux14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|OP1_Mux|Mux14~0_combout\ = ( \inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst6|temp_op\(1) ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux46~4_combout\ ) ) ) 
-- # ( \inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux30~4_combout\ ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst|pc_counter\(1) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(1),
	datab => \inst1|ALT_INV_Mux30~4_combout\,
	datac => \inst1|ALT_INV_Mux46~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(1),
	datae => \inst5|ALT_INV_Op1_mux_select[0]~3_combout\,
	dataf => \inst5|ALT_INV_Op1_mux_select[1]~2_combout\,
	combout => \inst2|OP1_Mux|Mux14~0_combout\);

\inst2|temp_op1_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|OP1_Mux|Mux14~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op1_write~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|temp_op1_out\(1));

\inst15|Mux14~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux14~1_combout\ = ( \inst4|temp_op2_out\(1) & ( (\inst5|state.T3~q\ & (\inst5|Mux13~1_combout\ & ((\inst2|temp_op1_out\(1)) # (\inst5|Mux14~0_combout\)))) ) ) # ( !\inst4|temp_op2_out\(1) & ( (\inst5|state.T3~q\ & (\inst5|Mux13~1_combout\ & 
-- (\inst5|Mux14~0_combout\ & \inst2|temp_op1_out\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000010001000100000000000000010000000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_Mux13~1_combout\,
	datac => \inst5|ALT_INV_Mux14~0_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(1),
	datae => \inst4|ALT_INV_temp_op2_out\(1),
	combout => \inst15|Mux14~1_combout\);

\inst15|Mux14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux14~0_combout\ = ( \inst5|Mux12~0_combout\ & ( \inst15|Mux14~1_combout\ ) ) # ( !\inst5|Mux12~0_combout\ & ( \inst15|Mux14~1_combout\ & ( (!\inst15|Mux14~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~57_sumout\)))) # 
-- (\inst15|Mux14~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~57_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( \inst5|Mux12~0_combout\ & ( !\inst15|Mux14~1_combout\ & ( (!\inst15|Mux14~0_combout\ & (((\inst15|Mux0~0_combout\ & 
-- \inst15|Add0~57_sumout\)))) # (\inst15|Mux14~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~57_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( !\inst5|Mux12~0_combout\ & ( !\inst15|Mux14~1_combout\ & ( (!\inst15|Mux14~0_combout\ & 
-- (((\inst15|Mux0~0_combout\ & \inst15|Add0~57_sumout\)))) # (\inst15|Mux14~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~57_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011111000100010001111100010001000111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux14~0_combout\,
	datab => \inst15|ALT_INV_Mux15~0_combout\,
	datac => \inst15|ALT_INV_Mux0~0_combout\,
	datad => \inst15|ALT_INV_Add0~57_sumout\,
	datae => \inst5|ALT_INV_Mux12~0_combout\,
	dataf => \inst15|ALT_INV_Mux14~1_combout\,
	combout => \inst15|Mux14~0_combout\);

\Sip_in[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sip_in(1),
	o => \Sip_in[1]~input_o\);

\inst7|sip_r[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Sip_in[1]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sip_r\(1));

\inst3|memory_rtl_1|auto_generated|ram_block1a1\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "00000060",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_1|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 1,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_1|auto_generated|ram_block1a1_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a1_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a1_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_1|auto_generated|ram_block1a1_PORTBDATAOUT_bus\);

\inst1|Mux14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux14~0_combout\ = (!\inst4|temp_op2_out\(1) & (\inst3|memory_rtl_1|auto_generated|ram_block1a1~portbdataout\ & ((\inst1|Mux0~1_combout\)))) # (\inst4|temp_op2_out\(1) & ((!\inst1|Mux1~1_combout\) # 
-- ((\inst3|memory_rtl_1|auto_generated|ram_block1a1~portbdataout\ & \inst1|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001110011010100000111001101010000011100110101000001110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(1),
	datab => \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a1~portbdataout\,
	datac => \inst1|ALT_INV_Mux1~1_combout\,
	datad => \inst1|ALT_INV_Mux0~1_combout\,
	combout => \inst1|Mux14~0_combout\);

\inst1|Mux14~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux14~1_combout\ = ( \inst1|Mux14~0_combout\ ) # ( !\inst1|Mux14~0_combout\ & ( (\inst1|Mux0~0_combout\ & ((!\inst1|Mux1~0_combout\ & (\inst15|Mux14~0_combout\)) # (\inst1|Mux1~0_combout\ & ((\inst7|sip_r\(1)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000111111111111111111100000100000001111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux14~0_combout\,
	datab => \inst1|ALT_INV_Mux1~0_combout\,
	datac => \inst1|ALT_INV_Mux0~0_combout\,
	datad => \inst7|ALT_INV_sip_r\(1),
	datae => \inst1|ALT_INV_Mux14~0_combout\,
	combout => \inst1|Mux14~1_combout\);

\inst1|regs[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux14~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[0][1]~q\);

\inst1|Mux30~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux30~0_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[3][1]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[2][1]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[1][1]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[0][1]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][1]~q\,
	datab => \inst1|ALT_INV_regs[1][1]~q\,
	datac => \inst1|ALT_INV_regs[2][1]~q\,
	datad => \inst1|ALT_INV_regs[3][1]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux30~0_combout\);

\inst1|Mux30~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux30~1_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[7][1]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[6][1]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[5][1]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[4][1]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[4][1]~q\,
	datab => \inst1|ALT_INV_regs[5][1]~q\,
	datac => \inst1|ALT_INV_regs[6][1]~q\,
	datad => \inst1|ALT_INV_regs[7][1]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux30~1_combout\);

\inst1|Mux30~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux30~2_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[11][1]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[10][1]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[9][1]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[8][1]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[8][1]~q\,
	datab => \inst1|ALT_INV_regs[9][1]~q\,
	datac => \inst1|ALT_INV_regs[10][1]~q\,
	datad => \inst1|ALT_INV_regs[11][1]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux30~2_combout\);

\inst1|Mux30~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux30~3_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[15][1]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[14][1]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[13][1]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[12][1]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[12][1]~q\,
	datab => \inst1|ALT_INV_regs[13][1]~q\,
	datac => \inst1|ALT_INV_regs[14][1]~q\,
	datad => \inst1|ALT_INV_regs[15][1]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux30~3_combout\);

\inst1|Mux30~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux30~4_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|Mux30~3_combout\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|Mux30~2_combout\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( 
-- \inst1|Mux30~1_combout\ ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|Mux30~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux30~0_combout\,
	datab => \inst1|ALT_INV_Mux30~1_combout\,
	datac => \inst1|ALT_INV_Mux30~2_combout\,
	datad => \inst1|ALT_INV_Mux30~3_combout\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux30~4_combout\);

\inst4|OP2_Mux|Mux14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4|OP2_Mux|Mux14~0_combout\ = ( \inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst6|temp_op\(1) ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux46~4_combout\ ) ) ) 
-- # ( \inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux30~4_combout\ ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst|pc_counter\(1) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(1),
	datab => \inst1|ALT_INV_Mux30~4_combout\,
	datac => \inst1|ALT_INV_Mux46~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(1),
	datae => \inst5|ALT_INV_Op2_mux_select[0]~2_combout\,
	dataf => \inst5|ALT_INV_Op2_mux_select[1]~1_combout\,
	combout => \inst4|OP2_Mux|Mux14~0_combout\);

\inst4|temp_op2_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|OP2_Mux|Mux14~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op2_write~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|temp_op2_out\(1));

\inst3|memory_rtl_0|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000030",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_0|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

\inst6|temp_op[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(0));

\inst4|OP2_Mux|Mux15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4|OP2_Mux|Mux15~0_combout\ = ( \inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst6|temp_op\(0) ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux47~4_combout\ ) ) ) 
-- # ( \inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux31~4_combout\ ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst|pc_counter\(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(0),
	datab => \inst1|ALT_INV_Mux31~4_combout\,
	datac => \inst1|ALT_INV_Mux47~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(0),
	datae => \inst5|ALT_INV_Op2_mux_select[0]~2_combout\,
	dataf => \inst5|ALT_INV_Op2_mux_select[1]~1_combout\,
	combout => \inst4|OP2_Mux|Mux15~0_combout\);

\inst4|temp_op2_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|OP2_Mux|Mux15~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op2_write~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|temp_op2_out\(0));

\inst3|memory_rtl_0|auto_generated|ram_block1a3\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000070",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_0|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 3,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_0|auto_generated|ram_block1a3_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a3_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a3_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_0|auto_generated|ram_block1a3_PORTBDATAOUT_bus\);

\inst6|temp_op[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a3~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(3));

\inst4|OP2_Mux|Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4|OP2_Mux|Mux12~0_combout\ = ( \inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst6|temp_op\(3) ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux44~4_combout\ ) ) ) 
-- # ( \inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux28~4_combout\ ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst|pc_counter\(3) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(3),
	datab => \inst1|ALT_INV_Mux28~4_combout\,
	datac => \inst1|ALT_INV_Mux44~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(3),
	datae => \inst5|ALT_INV_Op2_mux_select[0]~2_combout\,
	dataf => \inst5|ALT_INV_Op2_mux_select[1]~1_combout\,
	combout => \inst4|OP2_Mux|Mux12~0_combout\);

\inst4|temp_op2_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|OP2_Mux|Mux12~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op2_write~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|temp_op2_out\(3));

\inst3|memory_rtl_1|auto_generated|ram_block1a3\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000070",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_1|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 3,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_1|auto_generated|ram_block1a3_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a3_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a3_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_1|auto_generated|ram_block1a3_PORTBDATAOUT_bus\);

\inst1|Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux12~0_combout\ = (!\inst4|temp_op2_out\(3) & (\inst3|memory_rtl_1|auto_generated|ram_block1a3~portbdataout\ & ((\inst1|Mux0~1_combout\)))) # (\inst4|temp_op2_out\(3) & ((!\inst1|Mux1~1_combout\) # 
-- ((\inst3|memory_rtl_1|auto_generated|ram_block1a3~portbdataout\ & \inst1|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001110011010100000111001101010000011100110101000001110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(3),
	datab => \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a3~portbdataout\,
	datac => \inst1|ALT_INV_Mux1~1_combout\,
	datad => \inst1|ALT_INV_Mux0~1_combout\,
	combout => \inst1|Mux12~0_combout\);

\inst1|Mux12~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux12~1_combout\ = ( \inst1|Mux12~0_combout\ ) # ( !\inst1|Mux12~0_combout\ & ( (\inst1|Mux0~0_combout\ & ((!\inst1|Mux1~0_combout\ & (\inst15|Mux12~0_combout\)) # (\inst1|Mux1~0_combout\ & ((\inst7|sip_r\(3)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000111111111111111111100000100000001111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux12~0_combout\,
	datab => \inst1|ALT_INV_Mux1~0_combout\,
	datac => \inst1|ALT_INV_Mux0~0_combout\,
	datad => \inst7|ALT_INV_sip_r\(3),
	datae => \inst1|ALT_INV_Mux12~0_combout\,
	combout => \inst1|Mux12~1_combout\);

\inst1|regs[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux12~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[0][3]~q\);

\inst1|Mux28~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux28~0_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[3][3]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[2][3]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[1][3]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[0][3]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][3]~q\,
	datab => \inst1|ALT_INV_regs[1][3]~q\,
	datac => \inst1|ALT_INV_regs[2][3]~q\,
	datad => \inst1|ALT_INV_regs[3][3]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux28~0_combout\);

\inst1|Mux28~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux28~1_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[7][3]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[6][3]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[5][3]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[4][3]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[4][3]~q\,
	datab => \inst1|ALT_INV_regs[5][3]~q\,
	datac => \inst1|ALT_INV_regs[6][3]~q\,
	datad => \inst1|ALT_INV_regs[7][3]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux28~1_combout\);

\inst1|Mux28~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux28~2_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[11][3]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[10][3]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[9][3]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[8][3]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[8][3]~q\,
	datab => \inst1|ALT_INV_regs[9][3]~q\,
	datac => \inst1|ALT_INV_regs[10][3]~q\,
	datad => \inst1|ALT_INV_regs[11][3]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux28~2_combout\);

\inst1|Mux28~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux28~3_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[15][3]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[14][3]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[13][3]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[12][3]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[12][3]~q\,
	datab => \inst1|ALT_INV_regs[13][3]~q\,
	datac => \inst1|ALT_INV_regs[14][3]~q\,
	datad => \inst1|ALT_INV_regs[15][3]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux28~3_combout\);

\inst1|Mux28~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux28~4_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|Mux28~3_combout\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|Mux28~2_combout\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( 
-- \inst1|Mux28~1_combout\ ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|Mux28~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux28~0_combout\,
	datab => \inst1|ALT_INV_Mux28~1_combout\,
	datac => \inst1|ALT_INV_Mux28~2_combout\,
	datad => \inst1|ALT_INV_Mux28~3_combout\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux28~4_combout\);

\inst2|OP1_Mux|Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|OP1_Mux|Mux12~0_combout\ = ( \inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst6|temp_op\(3) ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux44~4_combout\ ) ) ) 
-- # ( \inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux28~4_combout\ ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst|pc_counter\(3) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(3),
	datab => \inst1|ALT_INV_Mux28~4_combout\,
	datac => \inst1|ALT_INV_Mux44~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(3),
	datae => \inst5|ALT_INV_Op1_mux_select[0]~3_combout\,
	dataf => \inst5|ALT_INV_Op1_mux_select[1]~2_combout\,
	combout => \inst2|OP1_Mux|Mux12~0_combout\);

\inst2|temp_op1_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|OP1_Mux|Mux12~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op1_write~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|temp_op1_out\(3));

\inst15|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Add0~49_sumout\ = SUM(( !\inst2|temp_op1_out\(3) $ (((!\inst5|Mux14~1_combout\) # ((!\inst5|state.T3~q\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(3) ) + ( \inst15|Add0~54\ ))
-- \inst15|Add0~50\ = CARRY(( !\inst2|temp_op1_out\(3) $ (((!\inst5|Mux14~1_combout\) # ((!\inst5|state.T3~q\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(3) ) + ( \inst15|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000010011111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_Mux14~1_combout\,
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_state.T3~q\,
	datad => \inst2|ALT_INV_temp_op1_out\(3),
	dataf => \inst4|ALT_INV_temp_op2_out\(3),
	cin => \inst15|Add0~54\,
	sumout => \inst15|Add0~49_sumout\,
	cout => \inst15|Add0~50\);

\inst15|Mux12~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux12~1_combout\ = ( \inst4|temp_op2_out\(3) & ( (\inst5|state.T3~q\ & (\inst5|Mux13~1_combout\ & ((\inst2|temp_op1_out\(3)) # (\inst5|Mux14~0_combout\)))) ) ) # ( !\inst4|temp_op2_out\(3) & ( (\inst5|state.T3~q\ & (\inst5|Mux13~1_combout\ & 
-- (\inst5|Mux14~0_combout\ & \inst2|temp_op1_out\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000010001000100000000000000010000000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_Mux13~1_combout\,
	datac => \inst5|ALT_INV_Mux14~0_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(3),
	datae => \inst4|ALT_INV_temp_op2_out\(3),
	combout => \inst15|Mux12~1_combout\);

\inst15|Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux12~0_combout\ = ( \inst5|Mux12~0_combout\ & ( \inst15|Mux12~1_combout\ ) ) # ( !\inst5|Mux12~0_combout\ & ( \inst15|Mux12~1_combout\ & ( (!\inst15|Mux12~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~49_sumout\)))) # 
-- (\inst15|Mux12~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~49_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( \inst5|Mux12~0_combout\ & ( !\inst15|Mux12~1_combout\ & ( (!\inst15|Mux12~0_combout\ & (((\inst15|Mux0~0_combout\ & 
-- \inst15|Add0~49_sumout\)))) # (\inst15|Mux12~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~49_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( !\inst5|Mux12~0_combout\ & ( !\inst15|Mux12~1_combout\ & ( (!\inst15|Mux12~0_combout\ & 
-- (((\inst15|Mux0~0_combout\ & \inst15|Add0~49_sumout\)))) # (\inst15|Mux12~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~49_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011111000100010001111100010001000111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux12~0_combout\,
	datab => \inst15|ALT_INV_Mux15~0_combout\,
	datac => \inst15|ALT_INV_Mux0~0_combout\,
	datad => \inst15|ALT_INV_Add0~49_sumout\,
	datae => \inst5|ALT_INV_Mux12~0_combout\,
	dataf => \inst15|ALT_INV_Mux12~1_combout\,
	combout => \inst15|Mux12~0_combout\);

\inst15|z_flag~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|z_flag~0_combout\ = (!\inst15|Mux12~0_combout\ & (!\inst15|Mux13~0_combout\ & (!\inst15|Mux14~0_combout\ & !\inst15|Mux15~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000010000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux12~0_combout\,
	datab => \inst15|ALT_INV_Mux13~0_combout\,
	datac => \inst15|ALT_INV_Mux14~0_combout\,
	datad => \inst15|ALT_INV_Mux15~1_combout\,
	combout => \inst15|z_flag~0_combout\);

\inst15|z_flag~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|z_flag~1_combout\ = (!\inst15|Mux6~0_combout\ & (!\inst15|Mux7~0_combout\ & (!\inst15|Mux8~0_combout\ & !\inst15|Mux9~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000010000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux6~0_combout\,
	datab => \inst15|ALT_INV_Mux7~0_combout\,
	datac => \inst15|ALT_INV_Mux8~0_combout\,
	datad => \inst15|ALT_INV_Mux9~0_combout\,
	combout => \inst15|z_flag~1_combout\);

\inst|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~1_sumout\ = SUM(( \inst|pc_counter\(15) ) + ( GND ) + ( \inst|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_pc_counter\(15),
	cin => \inst|Add0~6\,
	sumout => \inst|Add0~1_sumout\);

\inst|pc_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~1_sumout\,
	asdata => \inst2|temp_op1_out\(15),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|Selector0~2_combout\,
	ena => \inst5|Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(15));

\Sip_in[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sip_in(15),
	o => \Sip_in[15]~input_o\);

\inst7|sip_r[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Sip_in[15]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sip_r\(15));

\inst1|regs[1][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux0~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[1][15]~q\);

\inst1|regs[2][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux0~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[2][15]~q\);

\inst1|regs[3][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux0~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[3][15]~q\);

\inst1|Mux32~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux32~0_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[3][15]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[2][15]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[1][15]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[0][15]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][15]~q\,
	datab => \inst1|ALT_INV_regs[1][15]~q\,
	datac => \inst1|ALT_INV_regs[2][15]~q\,
	datad => \inst1|ALT_INV_regs[3][15]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux32~0_combout\);

\inst1|regs[4][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux0~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[4][15]~q\);

\inst1|regs[5][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux0~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[5][15]~q\);

\inst1|regs[6][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux0~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[6][15]~q\);

\inst1|regs[7][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux0~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[7][15]~q\);

\inst1|Mux32~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux32~1_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[7][15]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[6][15]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[5][15]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[4][15]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[4][15]~q\,
	datab => \inst1|ALT_INV_regs[5][15]~q\,
	datac => \inst1|ALT_INV_regs[6][15]~q\,
	datad => \inst1|ALT_INV_regs[7][15]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux32~1_combout\);

\inst1|regs[8][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux0~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[8][15]~q\);

\inst1|regs[9][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux0~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[9][15]~q\);

\inst1|regs[10][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux0~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[10][15]~q\);

\inst1|regs[11][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux0~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[11][15]~q\);

\inst1|Mux32~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux32~2_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[11][15]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[10][15]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[9][15]~q\ 
-- ) ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[8][15]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[8][15]~q\,
	datab => \inst1|ALT_INV_regs[9][15]~q\,
	datac => \inst1|ALT_INV_regs[10][15]~q\,
	datad => \inst1|ALT_INV_regs[11][15]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux32~2_combout\);

\inst1|regs[12][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux0~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[12][15]~q\);

\inst1|regs[13][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux0~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[13][15]~q\);

\inst1|regs[14][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux0~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[14][15]~q\);

\inst1|regs[15][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux0~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[15][15]~q\);

\inst1|Mux32~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux32~3_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[15][15]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[14][15]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( 
-- \inst1|regs[13][15]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[12][15]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[12][15]~q\,
	datab => \inst1|ALT_INV_regs[13][15]~q\,
	datac => \inst1|ALT_INV_regs[14][15]~q\,
	datad => \inst1|ALT_INV_regs[15][15]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux32~3_combout\);

\inst1|Mux32~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux32~4_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|Mux32~3_combout\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|Mux32~2_combout\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( 
-- \inst1|Mux32~1_combout\ ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|Mux32~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux32~0_combout\,
	datab => \inst1|ALT_INV_Mux32~1_combout\,
	datac => \inst1|ALT_INV_Mux32~2_combout\,
	datad => \inst1|ALT_INV_Mux32~3_combout\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux32~4_combout\);

\inst6|temp_op[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(15));

\inst4|OP2_Mux|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4|OP2_Mux|Mux0~0_combout\ = ( \inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst6|temp_op\(15) ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux32~4_combout\ ) ) ) 
-- # ( \inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux16~4_combout\ ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst|pc_counter\(15) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(15),
	datab => \inst1|ALT_INV_Mux16~4_combout\,
	datac => \inst1|ALT_INV_Mux32~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(15),
	datae => \inst5|ALT_INV_Op2_mux_select[0]~2_combout\,
	dataf => \inst5|ALT_INV_Op2_mux_select[1]~1_combout\,
	combout => \inst4|OP2_Mux|Mux0~0_combout\);

\inst4|temp_op2_out[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|OP2_Mux|Mux0~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op2_write~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|temp_op2_out\(15));

\inst3|memory_rtl_1|auto_generated|ram_block1a15\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000040",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_1|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 15,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 15,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_1|auto_generated|ram_block1a15_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a15_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a15_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_1|auto_generated|ram_block1a15_PORTBDATAOUT_bus\);

\inst1|Mux0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux0~2_combout\ = (!\inst4|temp_op2_out\(15) & (\inst3|memory_rtl_1|auto_generated|ram_block1a15~portbdataout\ & ((\inst1|Mux0~1_combout\)))) # (\inst4|temp_op2_out\(15) & ((!\inst1|Mux1~1_combout\) # 
-- ((\inst3|memory_rtl_1|auto_generated|ram_block1a15~portbdataout\ & \inst1|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001110011010100000111001101010000011100110101000001110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(15),
	datab => \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a15~portbdataout\,
	datac => \inst1|ALT_INV_Mux1~1_combout\,
	datad => \inst1|ALT_INV_Mux0~1_combout\,
	combout => \inst1|Mux0~2_combout\);

\inst1|Mux0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux0~3_combout\ = ( \inst1|Mux0~2_combout\ ) # ( !\inst1|Mux0~2_combout\ & ( (\inst1|Mux0~0_combout\ & ((!\inst1|Mux1~0_combout\ & (\inst15|Mux0~1_combout\)) # (\inst1|Mux1~0_combout\ & ((\inst7|sip_r\(15)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000111111111111111111100000000010001111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux0~1_combout\,
	datab => \inst1|ALT_INV_Mux1~0_combout\,
	datac => \inst7|ALT_INV_sip_r\(15),
	datad => \inst1|ALT_INV_Mux0~0_combout\,
	datae => \inst1|ALT_INV_Mux0~2_combout\,
	combout => \inst1|Mux0~3_combout\);

\inst1|regs[0][15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux0~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[0][15]~q\);

\inst1|Mux16~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux16~0_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[3][15]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[2][15]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[1][15]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[0][15]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][15]~q\,
	datab => \inst1|ALT_INV_regs[1][15]~q\,
	datac => \inst1|ALT_INV_regs[2][15]~q\,
	datad => \inst1|ALT_INV_regs[3][15]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux16~0_combout\);

\inst1|Mux16~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux16~1_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[7][15]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[6][15]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[5][15]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[4][15]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[4][15]~q\,
	datab => \inst1|ALT_INV_regs[5][15]~q\,
	datac => \inst1|ALT_INV_regs[6][15]~q\,
	datad => \inst1|ALT_INV_regs[7][15]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux16~1_combout\);

\inst1|Mux16~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux16~2_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[11][15]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[10][15]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[9][15]~q\ 
-- ) ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[8][15]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[8][15]~q\,
	datab => \inst1|ALT_INV_regs[9][15]~q\,
	datac => \inst1|ALT_INV_regs[10][15]~q\,
	datad => \inst1|ALT_INV_regs[11][15]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux16~2_combout\);

\inst1|Mux16~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux16~3_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[15][15]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[14][15]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( 
-- \inst1|regs[13][15]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[12][15]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[12][15]~q\,
	datab => \inst1|ALT_INV_regs[13][15]~q\,
	datac => \inst1|ALT_INV_regs[14][15]~q\,
	datad => \inst1|ALT_INV_regs[15][15]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux16~3_combout\);

\inst1|Mux16~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux16~4_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|Mux16~3_combout\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|Mux16~2_combout\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( 
-- \inst1|Mux16~1_combout\ ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|Mux16~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux16~0_combout\,
	datab => \inst1|ALT_INV_Mux16~1_combout\,
	datac => \inst1|ALT_INV_Mux16~2_combout\,
	datad => \inst1|ALT_INV_Mux16~3_combout\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux16~4_combout\);

\inst2|OP1_Mux|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|OP1_Mux|Mux0~0_combout\ = ( \inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst6|temp_op\(15) ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux32~4_combout\ ) ) ) 
-- # ( \inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux16~4_combout\ ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst|pc_counter\(15) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(15),
	datab => \inst1|ALT_INV_Mux16~4_combout\,
	datac => \inst1|ALT_INV_Mux32~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(15),
	datae => \inst5|ALT_INV_Op1_mux_select[0]~3_combout\,
	dataf => \inst5|ALT_INV_Op1_mux_select[1]~2_combout\,
	combout => \inst2|OP1_Mux|Mux0~0_combout\);

\inst2|temp_op1_out[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|OP1_Mux|Mux0~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op1_write~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|temp_op1_out\(15));

\inst1|regs[1][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux4~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[1][11]~q\);

\inst1|regs[2][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux4~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[2][11]~q\);

\inst1|regs[3][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux4~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[3][11]~q\);

\inst1|Mux36~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux36~0_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[3][11]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[2][11]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[1][11]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[0][11]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][11]~q\,
	datab => \inst1|ALT_INV_regs[1][11]~q\,
	datac => \inst1|ALT_INV_regs[2][11]~q\,
	datad => \inst1|ALT_INV_regs[3][11]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux36~0_combout\);

\inst1|regs[4][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux4~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[4][11]~q\);

\inst1|regs[5][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux4~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[5][11]~q\);

\inst1|regs[6][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux4~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[6][11]~q\);

\inst1|regs[7][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux4~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[7][11]~q\);

\inst1|Mux36~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux36~1_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[7][11]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[6][11]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[5][11]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[4][11]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[4][11]~q\,
	datab => \inst1|ALT_INV_regs[5][11]~q\,
	datac => \inst1|ALT_INV_regs[6][11]~q\,
	datad => \inst1|ALT_INV_regs[7][11]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux36~1_combout\);

\inst1|regs[8][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux4~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[8][11]~q\);

\inst1|regs[9][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux4~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[9][11]~q\);

\inst1|regs[10][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux4~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[10][11]~q\);

\inst1|regs[11][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux4~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[11][11]~q\);

\inst1|Mux36~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux36~2_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[11][11]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[10][11]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[9][11]~q\ 
-- ) ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[8][11]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[8][11]~q\,
	datab => \inst1|ALT_INV_regs[9][11]~q\,
	datac => \inst1|ALT_INV_regs[10][11]~q\,
	datad => \inst1|ALT_INV_regs[11][11]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux36~2_combout\);

\inst1|regs[12][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux4~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[12][11]~q\);

\inst1|regs[13][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux4~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[13][11]~q\);

\inst1|regs[14][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux4~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[14][11]~q\);

\inst1|regs[15][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux4~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[15][11]~q\);

\inst1|Mux36~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux36~3_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[15][11]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[14][11]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( 
-- \inst1|regs[13][11]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[12][11]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[12][11]~q\,
	datab => \inst1|ALT_INV_regs[13][11]~q\,
	datac => \inst1|ALT_INV_regs[14][11]~q\,
	datad => \inst1|ALT_INV_regs[15][11]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux36~3_combout\);

\inst1|Mux36~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux36~4_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|Mux36~3_combout\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|Mux36~2_combout\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( 
-- \inst1|Mux36~1_combout\ ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|Mux36~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux36~0_combout\,
	datab => \inst1|ALT_INV_Mux36~1_combout\,
	datac => \inst1|ALT_INV_Mux36~2_combout\,
	datad => \inst1|ALT_INV_Mux36~3_combout\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux36~4_combout\);

\inst6|temp_op[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(11));

\inst4|OP2_Mux|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4|OP2_Mux|Mux4~0_combout\ = ( \inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst6|temp_op\(11) ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux36~4_combout\ ) ) ) 
-- # ( \inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux20~4_combout\ ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst|pc_counter\(11) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(11),
	datab => \inst1|ALT_INV_Mux20~4_combout\,
	datac => \inst1|ALT_INV_Mux36~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(11),
	datae => \inst5|ALT_INV_Op2_mux_select[0]~2_combout\,
	dataf => \inst5|ALT_INV_Op2_mux_select[1]~1_combout\,
	combout => \inst4|OP2_Mux|Mux4~0_combout\);

\inst4|temp_op2_out[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|OP2_Mux|Mux4~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op2_write~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|temp_op2_out\(11));

\inst1|regs[1][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux6~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[1][9]~q\);

\inst1|regs[2][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux6~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[2][9]~q\);

\inst1|regs[3][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux6~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[3][9]~q\);

\inst1|Mux38~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux38~0_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[3][9]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[2][9]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[1][9]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[0][9]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][9]~q\,
	datab => \inst1|ALT_INV_regs[1][9]~q\,
	datac => \inst1|ALT_INV_regs[2][9]~q\,
	datad => \inst1|ALT_INV_regs[3][9]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux38~0_combout\);

\inst1|regs[4][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux6~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[4][9]~q\);

\inst1|regs[5][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux6~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[5][9]~q\);

\inst1|regs[6][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux6~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[6][9]~q\);

\inst1|regs[7][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux6~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[7][9]~q\);

\inst1|Mux38~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux38~1_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[7][9]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[6][9]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[5][9]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[4][9]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[4][9]~q\,
	datab => \inst1|ALT_INV_regs[5][9]~q\,
	datac => \inst1|ALT_INV_regs[6][9]~q\,
	datad => \inst1|ALT_INV_regs[7][9]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux38~1_combout\);

\inst1|regs[8][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux6~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[8][9]~q\);

\inst1|regs[9][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux6~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[9][9]~q\);

\inst1|regs[10][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux6~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[10][9]~q\);

\inst1|regs[11][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux6~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[11][9]~q\);

\inst1|Mux38~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux38~2_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[11][9]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[10][9]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[9][9]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[8][9]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[8][9]~q\,
	datab => \inst1|ALT_INV_regs[9][9]~q\,
	datac => \inst1|ALT_INV_regs[10][9]~q\,
	datad => \inst1|ALT_INV_regs[11][9]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux38~2_combout\);

\inst1|regs[12][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux6~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[12][9]~q\);

\inst1|regs[13][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux6~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[13][9]~q\);

\inst1|regs[14][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux6~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[14][9]~q\);

\inst1|regs[15][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux6~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[15][9]~q\);

\inst1|Mux38~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux38~3_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[15][9]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[14][9]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[13][9]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[12][9]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[12][9]~q\,
	datab => \inst1|ALT_INV_regs[13][9]~q\,
	datac => \inst1|ALT_INV_regs[14][9]~q\,
	datad => \inst1|ALT_INV_regs[15][9]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux38~3_combout\);

\inst1|Mux38~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux38~4_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|Mux38~3_combout\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|Mux38~2_combout\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( 
-- \inst1|Mux38~1_combout\ ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|Mux38~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux38~0_combout\,
	datab => \inst1|ALT_INV_Mux38~1_combout\,
	datac => \inst1|ALT_INV_Mux38~2_combout\,
	datad => \inst1|ALT_INV_Mux38~3_combout\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux38~4_combout\);

\inst6|temp_op[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(9));

\inst4|OP2_Mux|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4|OP2_Mux|Mux6~0_combout\ = ( \inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst6|temp_op\(9) ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux38~4_combout\ ) ) ) 
-- # ( \inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux22~4_combout\ ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst|pc_counter\(9) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(9),
	datab => \inst1|ALT_INV_Mux22~4_combout\,
	datac => \inst1|ALT_INV_Mux38~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(9),
	datae => \inst5|ALT_INV_Op2_mux_select[0]~2_combout\,
	dataf => \inst5|ALT_INV_Op2_mux_select[1]~1_combout\,
	combout => \inst4|OP2_Mux|Mux6~0_combout\);

\inst4|temp_op2_out[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|OP2_Mux|Mux6~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op2_write~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|temp_op2_out\(9));

\inst15|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Add0~45_sumout\ = SUM(( !\inst2|temp_op1_out\(4) $ (((!\inst5|Mux14~1_combout\) # ((!\inst5|state.T3~q\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(4) ) + ( \inst15|Add0~50\ ))
-- \inst15|Add0~46\ = CARRY(( !\inst2|temp_op1_out\(4) $ (((!\inst5|Mux14~1_combout\) # ((!\inst5|state.T3~q\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(4) ) + ( \inst15|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000010011111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_Mux14~1_combout\,
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_state.T3~q\,
	datad => \inst2|ALT_INV_temp_op1_out\(4),
	dataf => \inst4|ALT_INV_temp_op2_out\(4),
	cin => \inst15|Add0~50\,
	sumout => \inst15|Add0~45_sumout\,
	cout => \inst15|Add0~46\);

\inst15|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Add0~41_sumout\ = SUM(( !\inst2|temp_op1_out\(5) $ (((!\inst5|Mux14~1_combout\) # ((!\inst5|state.T3~q\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(5) ) + ( \inst15|Add0~46\ ))
-- \inst15|Add0~42\ = CARRY(( !\inst2|temp_op1_out\(5) $ (((!\inst5|Mux14~1_combout\) # ((!\inst5|state.T3~q\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(5) ) + ( \inst15|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000010011111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_Mux14~1_combout\,
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_state.T3~q\,
	datad => \inst2|ALT_INV_temp_op1_out\(5),
	dataf => \inst4|ALT_INV_temp_op2_out\(5),
	cin => \inst15|Add0~46\,
	sumout => \inst15|Add0~41_sumout\,
	cout => \inst15|Add0~42\);

\inst15|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Add0~37_sumout\ = SUM(( !\inst2|temp_op1_out\(6) $ (((!\inst5|Mux14~1_combout\) # ((!\inst5|state.T3~q\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(6) ) + ( \inst15|Add0~42\ ))
-- \inst15|Add0~38\ = CARRY(( !\inst2|temp_op1_out\(6) $ (((!\inst5|Mux14~1_combout\) # ((!\inst5|state.T3~q\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(6) ) + ( \inst15|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000010011111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_Mux14~1_combout\,
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_state.T3~q\,
	datad => \inst2|ALT_INV_temp_op1_out\(6),
	dataf => \inst4|ALT_INV_temp_op2_out\(6),
	cin => \inst15|Add0~42\,
	sumout => \inst15|Add0~37_sumout\,
	cout => \inst15|Add0~38\);

\inst15|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Add0~33_sumout\ = SUM(( !\inst2|temp_op1_out\(7) $ (((!\inst5|Mux14~1_combout\) # ((!\inst5|state.T3~q\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(7) ) + ( \inst15|Add0~38\ ))
-- \inst15|Add0~34\ = CARRY(( !\inst2|temp_op1_out\(7) $ (((!\inst5|Mux14~1_combout\) # ((!\inst5|state.T3~q\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(7) ) + ( \inst15|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000010011111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_Mux14~1_combout\,
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_state.T3~q\,
	datad => \inst2|ALT_INV_temp_op1_out\(7),
	dataf => \inst4|ALT_INV_temp_op2_out\(7),
	cin => \inst15|Add0~38\,
	sumout => \inst15|Add0~33_sumout\,
	cout => \inst15|Add0~34\);

\inst15|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Add0~29_sumout\ = SUM(( !\inst2|temp_op1_out\(8) $ (((!\inst5|Mux14~1_combout\) # ((!\inst5|state.T3~q\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(8) ) + ( \inst15|Add0~34\ ))
-- \inst15|Add0~30\ = CARRY(( !\inst2|temp_op1_out\(8) $ (((!\inst5|Mux14~1_combout\) # ((!\inst5|state.T3~q\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(8) ) + ( \inst15|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000010011111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_Mux14~1_combout\,
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_state.T3~q\,
	datad => \inst2|ALT_INV_temp_op1_out\(8),
	dataf => \inst4|ALT_INV_temp_op2_out\(8),
	cin => \inst15|Add0~34\,
	sumout => \inst15|Add0~29_sumout\,
	cout => \inst15|Add0~30\);

\inst15|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Add0~25_sumout\ = SUM(( !\inst2|temp_op1_out\(9) $ (((!\inst5|state.T3~q\) # ((!\inst5|Mux14~1_combout\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(9) ) + ( \inst15|Add0~30\ ))
-- \inst15|Add0~26\ = CARRY(( !\inst2|temp_op1_out\(9) $ (((!\inst5|state.T3~q\) # ((!\inst5|Mux14~1_combout\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(9) ) + ( \inst15|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000010011111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_Mux14~1_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(9),
	dataf => \inst4|ALT_INV_temp_op2_out\(9),
	cin => \inst15|Add0~30\,
	sumout => \inst15|Add0~25_sumout\,
	cout => \inst15|Add0~26\);

\inst15|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Add0~21_sumout\ = SUM(( !\inst2|temp_op1_out\(10) $ (((!\inst5|state.T3~q\) # ((!\inst5|Mux14~1_combout\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(10) ) + ( \inst15|Add0~26\ ))
-- \inst15|Add0~22\ = CARRY(( !\inst2|temp_op1_out\(10) $ (((!\inst5|state.T3~q\) # ((!\inst5|Mux14~1_combout\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(10) ) + ( \inst15|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000010011111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_Mux14~1_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(10),
	dataf => \inst4|ALT_INV_temp_op2_out\(10),
	cin => \inst15|Add0~26\,
	sumout => \inst15|Add0~21_sumout\,
	cout => \inst15|Add0~22\);

\inst15|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Add0~17_sumout\ = SUM(( !\inst2|temp_op1_out\(11) $ (((!\inst5|state.T3~q\) # ((!\inst5|Mux14~1_combout\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(11) ) + ( \inst15|Add0~22\ ))
-- \inst15|Add0~18\ = CARRY(( !\inst2|temp_op1_out\(11) $ (((!\inst5|state.T3~q\) # ((!\inst5|Mux14~1_combout\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(11) ) + ( \inst15|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000010011111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_Mux14~1_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(11),
	dataf => \inst4|ALT_INV_temp_op2_out\(11),
	cin => \inst15|Add0~22\,
	sumout => \inst15|Add0~17_sumout\,
	cout => \inst15|Add0~18\);

\inst15|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Add0~13_sumout\ = SUM(( !\inst2|temp_op1_out\(12) $ (((!\inst5|state.T3~q\) # ((!\inst5|Mux14~1_combout\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(12) ) + ( \inst15|Add0~18\ ))
-- \inst15|Add0~14\ = CARRY(( !\inst2|temp_op1_out\(12) $ (((!\inst5|state.T3~q\) # ((!\inst5|Mux14~1_combout\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(12) ) + ( \inst15|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000010011111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_Mux14~1_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(12),
	dataf => \inst4|ALT_INV_temp_op2_out\(12),
	cin => \inst15|Add0~18\,
	sumout => \inst15|Add0~13_sumout\,
	cout => \inst15|Add0~14\);

\inst15|Mux3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux3~1_combout\ = ( \inst4|temp_op2_out\(12) & ( (\inst5|state.T3~q\ & (\inst5|Mux12~0_combout\ & ((\inst2|temp_op1_out\(12)) # (\inst5|Mux14~0_combout\)))) ) ) # ( !\inst4|temp_op2_out\(12) & ( (\inst5|state.T3~q\ & (\inst5|Mux12~0_combout\ & 
-- (\inst5|Mux14~0_combout\ & \inst2|temp_op1_out\(12)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000010001000100000000000000010000000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_Mux12~0_combout\,
	datac => \inst5|ALT_INV_Mux14~0_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(12),
	datae => \inst4|ALT_INV_temp_op2_out\(12),
	combout => \inst15|Mux3~1_combout\);

\inst15|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux3~0_combout\ = ( \inst5|Mux13~1_combout\ & ( \inst15|Mux3~1_combout\ ) ) # ( !\inst5|Mux13~1_combout\ & ( \inst15|Mux3~1_combout\ & ( (!\inst15|Mux3~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~13_sumout\)))) # 
-- (\inst15|Mux3~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~13_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( \inst5|Mux13~1_combout\ & ( !\inst15|Mux3~1_combout\ & ( (!\inst15|Mux3~0_combout\ & (((\inst15|Mux0~0_combout\ & 
-- \inst15|Add0~13_sumout\)))) # (\inst15|Mux3~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~13_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( !\inst5|Mux13~1_combout\ & ( !\inst15|Mux3~1_combout\ & ( (!\inst15|Mux3~0_combout\ & 
-- (((\inst15|Mux0~0_combout\ & \inst15|Add0~13_sumout\)))) # (\inst15|Mux3~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~13_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011111000100010001111100010001000111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux3~0_combout\,
	datab => \inst15|ALT_INV_Mux15~0_combout\,
	datac => \inst15|ALT_INV_Mux0~0_combout\,
	datad => \inst15|ALT_INV_Add0~13_sumout\,
	datae => \inst5|ALT_INV_Mux13~1_combout\,
	dataf => \inst15|ALT_INV_Mux3~1_combout\,
	combout => \inst15|Mux3~0_combout\);

\Sip_in[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sip_in(12),
	o => \Sip_in[12]~input_o\);

\inst7|sip_r[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Sip_in[12]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sip_r\(12));

\inst3|memory_rtl_1|auto_generated|ram_block1a12\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "00000008",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_1|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 12,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 12,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_1|auto_generated|ram_block1a12_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a12_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a12_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_1|auto_generated|ram_block1a12_PORTBDATAOUT_bus\);

\inst1|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux3~0_combout\ = (!\inst4|temp_op2_out\(12) & (\inst3|memory_rtl_1|auto_generated|ram_block1a12~portbdataout\ & ((\inst1|Mux0~1_combout\)))) # (\inst4|temp_op2_out\(12) & ((!\inst1|Mux1~1_combout\) # 
-- ((\inst3|memory_rtl_1|auto_generated|ram_block1a12~portbdataout\ & \inst1|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001110011010100000111001101010000011100110101000001110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(12),
	datab => \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a12~portbdataout\,
	datac => \inst1|ALT_INV_Mux1~1_combout\,
	datad => \inst1|ALT_INV_Mux0~1_combout\,
	combout => \inst1|Mux3~0_combout\);

\inst1|Mux3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux3~1_combout\ = ( \inst1|Mux3~0_combout\ ) # ( !\inst1|Mux3~0_combout\ & ( (\inst1|Mux0~0_combout\ & ((!\inst1|Mux1~0_combout\ & (\inst15|Mux3~0_combout\)) # (\inst1|Mux1~0_combout\ & ((\inst7|sip_r\(12)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000111111111111111111100000100000001111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux3~0_combout\,
	datab => \inst1|ALT_INV_Mux1~0_combout\,
	datac => \inst1|ALT_INV_Mux0~0_combout\,
	datad => \inst7|ALT_INV_sip_r\(12),
	datae => \inst1|ALT_INV_Mux3~0_combout\,
	combout => \inst1|Mux3~1_combout\);

\inst1|regs[0][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux3~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[0][12]~q\);

\inst1|regs[4][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux3~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[4][12]~q\);

\inst1|regs[8][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux3~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[8][12]~q\);

\inst1|regs[12][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux3~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[12][12]~q\);

\inst1|Mux19~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux19~0_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[12][12]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[8][12]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[4][12]~q\ 
-- ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[0][12]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][12]~q\,
	datab => \inst1|ALT_INV_regs[4][12]~q\,
	datac => \inst1|ALT_INV_regs[8][12]~q\,
	datad => \inst1|ALT_INV_regs[12][12]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux19~0_combout\);

\inst1|regs[1][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux3~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[1][12]~q\);

\inst1|regs[5][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux3~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[5][12]~q\);

\inst1|regs[9][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux3~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[9][12]~q\);

\inst1|regs[13][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux3~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[13][12]~q\);

\inst1|Mux19~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux19~1_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[13][12]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[9][12]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[5][12]~q\ 
-- ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[1][12]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[1][12]~q\,
	datab => \inst1|ALT_INV_regs[5][12]~q\,
	datac => \inst1|ALT_INV_regs[9][12]~q\,
	datad => \inst1|ALT_INV_regs[13][12]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux19~1_combout\);

\inst1|regs[2][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux3~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[2][12]~q\);

\inst1|regs[6][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux3~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[6][12]~q\);

\inst1|regs[10][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux3~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[10][12]~q\);

\inst1|regs[14][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux3~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[14][12]~q\);

\inst1|Mux19~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux19~2_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[14][12]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[10][12]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[6][12]~q\ 
-- ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[2][12]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[2][12]~q\,
	datab => \inst1|ALT_INV_regs[6][12]~q\,
	datac => \inst1|ALT_INV_regs[10][12]~q\,
	datad => \inst1|ALT_INV_regs[14][12]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux19~2_combout\);

\inst1|regs[3][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux3~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[3][12]~q\);

\inst1|regs[7][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux3~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[7][12]~q\);

\inst1|regs[11][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux3~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[11][12]~q\);

\inst1|regs[15][12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux3~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[15][12]~q\);

\inst1|Mux19~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux19~3_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[15][12]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[11][12]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[7][12]~q\ 
-- ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[3][12]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[3][12]~q\,
	datab => \inst1|ALT_INV_regs[7][12]~q\,
	datac => \inst1|ALT_INV_regs[11][12]~q\,
	datad => \inst1|ALT_INV_regs[15][12]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux19~3_combout\);

\inst1|Mux19~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux19~4_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|Mux19~3_combout\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|Mux19~2_combout\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( 
-- \inst1|Mux19~1_combout\ ) ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|Mux19~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux19~0_combout\,
	datab => \inst1|ALT_INV_Mux19~1_combout\,
	datac => \inst1|ALT_INV_Mux19~2_combout\,
	datad => \inst1|ALT_INV_Mux19~3_combout\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux19~4_combout\);

\inst1|Mux35~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux35~0_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[12][12]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[8][12]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[4][12]~q\ 
-- ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[0][12]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][12]~q\,
	datab => \inst1|ALT_INV_regs[4][12]~q\,
	datac => \inst1|ALT_INV_regs[8][12]~q\,
	datad => \inst1|ALT_INV_regs[12][12]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux35~0_combout\);

\inst1|Mux35~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux35~1_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[13][12]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[9][12]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[5][12]~q\ 
-- ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[1][12]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[1][12]~q\,
	datab => \inst1|ALT_INV_regs[5][12]~q\,
	datac => \inst1|ALT_INV_regs[9][12]~q\,
	datad => \inst1|ALT_INV_regs[13][12]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux35~1_combout\);

\inst1|Mux35~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux35~2_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[14][12]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[10][12]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[6][12]~q\ 
-- ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[2][12]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[2][12]~q\,
	datab => \inst1|ALT_INV_regs[6][12]~q\,
	datac => \inst1|ALT_INV_regs[10][12]~q\,
	datad => \inst1|ALT_INV_regs[14][12]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux35~2_combout\);

\inst1|Mux35~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux35~3_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[15][12]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[11][12]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[7][12]~q\ 
-- ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[3][12]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[3][12]~q\,
	datab => \inst1|ALT_INV_regs[7][12]~q\,
	datac => \inst1|ALT_INV_regs[11][12]~q\,
	datad => \inst1|ALT_INV_regs[15][12]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux35~3_combout\);

\inst1|Mux35~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux35~4_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|Mux35~3_combout\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|Mux35~2_combout\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( 
-- \inst1|Mux35~1_combout\ ) ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|Mux35~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux35~0_combout\,
	datab => \inst1|ALT_INV_Mux35~1_combout\,
	datac => \inst1|ALT_INV_Mux35~2_combout\,
	datad => \inst1|ALT_INV_Mux35~3_combout\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux35~4_combout\);

\inst6|temp_op[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(12));

\inst4|OP2_Mux|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4|OP2_Mux|Mux3~0_combout\ = ( \inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst6|temp_op\(12) ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux35~4_combout\ ) ) ) 
-- # ( \inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux19~4_combout\ ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst|pc_counter\(12) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(12),
	datab => \inst1|ALT_INV_Mux19~4_combout\,
	datac => \inst1|ALT_INV_Mux35~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(12),
	datae => \inst5|ALT_INV_Op2_mux_select[0]~2_combout\,
	dataf => \inst5|ALT_INV_Op2_mux_select[1]~1_combout\,
	combout => \inst4|OP2_Mux|Mux3~0_combout\);

\inst4|temp_op2_out[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|OP2_Mux|Mux3~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op2_write~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|temp_op2_out\(12));

\inst15|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Add0~9_sumout\ = SUM(( !\inst2|temp_op1_out\(13) $ (((!\inst5|state.T3~q\) # ((!\inst5|Mux14~1_combout\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(13) ) + ( \inst15|Add0~14\ ))
-- \inst15|Add0~10\ = CARRY(( !\inst2|temp_op1_out\(13) $ (((!\inst5|state.T3~q\) # ((!\inst5|Mux14~1_combout\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(13) ) + ( \inst15|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000010011111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_Mux14~1_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(13),
	dataf => \inst4|ALT_INV_temp_op2_out\(13),
	cin => \inst15|Add0~14\,
	sumout => \inst15|Add0~9_sumout\,
	cout => \inst15|Add0~10\);

\inst15|Mux2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux2~1_combout\ = ( \inst4|temp_op2_out\(13) & ( (\inst5|state.T3~q\ & (\inst5|Mux12~0_combout\ & ((\inst2|temp_op1_out\(13)) # (\inst5|Mux14~0_combout\)))) ) ) # ( !\inst4|temp_op2_out\(13) & ( (\inst5|state.T3~q\ & (\inst5|Mux12~0_combout\ & 
-- (\inst5|Mux14~0_combout\ & \inst2|temp_op1_out\(13)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000010001000100000000000000010000000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_Mux12~0_combout\,
	datac => \inst5|ALT_INV_Mux14~0_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(13),
	datae => \inst4|ALT_INV_temp_op2_out\(13),
	combout => \inst15|Mux2~1_combout\);

\inst15|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux2~0_combout\ = ( \inst5|Mux13~1_combout\ & ( \inst15|Mux2~1_combout\ ) ) # ( !\inst5|Mux13~1_combout\ & ( \inst15|Mux2~1_combout\ & ( (!\inst15|Mux2~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~9_sumout\)))) # (\inst15|Mux2~0_combout\ 
-- & (((\inst15|Mux0~0_combout\ & \inst15|Add0~9_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( \inst5|Mux13~1_combout\ & ( !\inst15|Mux2~1_combout\ & ( (!\inst15|Mux2~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~9_sumout\)))) # 
-- (\inst15|Mux2~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~9_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( !\inst5|Mux13~1_combout\ & ( !\inst15|Mux2~1_combout\ & ( (!\inst15|Mux2~0_combout\ & (((\inst15|Mux0~0_combout\ & 
-- \inst15|Add0~9_sumout\)))) # (\inst15|Mux2~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~9_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011111000100010001111100010001000111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux2~0_combout\,
	datab => \inst15|ALT_INV_Mux15~0_combout\,
	datac => \inst15|ALT_INV_Mux0~0_combout\,
	datad => \inst15|ALT_INV_Add0~9_sumout\,
	datae => \inst5|ALT_INV_Mux13~1_combout\,
	dataf => \inst15|ALT_INV_Mux2~1_combout\,
	combout => \inst15|Mux2~0_combout\);

\Sip_in[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sip_in(13),
	o => \Sip_in[13]~input_o\);

\inst7|sip_r[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Sip_in[13]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sip_r\(13));

\inst3|memory_rtl_1|auto_generated|ram_block1a13\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000050",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_1|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 13,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 13,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_1|auto_generated|ram_block1a13_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a13_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a13_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_1|auto_generated|ram_block1a13_PORTBDATAOUT_bus\);

\inst1|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux2~0_combout\ = (!\inst4|temp_op2_out\(13) & (\inst3|memory_rtl_1|auto_generated|ram_block1a13~portbdataout\ & ((\inst1|Mux0~1_combout\)))) # (\inst4|temp_op2_out\(13) & ((!\inst1|Mux1~1_combout\) # 
-- ((\inst3|memory_rtl_1|auto_generated|ram_block1a13~portbdataout\ & \inst1|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001110011010100000111001101010000011100110101000001110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(13),
	datab => \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a13~portbdataout\,
	datac => \inst1|ALT_INV_Mux1~1_combout\,
	datad => \inst1|ALT_INV_Mux0~1_combout\,
	combout => \inst1|Mux2~0_combout\);

\inst1|Mux2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux2~1_combout\ = ( \inst1|Mux2~0_combout\ ) # ( !\inst1|Mux2~0_combout\ & ( (\inst1|Mux0~0_combout\ & ((!\inst1|Mux1~0_combout\ & (\inst15|Mux2~0_combout\)) # (\inst1|Mux1~0_combout\ & ((\inst7|sip_r\(13)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000111111111111111111100000100000001111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux2~0_combout\,
	datab => \inst1|ALT_INV_Mux1~0_combout\,
	datac => \inst1|ALT_INV_Mux0~0_combout\,
	datad => \inst7|ALT_INV_sip_r\(13),
	datae => \inst1|ALT_INV_Mux2~0_combout\,
	combout => \inst1|Mux2~1_combout\);

\inst1|regs[0][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux2~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[0][13]~q\);

\inst1|regs[1][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux2~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[1][13]~q\);

\inst1|regs[2][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux2~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[2][13]~q\);

\inst1|regs[3][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux2~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[3][13]~q\);

\inst1|Mux18~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux18~0_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[3][13]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[2][13]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[1][13]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[0][13]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][13]~q\,
	datab => \inst1|ALT_INV_regs[1][13]~q\,
	datac => \inst1|ALT_INV_regs[2][13]~q\,
	datad => \inst1|ALT_INV_regs[3][13]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux18~0_combout\);

\inst1|regs[4][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux2~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[4][13]~q\);

\inst1|regs[5][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux2~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[5][13]~q\);

\inst1|regs[6][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux2~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[6][13]~q\);

\inst1|regs[7][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux2~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[7][13]~q\);

\inst1|Mux18~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux18~1_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[7][13]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[6][13]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[5][13]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[4][13]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[4][13]~q\,
	datab => \inst1|ALT_INV_regs[5][13]~q\,
	datac => \inst1|ALT_INV_regs[6][13]~q\,
	datad => \inst1|ALT_INV_regs[7][13]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux18~1_combout\);

\inst1|regs[8][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux2~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[8][13]~q\);

\inst1|regs[9][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux2~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[9][13]~q\);

\inst1|regs[10][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux2~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[10][13]~q\);

\inst1|regs[11][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux2~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[11][13]~q\);

\inst1|Mux18~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux18~2_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[11][13]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[10][13]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[9][13]~q\ 
-- ) ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[8][13]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[8][13]~q\,
	datab => \inst1|ALT_INV_regs[9][13]~q\,
	datac => \inst1|ALT_INV_regs[10][13]~q\,
	datad => \inst1|ALT_INV_regs[11][13]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux18~2_combout\);

\inst1|regs[12][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux2~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[12][13]~q\);

\inst1|regs[13][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux2~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[13][13]~q\);

\inst1|regs[14][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux2~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[14][13]~q\);

\inst1|regs[15][13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux2~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[15][13]~q\);

\inst1|Mux18~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux18~3_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[15][13]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[14][13]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( 
-- \inst1|regs[13][13]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[12][13]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[12][13]~q\,
	datab => \inst1|ALT_INV_regs[13][13]~q\,
	datac => \inst1|ALT_INV_regs[14][13]~q\,
	datad => \inst1|ALT_INV_regs[15][13]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux18~3_combout\);

\inst1|Mux18~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux18~4_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|Mux18~3_combout\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|Mux18~2_combout\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( 
-- \inst1|Mux18~1_combout\ ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|Mux18~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux18~0_combout\,
	datab => \inst1|ALT_INV_Mux18~1_combout\,
	datac => \inst1|ALT_INV_Mux18~2_combout\,
	datad => \inst1|ALT_INV_Mux18~3_combout\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux18~4_combout\);

\inst1|Mux34~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux34~0_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[3][13]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[2][13]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[1][13]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[0][13]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][13]~q\,
	datab => \inst1|ALT_INV_regs[1][13]~q\,
	datac => \inst1|ALT_INV_regs[2][13]~q\,
	datad => \inst1|ALT_INV_regs[3][13]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux34~0_combout\);

\inst1|Mux34~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux34~1_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[7][13]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[6][13]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[5][13]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[4][13]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[4][13]~q\,
	datab => \inst1|ALT_INV_regs[5][13]~q\,
	datac => \inst1|ALT_INV_regs[6][13]~q\,
	datad => \inst1|ALT_INV_regs[7][13]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux34~1_combout\);

\inst1|Mux34~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux34~2_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[11][13]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[10][13]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[9][13]~q\ 
-- ) ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[8][13]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[8][13]~q\,
	datab => \inst1|ALT_INV_regs[9][13]~q\,
	datac => \inst1|ALT_INV_regs[10][13]~q\,
	datad => \inst1|ALT_INV_regs[11][13]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux34~2_combout\);

\inst1|Mux34~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux34~3_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[15][13]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[14][13]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( 
-- \inst1|regs[13][13]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[12][13]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[12][13]~q\,
	datab => \inst1|ALT_INV_regs[13][13]~q\,
	datac => \inst1|ALT_INV_regs[14][13]~q\,
	datad => \inst1|ALT_INV_regs[15][13]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux34~3_combout\);

\inst1|Mux34~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux34~4_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|Mux34~3_combout\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|Mux34~2_combout\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( 
-- \inst1|Mux34~1_combout\ ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|Mux34~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux34~0_combout\,
	datab => \inst1|ALT_INV_Mux34~1_combout\,
	datac => \inst1|ALT_INV_Mux34~2_combout\,
	datad => \inst1|ALT_INV_Mux34~3_combout\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux34~4_combout\);

\inst6|temp_op[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(13));

\inst4|OP2_Mux|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4|OP2_Mux|Mux2~0_combout\ = ( \inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst6|temp_op\(13) ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux34~4_combout\ ) ) ) 
-- # ( \inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux18~4_combout\ ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst|pc_counter\(13) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(13),
	datab => \inst1|ALT_INV_Mux18~4_combout\,
	datac => \inst1|ALT_INV_Mux34~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(13),
	datae => \inst5|ALT_INV_Op2_mux_select[0]~2_combout\,
	dataf => \inst5|ALT_INV_Op2_mux_select[1]~1_combout\,
	combout => \inst4|OP2_Mux|Mux2~0_combout\);

\inst4|temp_op2_out[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|OP2_Mux|Mux2~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op2_write~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|temp_op2_out\(13));

\inst15|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Add0~5_sumout\ = SUM(( !\inst2|temp_op1_out\(14) $ (((!\inst5|state.T3~q\) # ((!\inst5|Mux14~1_combout\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(14) ) + ( \inst15|Add0~10\ ))
-- \inst15|Add0~6\ = CARRY(( !\inst2|temp_op1_out\(14) $ (((!\inst5|state.T3~q\) # ((!\inst5|Mux14~1_combout\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(14) ) + ( \inst15|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000010011111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_Mux14~1_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(14),
	dataf => \inst4|ALT_INV_temp_op2_out\(14),
	cin => \inst15|Add0~10\,
	sumout => \inst15|Add0~5_sumout\,
	cout => \inst15|Add0~6\);

\inst15|Mux1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux1~1_combout\ = ( \inst4|temp_op2_out\(14) & ( (\inst5|state.T3~q\ & (\inst5|Mux12~0_combout\ & ((\inst2|temp_op1_out\(14)) # (\inst5|Mux14~0_combout\)))) ) ) # ( !\inst4|temp_op2_out\(14) & ( (\inst5|state.T3~q\ & (\inst5|Mux12~0_combout\ & 
-- (\inst5|Mux14~0_combout\ & \inst2|temp_op1_out\(14)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000010001000100000000000000010000000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_Mux12~0_combout\,
	datac => \inst5|ALT_INV_Mux14~0_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(14),
	datae => \inst4|ALT_INV_temp_op2_out\(14),
	combout => \inst15|Mux1~1_combout\);

\inst15|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux1~0_combout\ = ( \inst5|Mux13~1_combout\ & ( \inst15|Mux1~1_combout\ ) ) # ( !\inst5|Mux13~1_combout\ & ( \inst15|Mux1~1_combout\ & ( (!\inst15|Mux1~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~5_sumout\)))) # (\inst15|Mux1~0_combout\ 
-- & (((\inst15|Mux0~0_combout\ & \inst15|Add0~5_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( \inst5|Mux13~1_combout\ & ( !\inst15|Mux1~1_combout\ & ( (!\inst15|Mux1~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~5_sumout\)))) # 
-- (\inst15|Mux1~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~5_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( !\inst5|Mux13~1_combout\ & ( !\inst15|Mux1~1_combout\ & ( (!\inst15|Mux1~0_combout\ & (((\inst15|Mux0~0_combout\ & 
-- \inst15|Add0~5_sumout\)))) # (\inst15|Mux1~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~5_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011111000100010001111100010001000111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux1~0_combout\,
	datab => \inst15|ALT_INV_Mux15~0_combout\,
	datac => \inst15|ALT_INV_Mux0~0_combout\,
	datad => \inst15|ALT_INV_Add0~5_sumout\,
	datae => \inst5|ALT_INV_Mux13~1_combout\,
	dataf => \inst15|ALT_INV_Mux1~1_combout\,
	combout => \inst15|Mux1~0_combout\);

\Sip_in[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sip_in(14),
	o => \Sip_in[14]~input_o\);

\inst7|sip_r[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Sip_in[14]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sip_r\(14));

\inst3|memory_rtl_1|auto_generated|ram_block1a14\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0000005D",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_1|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 14,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 14,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_1|auto_generated|ram_block1a14_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a14_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a14_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_1|auto_generated|ram_block1a14_PORTBDATAOUT_bus\);

\inst1|Mux1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux1~2_combout\ = (!\inst4|temp_op2_out\(14) & (\inst3|memory_rtl_1|auto_generated|ram_block1a14~portbdataout\ & ((\inst1|Mux0~1_combout\)))) # (\inst4|temp_op2_out\(14) & ((!\inst1|Mux1~1_combout\) # 
-- ((\inst3|memory_rtl_1|auto_generated|ram_block1a14~portbdataout\ & \inst1|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001110011010100000111001101010000011100110101000001110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(14),
	datab => \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a14~portbdataout\,
	datac => \inst1|ALT_INV_Mux1~1_combout\,
	datad => \inst1|ALT_INV_Mux0~1_combout\,
	combout => \inst1|Mux1~2_combout\);

\inst1|Mux1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux1~3_combout\ = ( \inst1|Mux1~2_combout\ ) # ( !\inst1|Mux1~2_combout\ & ( (\inst1|Mux0~0_combout\ & ((!\inst1|Mux1~0_combout\ & (\inst15|Mux1~0_combout\)) # (\inst1|Mux1~0_combout\ & ((\inst7|sip_r\(14)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000111111111111111111100000100000001111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux1~0_combout\,
	datab => \inst1|ALT_INV_Mux1~0_combout\,
	datac => \inst1|ALT_INV_Mux0~0_combout\,
	datad => \inst7|ALT_INV_sip_r\(14),
	datae => \inst1|ALT_INV_Mux1~2_combout\,
	combout => \inst1|Mux1~3_combout\);

\inst1|regs[0][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux1~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[0][14]~q\);

\inst1|regs[4][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux1~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[4][14]~q\);

\inst1|regs[8][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux1~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[8][14]~q\);

\inst1|regs[12][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux1~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[12][14]~q\);

\inst1|Mux17~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux17~0_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[12][14]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[8][14]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[4][14]~q\ 
-- ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[0][14]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][14]~q\,
	datab => \inst1|ALT_INV_regs[4][14]~q\,
	datac => \inst1|ALT_INV_regs[8][14]~q\,
	datad => \inst1|ALT_INV_regs[12][14]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux17~0_combout\);

\inst1|regs[1][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux1~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[1][14]~q\);

\inst1|regs[5][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux1~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[5][14]~q\);

\inst1|regs[9][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux1~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[9][14]~q\);

\inst1|regs[13][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux1~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[13][14]~q\);

\inst1|Mux17~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux17~1_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[13][14]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[9][14]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[5][14]~q\ 
-- ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[1][14]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[1][14]~q\,
	datab => \inst1|ALT_INV_regs[5][14]~q\,
	datac => \inst1|ALT_INV_regs[9][14]~q\,
	datad => \inst1|ALT_INV_regs[13][14]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux17~1_combout\);

\inst1|regs[2][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux1~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[2][14]~q\);

\inst1|regs[6][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux1~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[6][14]~q\);

\inst1|regs[10][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux1~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[10][14]~q\);

\inst1|regs[14][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux1~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[14][14]~q\);

\inst1|Mux17~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux17~2_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[14][14]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[10][14]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[6][14]~q\ 
-- ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[2][14]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[2][14]~q\,
	datab => \inst1|ALT_INV_regs[6][14]~q\,
	datac => \inst1|ALT_INV_regs[10][14]~q\,
	datad => \inst1|ALT_INV_regs[14][14]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux17~2_combout\);

\inst1|regs[3][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux1~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[3][14]~q\);

\inst1|regs[7][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux1~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[7][14]~q\);

\inst1|regs[11][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux1~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[11][14]~q\);

\inst1|regs[15][14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux1~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[15][14]~q\);

\inst1|Mux17~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux17~3_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[15][14]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[11][14]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[7][14]~q\ 
-- ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[3][14]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[3][14]~q\,
	datab => \inst1|ALT_INV_regs[7][14]~q\,
	datac => \inst1|ALT_INV_regs[11][14]~q\,
	datad => \inst1|ALT_INV_regs[15][14]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux17~3_combout\);

\inst1|Mux17~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux17~4_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|Mux17~3_combout\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|Mux17~2_combout\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( 
-- \inst1|Mux17~1_combout\ ) ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|Mux17~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux17~0_combout\,
	datab => \inst1|ALT_INV_Mux17~1_combout\,
	datac => \inst1|ALT_INV_Mux17~2_combout\,
	datad => \inst1|ALT_INV_Mux17~3_combout\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux17~4_combout\);

\inst1|Mux33~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux33~0_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[12][14]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[8][14]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[4][14]~q\ 
-- ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[0][14]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][14]~q\,
	datab => \inst1|ALT_INV_regs[4][14]~q\,
	datac => \inst1|ALT_INV_regs[8][14]~q\,
	datad => \inst1|ALT_INV_regs[12][14]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux33~0_combout\);

\inst1|Mux33~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux33~1_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[13][14]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[9][14]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[5][14]~q\ 
-- ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[1][14]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[1][14]~q\,
	datab => \inst1|ALT_INV_regs[5][14]~q\,
	datac => \inst1|ALT_INV_regs[9][14]~q\,
	datad => \inst1|ALT_INV_regs[13][14]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux33~1_combout\);

\inst1|Mux33~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux33~2_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[14][14]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[10][14]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[6][14]~q\ 
-- ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[2][14]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[2][14]~q\,
	datab => \inst1|ALT_INV_regs[6][14]~q\,
	datac => \inst1|ALT_INV_regs[10][14]~q\,
	datad => \inst1|ALT_INV_regs[14][14]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux33~2_combout\);

\inst1|Mux33~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux33~3_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[15][14]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[11][14]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[7][14]~q\ 
-- ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[3][14]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[3][14]~q\,
	datab => \inst1|ALT_INV_regs[7][14]~q\,
	datac => \inst1|ALT_INV_regs[11][14]~q\,
	datad => \inst1|ALT_INV_regs[15][14]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux33~3_combout\);

\inst1|Mux33~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux33~4_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|Mux33~3_combout\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|Mux33~2_combout\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( 
-- \inst1|Mux33~1_combout\ ) ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|Mux33~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux33~0_combout\,
	datab => \inst1|ALT_INV_Mux33~1_combout\,
	datac => \inst1|ALT_INV_Mux33~2_combout\,
	datad => \inst1|ALT_INV_Mux33~3_combout\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux33~4_combout\);

\inst6|temp_op[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(14));

\inst4|OP2_Mux|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4|OP2_Mux|Mux1~0_combout\ = ( \inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst6|temp_op\(14) ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux33~4_combout\ ) ) ) 
-- # ( \inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux17~4_combout\ ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst|pc_counter\(14) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(14),
	datab => \inst1|ALT_INV_Mux17~4_combout\,
	datac => \inst1|ALT_INV_Mux33~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(14),
	datae => \inst5|ALT_INV_Op2_mux_select[0]~2_combout\,
	dataf => \inst5|ALT_INV_Op2_mux_select[1]~1_combout\,
	combout => \inst4|OP2_Mux|Mux1~0_combout\);

\inst4|temp_op2_out[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|OP2_Mux|Mux1~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op2_write~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|temp_op2_out\(14));

\inst15|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Add0~1_sumout\ = SUM(( !\inst2|temp_op1_out\(15) $ (((!\inst5|state.T3~q\) # ((!\inst5|Mux14~1_combout\) # (\inst6|temp_opcode\(5))))) ) + ( \inst4|temp_op2_out\(15) ) + ( \inst15|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000010011111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst5|ALT_INV_Mux14~1_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(15),
	dataf => \inst4|ALT_INV_temp_op2_out\(15),
	cin => \inst15|Add0~6\,
	sumout => \inst15|Add0~1_sumout\);

\inst15|Mux0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux0~2_combout\ = ( \inst4|temp_op2_out\(15) & ( \inst2|temp_op1_out\(15) & ( (\inst5|state.T3~q\ & (\inst5|Mux12~0_combout\ & \inst5|Mux13~1_combout\)) ) ) ) # ( !\inst4|temp_op2_out\(15) & ( \inst2|temp_op1_out\(15) & ( (\inst5|state.T3~q\ & 
-- (\inst5|Mux12~0_combout\ & (\inst5|Mux13~1_combout\ & \inst5|Mux14~0_combout\))) ) ) ) # ( \inst4|temp_op2_out\(15) & ( !\inst2|temp_op1_out\(15) & ( (\inst5|state.T3~q\ & (\inst5|Mux12~0_combout\ & (\inst5|Mux13~1_combout\ & \inst5|Mux14~0_combout\))) ) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000100000000000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_Mux12~0_combout\,
	datac => \inst5|ALT_INV_Mux13~1_combout\,
	datad => \inst5|ALT_INV_Mux14~0_combout\,
	datae => \inst4|ALT_INV_temp_op2_out\(15),
	dataf => \inst2|ALT_INV_temp_op1_out\(15),
	combout => \inst15|Mux0~2_combout\);

\inst15|Mux0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux0~3_combout\ = (\inst5|Mux14~0_combout\ & \inst4|temp_op2_out\(15))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_Mux14~0_combout\,
	datab => \inst4|ALT_INV_temp_op2_out\(15),
	combout => \inst15|Mux0~3_combout\);

\inst15|Mux0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux0~1_combout\ = ( \inst15|Mux0~2_combout\ & ( \inst15|Mux0~3_combout\ ) ) # ( !\inst15|Mux0~2_combout\ & ( \inst15|Mux0~3_combout\ & ( (!\inst15|Mux0~1_combout\ & (((\inst15|Add0~1_sumout\ & \inst15|Mux0~0_combout\)))) # (\inst15|Mux0~1_combout\ 
-- & (((\inst15|Add0~1_sumout\ & \inst15|Mux0~0_combout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( \inst15|Mux0~2_combout\ & ( !\inst15|Mux0~3_combout\ & ( ((!\inst15|Mux15~0_combout\) # ((\inst15|Add0~1_sumout\ & \inst15|Mux0~0_combout\))) # 
-- (\inst15|Mux0~1_combout\) ) ) ) # ( !\inst15|Mux0~2_combout\ & ( !\inst15|Mux0~3_combout\ & ( (!\inst15|Mux0~1_combout\ & (((\inst15|Add0~1_sumout\ & \inst15|Mux0~0_combout\)))) # (\inst15|Mux0~1_combout\ & (((\inst15|Add0~1_sumout\ & 
-- \inst15|Mux0~0_combout\)) # (\inst15|Mux15~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011111110111011101111100010001000111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux0~1_combout\,
	datab => \inst15|ALT_INV_Mux15~0_combout\,
	datac => \inst15|ALT_INV_Add0~1_sumout\,
	datad => \inst15|ALT_INV_Mux0~0_combout\,
	datae => \inst15|ALT_INV_Mux0~2_combout\,
	dataf => \inst15|ALT_INV_Mux0~3_combout\,
	combout => \inst15|Mux0~1_combout\);

\inst5|clr_z_flag~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|clr_z_flag~0_combout\ = ( \inst5|Mux16~0_combout\ & ( (((!\inst6|temp_opcode\(4)) # (!\inst5|state.T3~q\)) # (\inst6|temp_AM\(0))) # (\inst6|temp_AM\(1)) ) ) # ( !\inst5|Mux16~0_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111011111111111111111111111111111110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst6|ALT_INV_temp_opcode\(4),
	datad => \inst5|ALT_INV_state.T3~q\,
	datae => \inst5|ALT_INV_Mux16~0_combout\,
	combout => \inst5|clr_z_flag~0_combout\);

\inst15|z_flag~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|z_flag~3_combout\ = ( \inst15|Mux3~0_combout\ & ( \inst15|Mux4~0_combout\ & ( (\inst15|z_flag~q\ & (\inst5|Selector2~0_combout\ & \inst5|clr_z_flag~0_combout\)) ) ) ) # ( !\inst15|Mux3~0_combout\ & ( \inst15|Mux4~0_combout\ & ( (\inst15|z_flag~q\ 
-- & (\inst5|Selector2~0_combout\ & \inst5|clr_z_flag~0_combout\)) ) ) ) # ( \inst15|Mux3~0_combout\ & ( !\inst15|Mux4~0_combout\ & ( (\inst15|z_flag~q\ & (\inst5|Selector2~0_combout\ & \inst5|clr_z_flag~0_combout\)) ) ) ) # ( !\inst15|Mux3~0_combout\ & ( 
-- !\inst15|Mux4~0_combout\ & ( (\inst5|clr_z_flag~0_combout\ & ((!\inst5|Selector2~0_combout\ & ((!\inst15|Mux2~0_combout\))) # (\inst5|Selector2~0_combout\ & (\inst15|z_flag~q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110100000001000000010000000100000001000000010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_z_flag~q\,
	datab => \inst5|ALT_INV_Selector2~0_combout\,
	datac => \inst5|ALT_INV_clr_z_flag~0_combout\,
	datad => \inst15|ALT_INV_Mux2~0_combout\,
	datae => \inst15|ALT_INV_Mux3~0_combout\,
	dataf => \inst15|ALT_INV_Mux4~0_combout\,
	combout => \inst15|z_flag~3_combout\);

\inst15|z_flag~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|z_flag~4_combout\ = (!\inst15|Mux5~0_combout\ & (!\inst15|Mux10~0_combout\ & (!\inst15|Mux11~0_combout\ & !\inst15|Mux1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000010000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux5~0_combout\,
	datab => \inst15|ALT_INV_Mux10~0_combout\,
	datac => \inst15|ALT_INV_Mux11~0_combout\,
	datad => \inst15|ALT_INV_Mux1~0_combout\,
	combout => \inst15|z_flag~4_combout\);

\inst15|z_flag~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|z_flag~2_combout\ = ( \inst15|z_flag~3_combout\ & ( \inst15|z_flag~4_combout\ & ( ((\inst15|z_flag~0_combout\ & (\inst15|z_flag~1_combout\ & !\inst15|Mux0~1_combout\))) # (\inst5|Selector2~0_combout\) ) ) ) # ( \inst15|z_flag~3_combout\ & ( 
-- !\inst15|z_flag~4_combout\ & ( \inst5|Selector2~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101010101010100000000000000000101011101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_Selector2~0_combout\,
	datab => \inst15|ALT_INV_z_flag~0_combout\,
	datac => \inst15|ALT_INV_z_flag~1_combout\,
	datad => \inst15|ALT_INV_Mux0~1_combout\,
	datae => \inst15|ALT_INV_z_flag~3_combout\,
	dataf => \inst15|ALT_INV_z_flag~4_combout\,
	combout => \inst15|z_flag~2_combout\);

\inst15|z_flag\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst15|z_flag~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst15|z_flag~q\);

\inst5|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Selector0~0_combout\ = ( \inst6|temp_opcode\(2) & ( (!\inst6|temp_AM\(1) & (\inst6|temp_AM\(0) & (\inst15|z_flag~q\ & !\inst6|temp_opcode\(3)))) ) ) # ( !\inst6|temp_opcode\(2) & ( (\inst6|temp_AM\(0) & \inst6|temp_opcode\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011000000100000000000000000001100110000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst15|ALT_INV_z_flag~q\,
	datad => \inst6|ALT_INV_temp_opcode\(3),
	datae => \inst6|ALT_INV_temp_opcode\(2),
	combout => \inst5|Selector0~0_combout\);

\inst5|Selector0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Selector0~1_combout\ = ( \inst5|Selector0~0_combout\ & ( (!\inst5|Selector1~0_combout\) # ((\inst6|temp_opcode\(4) & (\inst5|Mux13~0_combout\ & \inst5|state.T4~q\))) ) ) # ( !\inst5|Selector0~0_combout\ & ( !\inst5|Selector1~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101110101010101010101010101010101011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_Selector1~0_combout\,
	datab => \inst6|ALT_INV_temp_opcode\(4),
	datac => \inst5|ALT_INV_Mux13~0_combout\,
	datad => \inst5|ALT_INV_state.T4~q\,
	datae => \inst5|ALT_INV_Selector0~0_combout\,
	combout => \inst5|Selector0~1_combout\);

\inst|pc_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~5_sumout\,
	asdata => \inst2|temp_op1_out\(14),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|Selector0~2_combout\,
	ena => \inst5|Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(14));

\inst2|OP1_Mux|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|OP1_Mux|Mux1~0_combout\ = ( \inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst6|temp_op\(14) ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux33~4_combout\ ) ) ) 
-- # ( \inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux17~4_combout\ ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst|pc_counter\(14) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(14),
	datab => \inst1|ALT_INV_Mux17~4_combout\,
	datac => \inst1|ALT_INV_Mux33~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(14),
	datae => \inst5|ALT_INV_Op1_mux_select[0]~3_combout\,
	dataf => \inst5|ALT_INV_Op1_mux_select[1]~2_combout\,
	combout => \inst2|OP1_Mux|Mux1~0_combout\);

\inst2|temp_op1_out[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|OP1_Mux|Mux1~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op1_write~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|temp_op1_out\(14));

\inst3|memory_rtl_0|auto_generated|ram_block1a14\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0000005D",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_0|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 14,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 14,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_0|auto_generated|ram_block1a14_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a14_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a14_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_0|auto_generated|ram_block1a14_PORTBDATAOUT_bus\);

\inst6|temp_AM[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a14~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_AM\(0));

\inst5|Selector1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Selector1~1_combout\ = (\inst5|state.T1_1~q\ & (!\inst6|temp_AM\(1) $ (!\inst6|temp_AM\(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011000000110000001100000011000000110000001100000011000000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst5|ALT_INV_state.T1_1~q\,
	combout => \inst5|Selector1~1_combout\);

\inst6|temp_op[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(7));

\inst4|OP2_Mux|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4|OP2_Mux|Mux8~0_combout\ = ( \inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst6|temp_op\(7) ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux40~4_combout\ ) ) ) 
-- # ( \inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux24~4_combout\ ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst|pc_counter\(7) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(7),
	datab => \inst1|ALT_INV_Mux24~4_combout\,
	datac => \inst1|ALT_INV_Mux40~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(7),
	datae => \inst5|ALT_INV_Op2_mux_select[0]~2_combout\,
	dataf => \inst5|ALT_INV_Op2_mux_select[1]~1_combout\,
	combout => \inst4|OP2_Mux|Mux8~0_combout\);

\inst4|temp_op2_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|OP2_Mux|Mux8~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op2_write~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|temp_op2_out\(7));

\inst15|Mux8~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux8~1_combout\ = ( \inst4|temp_op2_out\(7) & ( (\inst5|state.T3~q\ & (\inst5|Mux12~0_combout\ & ((\inst2|temp_op1_out\(7)) # (\inst5|Mux14~0_combout\)))) ) ) # ( !\inst4|temp_op2_out\(7) & ( (\inst5|state.T3~q\ & (\inst5|Mux12~0_combout\ & 
-- (\inst5|Mux14~0_combout\ & \inst2|temp_op1_out\(7)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000010001000100000000000000010000000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_Mux12~0_combout\,
	datac => \inst5|ALT_INV_Mux14~0_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(7),
	datae => \inst4|ALT_INV_temp_op2_out\(7),
	combout => \inst15|Mux8~1_combout\);

\inst15|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux8~0_combout\ = ( \inst5|Mux13~1_combout\ & ( \inst15|Mux8~1_combout\ ) ) # ( !\inst5|Mux13~1_combout\ & ( \inst15|Mux8~1_combout\ & ( (!\inst15|Mux8~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~33_sumout\)))) # 
-- (\inst15|Mux8~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~33_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( \inst5|Mux13~1_combout\ & ( !\inst15|Mux8~1_combout\ & ( (!\inst15|Mux8~0_combout\ & (((\inst15|Mux0~0_combout\ & 
-- \inst15|Add0~33_sumout\)))) # (\inst15|Mux8~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~33_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( !\inst5|Mux13~1_combout\ & ( !\inst15|Mux8~1_combout\ & ( (!\inst15|Mux8~0_combout\ & 
-- (((\inst15|Mux0~0_combout\ & \inst15|Add0~33_sumout\)))) # (\inst15|Mux8~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~33_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011111000100010001111100010001000111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux8~0_combout\,
	datab => \inst15|ALT_INV_Mux15~0_combout\,
	datac => \inst15|ALT_INV_Mux0~0_combout\,
	datad => \inst15|ALT_INV_Add0~33_sumout\,
	datae => \inst5|ALT_INV_Mux13~1_combout\,
	dataf => \inst15|ALT_INV_Mux8~1_combout\,
	combout => \inst15|Mux8~0_combout\);

\Sip_in[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sip_in(7),
	o => \Sip_in[7]~input_o\);

\inst7|sip_r[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Sip_in[7]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sip_r\(7));

\inst3|memory_rtl_1|auto_generated|ram_block1a7\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000045",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_1|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 7,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_1|auto_generated|ram_block1a7_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a7_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a7_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_1|auto_generated|ram_block1a7_PORTBDATAOUT_bus\);

\inst1|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux8~0_combout\ = (!\inst4|temp_op2_out\(7) & (\inst3|memory_rtl_1|auto_generated|ram_block1a7~portbdataout\ & ((\inst1|Mux0~1_combout\)))) # (\inst4|temp_op2_out\(7) & ((!\inst1|Mux1~1_combout\) # 
-- ((\inst3|memory_rtl_1|auto_generated|ram_block1a7~portbdataout\ & \inst1|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001110011010100000111001101010000011100110101000001110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(7),
	datab => \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a7~portbdataout\,
	datac => \inst1|ALT_INV_Mux1~1_combout\,
	datad => \inst1|ALT_INV_Mux0~1_combout\,
	combout => \inst1|Mux8~0_combout\);

\inst1|Mux8~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux8~1_combout\ = ( \inst1|Mux8~0_combout\ ) # ( !\inst1|Mux8~0_combout\ & ( (\inst1|Mux0~0_combout\ & ((!\inst1|Mux1~0_combout\ & (\inst15|Mux8~0_combout\)) # (\inst1|Mux1~0_combout\ & ((\inst7|sip_r\(7)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000111111111111111111100000100000001111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux8~0_combout\,
	datab => \inst1|ALT_INV_Mux1~0_combout\,
	datac => \inst1|ALT_INV_Mux0~0_combout\,
	datad => \inst7|ALT_INV_sip_r\(7),
	datae => \inst1|ALT_INV_Mux8~0_combout\,
	combout => \inst1|Mux8~1_combout\);

\inst1|regs[0][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux8~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[0][7]~q\);

\inst1|Mux24~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux24~0_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[3][7]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[2][7]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[1][7]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[0][7]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][7]~q\,
	datab => \inst1|ALT_INV_regs[1][7]~q\,
	datac => \inst1|ALT_INV_regs[2][7]~q\,
	datad => \inst1|ALT_INV_regs[3][7]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux24~0_combout\);

\inst1|Mux24~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux24~1_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[7][7]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[6][7]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[5][7]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[4][7]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[4][7]~q\,
	datab => \inst1|ALT_INV_regs[5][7]~q\,
	datac => \inst1|ALT_INV_regs[6][7]~q\,
	datad => \inst1|ALT_INV_regs[7][7]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux24~1_combout\);

\inst1|Mux24~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux24~2_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[11][7]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[10][7]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[9][7]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[8][7]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[8][7]~q\,
	datab => \inst1|ALT_INV_regs[9][7]~q\,
	datac => \inst1|ALT_INV_regs[10][7]~q\,
	datad => \inst1|ALT_INV_regs[11][7]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux24~2_combout\);

\inst1|Mux24~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux24~3_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[15][7]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[14][7]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[13][7]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[12][7]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[12][7]~q\,
	datab => \inst1|ALT_INV_regs[13][7]~q\,
	datac => \inst1|ALT_INV_regs[14][7]~q\,
	datad => \inst1|ALT_INV_regs[15][7]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux24~3_combout\);

\inst1|Mux24~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux24~4_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|Mux24~3_combout\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|Mux24~2_combout\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( 
-- \inst1|Mux24~1_combout\ ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|Mux24~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux24~0_combout\,
	datab => \inst1|ALT_INV_Mux24~1_combout\,
	datac => \inst1|ALT_INV_Mux24~2_combout\,
	datad => \inst1|ALT_INV_Mux24~3_combout\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux24~4_combout\);

\inst2|OP1_Mux|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|OP1_Mux|Mux8~0_combout\ = ( \inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst6|temp_op\(7) ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux40~4_combout\ ) ) ) 
-- # ( \inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux24~4_combout\ ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst|pc_counter\(7) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(7),
	datab => \inst1|ALT_INV_Mux24~4_combout\,
	datac => \inst1|ALT_INV_Mux40~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(7),
	datae => \inst5|ALT_INV_Op1_mux_select[0]~3_combout\,
	dataf => \inst5|ALT_INV_Op1_mux_select[1]~2_combout\,
	combout => \inst2|OP1_Mux|Mux8~0_combout\);

\inst2|temp_op1_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|OP1_Mux|Mux8~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op1_write~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|temp_op1_out\(7));

\inst3|memory_rtl_0|auto_generated|ram_block1a7\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000045",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_0|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 7,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_0|auto_generated|ram_block1a7_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a7_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a7_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_0|auto_generated|ram_block1a7_PORTBDATAOUT_bus\);

\inst6|temp_rz[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a7~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_rz\(3));

\inst1|Mux41~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux41~0_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[12][6]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[8][6]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[4][6]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[0][6]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][6]~q\,
	datab => \inst1|ALT_INV_regs[4][6]~q\,
	datac => \inst1|ALT_INV_regs[8][6]~q\,
	datad => \inst1|ALT_INV_regs[12][6]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux41~0_combout\);

\inst1|regs[1][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux9~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[1][6]~q\);

\inst1|regs[5][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux9~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[5][6]~q\);

\inst1|regs[9][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux9~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[9][6]~q\);

\inst1|regs[13][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux9~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[13][6]~q\);

\inst1|Mux41~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux41~1_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[13][6]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[9][6]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[5][6]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[1][6]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[1][6]~q\,
	datab => \inst1|ALT_INV_regs[5][6]~q\,
	datac => \inst1|ALT_INV_regs[9][6]~q\,
	datad => \inst1|ALT_INV_regs[13][6]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux41~1_combout\);

\inst1|regs[2][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux9~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[2][6]~q\);

\inst1|regs[6][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux9~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[6][6]~q\);

\inst1|regs[10][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux9~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[10][6]~q\);

\inst1|regs[14][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux9~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[14][6]~q\);

\inst1|Mux41~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux41~2_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[14][6]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[10][6]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[6][6]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[2][6]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[2][6]~q\,
	datab => \inst1|ALT_INV_regs[6][6]~q\,
	datac => \inst1|ALT_INV_regs[10][6]~q\,
	datad => \inst1|ALT_INV_regs[14][6]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux41~2_combout\);

\inst1|regs[3][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux9~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[3][6]~q\);

\inst1|regs[7][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux9~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[7][6]~q\);

\inst1|regs[11][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux9~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[11][6]~q\);

\inst1|regs[15][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux9~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[15][6]~q\);

\inst1|Mux41~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux41~3_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[15][6]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[11][6]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[7][6]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[3][6]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[3][6]~q\,
	datab => \inst1|ALT_INV_regs[7][6]~q\,
	datac => \inst1|ALT_INV_regs[11][6]~q\,
	datad => \inst1|ALT_INV_regs[15][6]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux41~3_combout\);

\inst1|Mux41~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux41~4_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|Mux41~3_combout\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|Mux41~2_combout\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( 
-- \inst1|Mux41~1_combout\ ) ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|Mux41~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux41~0_combout\,
	datab => \inst1|ALT_INV_Mux41~1_combout\,
	datac => \inst1|ALT_INV_Mux41~2_combout\,
	datad => \inst1|ALT_INV_Mux41~3_combout\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux41~4_combout\);

\inst6|temp_op[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(6));

\inst4|OP2_Mux|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4|OP2_Mux|Mux9~0_combout\ = ( \inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst6|temp_op\(6) ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux41~4_combout\ ) ) ) 
-- # ( \inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux25~4_combout\ ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst|pc_counter\(6) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(6),
	datab => \inst1|ALT_INV_Mux25~4_combout\,
	datac => \inst1|ALT_INV_Mux41~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(6),
	datae => \inst5|ALT_INV_Op2_mux_select[0]~2_combout\,
	dataf => \inst5|ALT_INV_Op2_mux_select[1]~1_combout\,
	combout => \inst4|OP2_Mux|Mux9~0_combout\);

\inst4|temp_op2_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|OP2_Mux|Mux9~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op2_write~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|temp_op2_out\(6));

\inst15|Mux9~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux9~1_combout\ = ( \inst4|temp_op2_out\(6) & ( (\inst5|state.T3~q\ & (\inst5|Mux12~0_combout\ & ((\inst2|temp_op1_out\(6)) # (\inst5|Mux14~0_combout\)))) ) ) # ( !\inst4|temp_op2_out\(6) & ( (\inst5|state.T3~q\ & (\inst5|Mux12~0_combout\ & 
-- (\inst5|Mux14~0_combout\ & \inst2|temp_op1_out\(6)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000010001000100000000000000010000000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_Mux12~0_combout\,
	datac => \inst5|ALT_INV_Mux14~0_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(6),
	datae => \inst4|ALT_INV_temp_op2_out\(6),
	combout => \inst15|Mux9~1_combout\);

\inst15|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux9~0_combout\ = ( \inst5|Mux13~1_combout\ & ( \inst15|Mux9~1_combout\ ) ) # ( !\inst5|Mux13~1_combout\ & ( \inst15|Mux9~1_combout\ & ( (!\inst15|Mux9~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~37_sumout\)))) # 
-- (\inst15|Mux9~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~37_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( \inst5|Mux13~1_combout\ & ( !\inst15|Mux9~1_combout\ & ( (!\inst15|Mux9~0_combout\ & (((\inst15|Mux0~0_combout\ & 
-- \inst15|Add0~37_sumout\)))) # (\inst15|Mux9~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~37_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( !\inst5|Mux13~1_combout\ & ( !\inst15|Mux9~1_combout\ & ( (!\inst15|Mux9~0_combout\ & 
-- (((\inst15|Mux0~0_combout\ & \inst15|Add0~37_sumout\)))) # (\inst15|Mux9~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~37_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011111000100010001111100010001000111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux9~0_combout\,
	datab => \inst15|ALT_INV_Mux15~0_combout\,
	datac => \inst15|ALT_INV_Mux0~0_combout\,
	datad => \inst15|ALT_INV_Add0~37_sumout\,
	datae => \inst5|ALT_INV_Mux13~1_combout\,
	dataf => \inst15|ALT_INV_Mux9~1_combout\,
	combout => \inst15|Mux9~0_combout\);

\Sip_in[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sip_in(6),
	o => \Sip_in[6]~input_o\);

\inst7|sip_r[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Sip_in[6]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sip_r\(6));

\inst3|memory_rtl_1|auto_generated|ram_block1a6\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000045",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_1|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 6,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_1|auto_generated|ram_block1a6_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a6_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a6_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_1|auto_generated|ram_block1a6_PORTBDATAOUT_bus\);

\inst1|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux9~0_combout\ = (!\inst4|temp_op2_out\(6) & (\inst3|memory_rtl_1|auto_generated|ram_block1a6~portbdataout\ & ((\inst1|Mux0~1_combout\)))) # (\inst4|temp_op2_out\(6) & ((!\inst1|Mux1~1_combout\) # 
-- ((\inst3|memory_rtl_1|auto_generated|ram_block1a6~portbdataout\ & \inst1|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001110011010100000111001101010000011100110101000001110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(6),
	datab => \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a6~portbdataout\,
	datac => \inst1|ALT_INV_Mux1~1_combout\,
	datad => \inst1|ALT_INV_Mux0~1_combout\,
	combout => \inst1|Mux9~0_combout\);

\inst1|Mux9~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux9~1_combout\ = ( \inst1|Mux9~0_combout\ ) # ( !\inst1|Mux9~0_combout\ & ( (\inst1|Mux0~0_combout\ & ((!\inst1|Mux1~0_combout\ & (\inst15|Mux9~0_combout\)) # (\inst1|Mux1~0_combout\ & ((\inst7|sip_r\(6)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000111111111111111111100000100000001111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux9~0_combout\,
	datab => \inst1|ALT_INV_Mux1~0_combout\,
	datac => \inst1|ALT_INV_Mux0~0_combout\,
	datad => \inst7|ALT_INV_sip_r\(6),
	datae => \inst1|ALT_INV_Mux9~0_combout\,
	combout => \inst1|Mux9~1_combout\);

\inst1|regs[0][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux9~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[0][6]~q\);

\inst1|Mux25~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux25~0_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[12][6]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[8][6]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[4][6]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[0][6]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][6]~q\,
	datab => \inst1|ALT_INV_regs[4][6]~q\,
	datac => \inst1|ALT_INV_regs[8][6]~q\,
	datad => \inst1|ALT_INV_regs[12][6]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux25~0_combout\);

\inst1|Mux25~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux25~1_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[13][6]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[9][6]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[5][6]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[1][6]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[1][6]~q\,
	datab => \inst1|ALT_INV_regs[5][6]~q\,
	datac => \inst1|ALT_INV_regs[9][6]~q\,
	datad => \inst1|ALT_INV_regs[13][6]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux25~1_combout\);

\inst1|Mux25~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux25~2_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[14][6]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[10][6]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[6][6]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[2][6]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[2][6]~q\,
	datab => \inst1|ALT_INV_regs[6][6]~q\,
	datac => \inst1|ALT_INV_regs[10][6]~q\,
	datad => \inst1|ALT_INV_regs[14][6]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux25~2_combout\);

\inst1|Mux25~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux25~3_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[15][6]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[11][6]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[7][6]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[3][6]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[3][6]~q\,
	datab => \inst1|ALT_INV_regs[7][6]~q\,
	datac => \inst1|ALT_INV_regs[11][6]~q\,
	datad => \inst1|ALT_INV_regs[15][6]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux25~3_combout\);

\inst1|Mux25~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux25~4_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|Mux25~3_combout\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|Mux25~2_combout\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( 
-- \inst1|Mux25~1_combout\ ) ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|Mux25~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux25~0_combout\,
	datab => \inst1|ALT_INV_Mux25~1_combout\,
	datac => \inst1|ALT_INV_Mux25~2_combout\,
	datad => \inst1|ALT_INV_Mux25~3_combout\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux25~4_combout\);

\inst2|OP1_Mux|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|OP1_Mux|Mux9~0_combout\ = ( \inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst6|temp_op\(6) ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux41~4_combout\ ) ) ) 
-- # ( \inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux25~4_combout\ ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst|pc_counter\(6) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(6),
	datab => \inst1|ALT_INV_Mux25~4_combout\,
	datac => \inst1|ALT_INV_Mux41~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(6),
	datae => \inst5|ALT_INV_Op1_mux_select[0]~3_combout\,
	dataf => \inst5|ALT_INV_Op1_mux_select[1]~2_combout\,
	combout => \inst2|OP1_Mux|Mux9~0_combout\);

\inst2|temp_op1_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|OP1_Mux|Mux9~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op1_write~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|temp_op1_out\(6));

\inst3|memory_rtl_0|auto_generated|ram_block1a6\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000045",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_0|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 6,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_0|auto_generated|ram_block1a6_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a6_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a6_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_0|auto_generated|ram_block1a6_PORTBDATAOUT_bus\);

\inst6|temp_rz[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a6~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_rz\(2));

\inst1|Decoder0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Decoder0~1_combout\ = ( !\inst6|temp_rz\(3) & ( (\inst5|ld_r~1_combout\ & (\inst6|temp_rz\(0) & (!\inst6|temp_rz\(1) & !\inst6|temp_rz\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000000000000000000000000000010000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~1_combout\,
	datab => \inst6|ALT_INV_temp_rz\(0),
	datac => \inst6|ALT_INV_temp_rz\(1),
	datad => \inst6|ALT_INV_temp_rz\(2),
	datae => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Decoder0~1_combout\);

\inst1|regs[1][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux10~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[1][5]~q\);

\inst1|regs[2][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux10~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[2][5]~q\);

\inst1|regs[3][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux10~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[3][5]~q\);

\inst1|Mux42~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux42~0_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[3][5]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[2][5]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[1][5]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[0][5]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][5]~q\,
	datab => \inst1|ALT_INV_regs[1][5]~q\,
	datac => \inst1|ALT_INV_regs[2][5]~q\,
	datad => \inst1|ALT_INV_regs[3][5]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux42~0_combout\);

\inst1|regs[4][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux10~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[4][5]~q\);

\inst1|regs[5][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux10~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[5][5]~q\);

\inst1|regs[6][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux10~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[6][5]~q\);

\inst1|regs[7][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux10~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[7][5]~q\);

\inst1|Mux42~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux42~1_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[7][5]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[6][5]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[5][5]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[4][5]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[4][5]~q\,
	datab => \inst1|ALT_INV_regs[5][5]~q\,
	datac => \inst1|ALT_INV_regs[6][5]~q\,
	datad => \inst1|ALT_INV_regs[7][5]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux42~1_combout\);

\inst1|regs[8][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux10~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[8][5]~q\);

\inst1|regs[9][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux10~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[9][5]~q\);

\inst1|regs[10][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux10~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[10][5]~q\);

\inst1|regs[11][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux10~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[11][5]~q\);

\inst1|Mux42~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux42~2_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[11][5]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[10][5]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[9][5]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[8][5]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[8][5]~q\,
	datab => \inst1|ALT_INV_regs[9][5]~q\,
	datac => \inst1|ALT_INV_regs[10][5]~q\,
	datad => \inst1|ALT_INV_regs[11][5]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux42~2_combout\);

\inst1|regs[12][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux10~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[12][5]~q\);

\inst1|regs[13][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux10~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[13][5]~q\);

\inst1|regs[14][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux10~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[14][5]~q\);

\inst1|regs[15][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux10~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[15][5]~q\);

\inst1|Mux42~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux42~3_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[15][5]~q\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|regs[14][5]~q\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[13][5]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|regs[12][5]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[12][5]~q\,
	datab => \inst1|ALT_INV_regs[13][5]~q\,
	datac => \inst1|ALT_INV_regs[14][5]~q\,
	datad => \inst1|ALT_INV_regs[15][5]~q\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux42~3_combout\);

\inst1|Mux42~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux42~4_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|Mux42~3_combout\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|Mux42~2_combout\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( 
-- \inst1|Mux42~1_combout\ ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|Mux42~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux42~0_combout\,
	datab => \inst1|ALT_INV_Mux42~1_combout\,
	datac => \inst1|ALT_INV_Mux42~2_combout\,
	datad => \inst1|ALT_INV_Mux42~3_combout\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux42~4_combout\);

\inst6|temp_op[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(5));

\inst4|OP2_Mux|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4|OP2_Mux|Mux10~0_combout\ = ( \inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst6|temp_op\(5) ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux42~4_combout\ ) ) ) 
-- # ( \inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux26~4_combout\ ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst|pc_counter\(5) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(5),
	datab => \inst1|ALT_INV_Mux26~4_combout\,
	datac => \inst1|ALT_INV_Mux42~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(5),
	datae => \inst5|ALT_INV_Op2_mux_select[0]~2_combout\,
	dataf => \inst5|ALT_INV_Op2_mux_select[1]~1_combout\,
	combout => \inst4|OP2_Mux|Mux10~0_combout\);

\inst4|temp_op2_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|OP2_Mux|Mux10~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op2_write~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|temp_op2_out\(5));

\inst15|Mux10~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux10~1_combout\ = ( \inst4|temp_op2_out\(5) & ( (\inst5|state.T3~q\ & (\inst5|Mux13~1_combout\ & ((\inst2|temp_op1_out\(5)) # (\inst5|Mux14~0_combout\)))) ) ) # ( !\inst4|temp_op2_out\(5) & ( (\inst5|state.T3~q\ & (\inst5|Mux13~1_combout\ & 
-- (\inst5|Mux14~0_combout\ & \inst2|temp_op1_out\(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000010001000100000000000000010000000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_Mux13~1_combout\,
	datac => \inst5|ALT_INV_Mux14~0_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(5),
	datae => \inst4|ALT_INV_temp_op2_out\(5),
	combout => \inst15|Mux10~1_combout\);

\inst15|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux10~0_combout\ = ( \inst5|Mux12~0_combout\ & ( \inst15|Mux10~1_combout\ ) ) # ( !\inst5|Mux12~0_combout\ & ( \inst15|Mux10~1_combout\ & ( (!\inst15|Mux10~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~41_sumout\)))) # 
-- (\inst15|Mux10~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~41_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( \inst5|Mux12~0_combout\ & ( !\inst15|Mux10~1_combout\ & ( (!\inst15|Mux10~0_combout\ & (((\inst15|Mux0~0_combout\ & 
-- \inst15|Add0~41_sumout\)))) # (\inst15|Mux10~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~41_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( !\inst5|Mux12~0_combout\ & ( !\inst15|Mux10~1_combout\ & ( (!\inst15|Mux10~0_combout\ & 
-- (((\inst15|Mux0~0_combout\ & \inst15|Add0~41_sumout\)))) # (\inst15|Mux10~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~41_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011111000100010001111100010001000111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux10~0_combout\,
	datab => \inst15|ALT_INV_Mux15~0_combout\,
	datac => \inst15|ALT_INV_Mux0~0_combout\,
	datad => \inst15|ALT_INV_Add0~41_sumout\,
	datae => \inst5|ALT_INV_Mux12~0_combout\,
	dataf => \inst15|ALT_INV_Mux10~1_combout\,
	combout => \inst15|Mux10~0_combout\);

\Sip_in[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sip_in(5),
	o => \Sip_in[5]~input_o\);

\inst7|sip_r[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Sip_in[5]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sip_r\(5));

\inst3|memory_rtl_1|auto_generated|ram_block1a5\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "00000003",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_1|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 5,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_1|auto_generated|ram_block1a5_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a5_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a5_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_1|auto_generated|ram_block1a5_PORTBDATAOUT_bus\);

\inst1|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux10~0_combout\ = (!\inst4|temp_op2_out\(5) & (\inst3|memory_rtl_1|auto_generated|ram_block1a5~portbdataout\ & ((\inst1|Mux0~1_combout\)))) # (\inst4|temp_op2_out\(5) & ((!\inst1|Mux1~1_combout\) # 
-- ((\inst3|memory_rtl_1|auto_generated|ram_block1a5~portbdataout\ & \inst1|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001110011010100000111001101010000011100110101000001110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(5),
	datab => \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a5~portbdataout\,
	datac => \inst1|ALT_INV_Mux1~1_combout\,
	datad => \inst1|ALT_INV_Mux0~1_combout\,
	combout => \inst1|Mux10~0_combout\);

\inst1|Mux10~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux10~1_combout\ = ( \inst1|Mux10~0_combout\ ) # ( !\inst1|Mux10~0_combout\ & ( (\inst1|Mux0~0_combout\ & ((!\inst1|Mux1~0_combout\ & (\inst15|Mux10~0_combout\)) # (\inst1|Mux1~0_combout\ & ((\inst7|sip_r\(5)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000111111111111111111100000100000001111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux10~0_combout\,
	datab => \inst1|ALT_INV_Mux1~0_combout\,
	datac => \inst1|ALT_INV_Mux0~0_combout\,
	datad => \inst7|ALT_INV_sip_r\(5),
	datae => \inst1|ALT_INV_Mux10~0_combout\,
	combout => \inst1|Mux10~1_combout\);

\inst1|regs[0][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux10~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[0][5]~q\);

\inst1|Mux26~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux26~0_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[3][5]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[2][5]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[1][5]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[0][5]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][5]~q\,
	datab => \inst1|ALT_INV_regs[1][5]~q\,
	datac => \inst1|ALT_INV_regs[2][5]~q\,
	datad => \inst1|ALT_INV_regs[3][5]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux26~0_combout\);

\inst1|Mux26~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux26~1_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[7][5]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[6][5]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[5][5]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[4][5]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[4][5]~q\,
	datab => \inst1|ALT_INV_regs[5][5]~q\,
	datac => \inst1|ALT_INV_regs[6][5]~q\,
	datad => \inst1|ALT_INV_regs[7][5]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux26~1_combout\);

\inst1|Mux26~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux26~2_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[11][5]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[10][5]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[9][5]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[8][5]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[8][5]~q\,
	datab => \inst1|ALT_INV_regs[9][5]~q\,
	datac => \inst1|ALT_INV_regs[10][5]~q\,
	datad => \inst1|ALT_INV_regs[11][5]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux26~2_combout\);

\inst1|Mux26~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux26~3_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[15][5]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[14][5]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[13][5]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[12][5]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[12][5]~q\,
	datab => \inst1|ALT_INV_regs[13][5]~q\,
	datac => \inst1|ALT_INV_regs[14][5]~q\,
	datad => \inst1|ALT_INV_regs[15][5]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux26~3_combout\);

\inst1|Mux26~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux26~4_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|Mux26~3_combout\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|Mux26~2_combout\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( 
-- \inst1|Mux26~1_combout\ ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|Mux26~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux26~0_combout\,
	datab => \inst1|ALT_INV_Mux26~1_combout\,
	datac => \inst1|ALT_INV_Mux26~2_combout\,
	datad => \inst1|ALT_INV_Mux26~3_combout\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux26~4_combout\);

\inst2|OP1_Mux|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|OP1_Mux|Mux10~0_combout\ = ( \inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst6|temp_op\(5) ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux42~4_combout\ ) ) ) 
-- # ( \inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux26~4_combout\ ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst|pc_counter\(5) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(5),
	datab => \inst1|ALT_INV_Mux26~4_combout\,
	datac => \inst1|ALT_INV_Mux42~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(5),
	datae => \inst5|ALT_INV_Op1_mux_select[0]~3_combout\,
	dataf => \inst5|ALT_INV_Op1_mux_select[1]~2_combout\,
	combout => \inst2|OP1_Mux|Mux10~0_combout\);

\inst2|temp_op1_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|OP1_Mux|Mux10~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op1_write~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|temp_op1_out\(5));

\inst3|memory_rtl_0|auto_generated|ram_block1a5\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "00000003",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_0|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 5,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_0|auto_generated|ram_block1a5_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a5_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a5_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_0|auto_generated|ram_block1a5_PORTBDATAOUT_bus\);

\inst6|temp_rz[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a5~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_rz\(1));

\inst1|Decoder0~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Decoder0~12_combout\ = ( \inst6|temp_rz\(3) & ( (\inst5|ld_r~1_combout\ & (!\inst6|temp_rz\(0) & (!\inst6|temp_rz\(1) & \inst6|temp_rz\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000100000000000000000000000000000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~1_combout\,
	datab => \inst6|ALT_INV_temp_rz\(0),
	datac => \inst6|ALT_INV_temp_rz\(1),
	datad => \inst6|ALT_INV_temp_rz\(2),
	datae => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Decoder0~12_combout\);

\inst1|regs[12][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux11~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[12][4]~q\);

\inst1|Mux43~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux43~0_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[12][4]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[8][4]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[4][4]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[0][4]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][4]~q\,
	datab => \inst1|ALT_INV_regs[4][4]~q\,
	datac => \inst1|ALT_INV_regs[8][4]~q\,
	datad => \inst1|ALT_INV_regs[12][4]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux43~0_combout\);

\inst1|regs[1][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux11~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[1][4]~q\);

\inst1|regs[5][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux11~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[5][4]~q\);

\inst1|regs[9][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux11~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[9][4]~q\);

\inst1|regs[13][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux11~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[13][4]~q\);

\inst1|Mux43~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux43~1_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[13][4]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[9][4]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[5][4]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[1][4]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[1][4]~q\,
	datab => \inst1|ALT_INV_regs[5][4]~q\,
	datac => \inst1|ALT_INV_regs[9][4]~q\,
	datad => \inst1|ALT_INV_regs[13][4]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux43~1_combout\);

\inst1|regs[2][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux11~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[2][4]~q\);

\inst1|regs[6][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux11~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[6][4]~q\);

\inst1|regs[10][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux11~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[10][4]~q\);

\inst1|regs[14][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux11~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[14][4]~q\);

\inst1|Mux43~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux43~2_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[14][4]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[10][4]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[6][4]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[2][4]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[2][4]~q\,
	datab => \inst1|ALT_INV_regs[6][4]~q\,
	datac => \inst1|ALT_INV_regs[10][4]~q\,
	datad => \inst1|ALT_INV_regs[14][4]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux43~2_combout\);

\inst1|regs[3][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux11~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[3][4]~q\);

\inst1|regs[7][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux11~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[7][4]~q\);

\inst1|regs[11][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux11~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[11][4]~q\);

\inst1|regs[15][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux11~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[15][4]~q\);

\inst1|Mux43~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux43~3_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[15][4]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[11][4]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[7][4]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[3][4]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[3][4]~q\,
	datab => \inst1|ALT_INV_regs[7][4]~q\,
	datac => \inst1|ALT_INV_regs[11][4]~q\,
	datad => \inst1|ALT_INV_regs[15][4]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux43~3_combout\);

\inst1|Mux43~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux43~4_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|Mux43~3_combout\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|Mux43~2_combout\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( 
-- \inst1|Mux43~1_combout\ ) ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|Mux43~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux43~0_combout\,
	datab => \inst1|ALT_INV_Mux43~1_combout\,
	datac => \inst1|ALT_INV_Mux43~2_combout\,
	datad => \inst1|ALT_INV_Mux43~3_combout\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux43~4_combout\);

\inst6|temp_op[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(4));

\inst4|OP2_Mux|Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4|OP2_Mux|Mux11~0_combout\ = ( \inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst6|temp_op\(4) ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux43~4_combout\ ) ) ) 
-- # ( \inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux27~4_combout\ ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst|pc_counter\(4) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(4),
	datab => \inst1|ALT_INV_Mux27~4_combout\,
	datac => \inst1|ALT_INV_Mux43~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(4),
	datae => \inst5|ALT_INV_Op2_mux_select[0]~2_combout\,
	dataf => \inst5|ALT_INV_Op2_mux_select[1]~1_combout\,
	combout => \inst4|OP2_Mux|Mux11~0_combout\);

\inst4|temp_op2_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|OP2_Mux|Mux11~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op2_write~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|temp_op2_out\(4));

\inst15|Mux11~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux11~1_combout\ = ( \inst4|temp_op2_out\(4) & ( (!\inst5|Mux14~0_combout\ & ((!\inst5|Mux13~1_combout\) # ((\inst5|Mux12~0_combout\ & \inst2|temp_op1_out\(4))))) # (\inst5|Mux14~0_combout\ & (\inst5|Mux12~0_combout\)) ) ) # ( 
-- !\inst4|temp_op2_out\(4) & ( (!\inst5|Mux14~0_combout\ & (((!\inst5|Mux13~1_combout\)))) # (\inst5|Mux14~0_combout\ & (\inst5|Mux12~0_combout\ & ((!\inst5|Mux13~1_combout\) # (\inst2|temp_op1_out\(4))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100010011000101110001011101010111000100110001011100010111010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_Mux12~0_combout\,
	datab => \inst5|ALT_INV_Mux13~1_combout\,
	datac => \inst5|ALT_INV_Mux14~0_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(4),
	datae => \inst4|ALT_INV_temp_op2_out\(4),
	combout => \inst15|Mux11~1_combout\);

\inst15|Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux11~0_combout\ = ( \inst5|Mux13~1_combout\ & ( \inst15|Mux11~1_combout\ & ( (!\inst15|Mux15~0_combout\ & (((\inst5|state.T3~q\) # (\inst15|Add0~45_sumout\)))) # (\inst15|Mux15~0_combout\ & (\inst15|Mux11~0_combout\)) ) ) ) # ( 
-- !\inst5|Mux13~1_combout\ & ( \inst15|Mux11~1_combout\ & ( (!\inst15|Mux15~0_combout\ & ((\inst15|Add0~45_sumout\))) # (\inst15|Mux15~0_combout\ & (\inst15|Mux11~0_combout\)) ) ) ) # ( \inst5|Mux13~1_combout\ & ( !\inst15|Mux11~1_combout\ & ( 
-- (!\inst15|Mux15~0_combout\ & (((\inst15|Add0~45_sumout\ & !\inst5|state.T3~q\)))) # (\inst15|Mux15~0_combout\ & (\inst15|Mux11~0_combout\)) ) ) ) # ( !\inst5|Mux13~1_combout\ & ( !\inst15|Mux11~1_combout\ & ( (!\inst15|Mux15~0_combout\ & 
-- (((\inst15|Add0~45_sumout\ & !\inst5|state.T3~q\)))) # (\inst15|Mux15~0_combout\ & (\inst15|Mux11~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100010001000111010001000100011101000111010001110111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux11~0_combout\,
	datab => \inst15|ALT_INV_Mux15~0_combout\,
	datac => \inst15|ALT_INV_Add0~45_sumout\,
	datad => \inst5|ALT_INV_state.T3~q\,
	datae => \inst5|ALT_INV_Mux13~1_combout\,
	dataf => \inst15|ALT_INV_Mux11~1_combout\,
	combout => \inst15|Mux11~0_combout\);

\Sip_in[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sip_in(4),
	o => \Sip_in[4]~input_o\);

\inst7|sip_r[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Sip_in[4]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sip_r\(4));

\inst3|memory_rtl_1|auto_generated|ram_block1a4\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "00000064",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_1|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_1|auto_generated|ram_block1a4_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a4_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a4_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_1|auto_generated|ram_block1a4_PORTBDATAOUT_bus\);

\inst1|Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux11~0_combout\ = (!\inst4|temp_op2_out\(4) & (\inst3|memory_rtl_1|auto_generated|ram_block1a4~portbdataout\ & ((\inst1|Mux0~1_combout\)))) # (\inst4|temp_op2_out\(4) & ((!\inst1|Mux1~1_combout\) # 
-- ((\inst3|memory_rtl_1|auto_generated|ram_block1a4~portbdataout\ & \inst1|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001110011010100000111001101010000011100110101000001110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(4),
	datab => \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a4~portbdataout\,
	datac => \inst1|ALT_INV_Mux1~1_combout\,
	datad => \inst1|ALT_INV_Mux0~1_combout\,
	combout => \inst1|Mux11~0_combout\);

\inst1|Mux11~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux11~1_combout\ = ( \inst1|Mux11~0_combout\ ) # ( !\inst1|Mux11~0_combout\ & ( (\inst1|Mux0~0_combout\ & ((!\inst1|Mux1~0_combout\ & (\inst15|Mux11~0_combout\)) # (\inst1|Mux1~0_combout\ & ((\inst7|sip_r\(4)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000111111111111111111100000100000001111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux11~0_combout\,
	datab => \inst1|ALT_INV_Mux1~0_combout\,
	datac => \inst1|ALT_INV_Mux0~0_combout\,
	datad => \inst7|ALT_INV_sip_r\(4),
	datae => \inst1|ALT_INV_Mux11~0_combout\,
	combout => \inst1|Mux11~1_combout\);

\inst1|regs[0][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux11~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[0][4]~q\);

\inst1|Mux27~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux27~0_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[12][4]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[8][4]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[4][4]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[0][4]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][4]~q\,
	datab => \inst1|ALT_INV_regs[4][4]~q\,
	datac => \inst1|ALT_INV_regs[8][4]~q\,
	datad => \inst1|ALT_INV_regs[12][4]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux27~0_combout\);

\inst1|Mux27~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux27~1_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[13][4]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[9][4]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[5][4]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[1][4]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[1][4]~q\,
	datab => \inst1|ALT_INV_regs[5][4]~q\,
	datac => \inst1|ALT_INV_regs[9][4]~q\,
	datad => \inst1|ALT_INV_regs[13][4]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux27~1_combout\);

\inst1|Mux27~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux27~2_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[14][4]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[10][4]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[6][4]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[2][4]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[2][4]~q\,
	datab => \inst1|ALT_INV_regs[6][4]~q\,
	datac => \inst1|ALT_INV_regs[10][4]~q\,
	datad => \inst1|ALT_INV_regs[14][4]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux27~2_combout\);

\inst1|Mux27~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux27~3_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[15][4]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[11][4]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[7][4]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[3][4]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[3][4]~q\,
	datab => \inst1|ALT_INV_regs[7][4]~q\,
	datac => \inst1|ALT_INV_regs[11][4]~q\,
	datad => \inst1|ALT_INV_regs[15][4]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux27~3_combout\);

\inst1|Mux27~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux27~4_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|Mux27~3_combout\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|Mux27~2_combout\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( 
-- \inst1|Mux27~1_combout\ ) ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|Mux27~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux27~0_combout\,
	datab => \inst1|ALT_INV_Mux27~1_combout\,
	datac => \inst1|ALT_INV_Mux27~2_combout\,
	datad => \inst1|ALT_INV_Mux27~3_combout\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux27~4_combout\);

\inst2|OP1_Mux|Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|OP1_Mux|Mux11~0_combout\ = ( \inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst6|temp_op\(4) ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux43~4_combout\ ) ) ) 
-- # ( \inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux27~4_combout\ ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst|pc_counter\(4) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(4),
	datab => \inst1|ALT_INV_Mux27~4_combout\,
	datac => \inst1|ALT_INV_Mux43~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(4),
	datae => \inst5|ALT_INV_Op1_mux_select[0]~3_combout\,
	dataf => \inst5|ALT_INV_Op1_mux_select[1]~2_combout\,
	combout => \inst2|OP1_Mux|Mux11~0_combout\);

\inst2|temp_op1_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|OP1_Mux|Mux11~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op1_write~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|temp_op1_out\(4));

\inst3|memory_rtl_0|auto_generated|ram_block1a4\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "00000064",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_0|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 4,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_0|auto_generated|ram_block1a4_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a4_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a4_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_0|auto_generated|ram_block1a4_PORTBDATAOUT_bus\);

\inst6|temp_rz[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a4~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_rz\(0));

\inst1|Decoder0~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Decoder0~8_combout\ = ( \inst6|temp_rz\(3) & ( (\inst5|ld_r~1_combout\ & (!\inst6|temp_rz\(0) & (!\inst6|temp_rz\(1) & !\inst6|temp_rz\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010000000000000000000000000000000100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~1_combout\,
	datab => \inst6|ALT_INV_temp_rz\(0),
	datac => \inst6|ALT_INV_temp_rz\(1),
	datad => \inst6|ALT_INV_temp_rz\(2),
	datae => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Decoder0~8_combout\);

\inst1|regs[8][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux5~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[8][10]~q\);

\inst1|regs[12][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux5~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[12][10]~q\);

\inst1|Mux37~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux37~0_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[12][10]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[8][10]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[4][10]~q\ 
-- ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[0][10]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][10]~q\,
	datab => \inst1|ALT_INV_regs[4][10]~q\,
	datac => \inst1|ALT_INV_regs[8][10]~q\,
	datad => \inst1|ALT_INV_regs[12][10]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux37~0_combout\);

\inst1|regs[1][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux5~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[1][10]~q\);

\inst1|regs[5][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux5~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[5][10]~q\);

\inst1|regs[9][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux5~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[9][10]~q\);

\inst1|regs[13][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux5~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[13][10]~q\);

\inst1|Mux37~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux37~1_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[13][10]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[9][10]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[5][10]~q\ 
-- ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[1][10]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[1][10]~q\,
	datab => \inst1|ALT_INV_regs[5][10]~q\,
	datac => \inst1|ALT_INV_regs[9][10]~q\,
	datad => \inst1|ALT_INV_regs[13][10]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux37~1_combout\);

\inst1|regs[2][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux5~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[2][10]~q\);

\inst1|regs[6][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux5~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[6][10]~q\);

\inst1|regs[10][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux5~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[10][10]~q\);

\inst1|regs[14][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux5~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[14][10]~q\);

\inst1|Mux37~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux37~2_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[14][10]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[10][10]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[6][10]~q\ 
-- ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[2][10]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[2][10]~q\,
	datab => \inst1|ALT_INV_regs[6][10]~q\,
	datac => \inst1|ALT_INV_regs[10][10]~q\,
	datad => \inst1|ALT_INV_regs[14][10]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux37~2_combout\);

\inst1|regs[3][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux5~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[3][10]~q\);

\inst1|regs[7][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux5~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[7][10]~q\);

\inst1|regs[11][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux5~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[11][10]~q\);

\inst1|regs[15][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux5~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[15][10]~q\);

\inst1|Mux37~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux37~3_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[15][10]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[11][10]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[7][10]~q\ 
-- ) ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[3][10]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[3][10]~q\,
	datab => \inst1|ALT_INV_regs[7][10]~q\,
	datac => \inst1|ALT_INV_regs[11][10]~q\,
	datad => \inst1|ALT_INV_regs[15][10]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux37~3_combout\);

\inst1|Mux37~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux37~4_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|Mux37~3_combout\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|Mux37~2_combout\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( 
-- \inst1|Mux37~1_combout\ ) ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|Mux37~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux37~0_combout\,
	datab => \inst1|ALT_INV_Mux37~1_combout\,
	datac => \inst1|ALT_INV_Mux37~2_combout\,
	datad => \inst1|ALT_INV_Mux37~3_combout\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux37~4_combout\);

\inst6|temp_op[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(10));

\inst4|OP2_Mux|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4|OP2_Mux|Mux5~0_combout\ = ( \inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst6|temp_op\(10) ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux37~4_combout\ ) ) ) 
-- # ( \inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux21~4_combout\ ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst|pc_counter\(10) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(10),
	datab => \inst1|ALT_INV_Mux21~4_combout\,
	datac => \inst1|ALT_INV_Mux37~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(10),
	datae => \inst5|ALT_INV_Op2_mux_select[0]~2_combout\,
	dataf => \inst5|ALT_INV_Op2_mux_select[1]~1_combout\,
	combout => \inst4|OP2_Mux|Mux5~0_combout\);

\inst4|temp_op2_out[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|OP2_Mux|Mux5~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op2_write~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|temp_op2_out\(10));

\inst15|Mux5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux5~1_combout\ = ( \inst4|temp_op2_out\(10) & ( (\inst5|state.T3~q\ & (\inst5|Mux13~1_combout\ & ((\inst2|temp_op1_out\(10)) # (\inst5|Mux14~0_combout\)))) ) ) # ( !\inst4|temp_op2_out\(10) & ( (\inst5|state.T3~q\ & (\inst5|Mux13~1_combout\ & 
-- (\inst5|Mux14~0_combout\ & \inst2|temp_op1_out\(10)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000010001000100000000000000010000000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_Mux13~1_combout\,
	datac => \inst5|ALT_INV_Mux14~0_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(10),
	datae => \inst4|ALT_INV_temp_op2_out\(10),
	combout => \inst15|Mux5~1_combout\);

\inst15|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux5~0_combout\ = ( \inst5|Mux12~0_combout\ & ( \inst15|Mux5~1_combout\ ) ) # ( !\inst5|Mux12~0_combout\ & ( \inst15|Mux5~1_combout\ & ( (!\inst15|Mux5~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~21_sumout\)))) # 
-- (\inst15|Mux5~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~21_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( \inst5|Mux12~0_combout\ & ( !\inst15|Mux5~1_combout\ & ( (!\inst15|Mux5~0_combout\ & (((\inst15|Mux0~0_combout\ & 
-- \inst15|Add0~21_sumout\)))) # (\inst15|Mux5~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~21_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( !\inst5|Mux12~0_combout\ & ( !\inst15|Mux5~1_combout\ & ( (!\inst15|Mux5~0_combout\ & 
-- (((\inst15|Mux0~0_combout\ & \inst15|Add0~21_sumout\)))) # (\inst15|Mux5~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~21_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011111000100010001111100010001000111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux5~0_combout\,
	datab => \inst15|ALT_INV_Mux15~0_combout\,
	datac => \inst15|ALT_INV_Mux0~0_combout\,
	datad => \inst15|ALT_INV_Add0~21_sumout\,
	datae => \inst5|ALT_INV_Mux12~0_combout\,
	dataf => \inst15|ALT_INV_Mux5~1_combout\,
	combout => \inst15|Mux5~0_combout\);

\Sip_in[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sip_in(10),
	o => \Sip_in[10]~input_o\);

\inst7|sip_r[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Sip_in[10]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sip_r\(10));

\inst3|memory_rtl_1|auto_generated|ram_block1a10\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "00000008",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_1|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 10,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 10,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_1|auto_generated|ram_block1a10_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a10_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a10_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_1|auto_generated|ram_block1a10_PORTBDATAOUT_bus\);

\inst1|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux5~0_combout\ = (!\inst4|temp_op2_out\(10) & (\inst3|memory_rtl_1|auto_generated|ram_block1a10~portbdataout\ & ((\inst1|Mux0~1_combout\)))) # (\inst4|temp_op2_out\(10) & ((!\inst1|Mux1~1_combout\) # 
-- ((\inst3|memory_rtl_1|auto_generated|ram_block1a10~portbdataout\ & \inst1|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001110011010100000111001101010000011100110101000001110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(10),
	datab => \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a10~portbdataout\,
	datac => \inst1|ALT_INV_Mux1~1_combout\,
	datad => \inst1|ALT_INV_Mux0~1_combout\,
	combout => \inst1|Mux5~0_combout\);

\inst1|Mux5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux5~1_combout\ = ( \inst1|Mux5~0_combout\ ) # ( !\inst1|Mux5~0_combout\ & ( (\inst1|Mux0~0_combout\ & ((!\inst1|Mux1~0_combout\ & (\inst15|Mux5~0_combout\)) # (\inst1|Mux1~0_combout\ & ((\inst7|sip_r\(10)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000111111111111111111100000100000001111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux5~0_combout\,
	datab => \inst1|ALT_INV_Mux1~0_combout\,
	datac => \inst1|ALT_INV_Mux0~0_combout\,
	datad => \inst7|ALT_INV_sip_r\(10),
	datae => \inst1|ALT_INV_Mux5~0_combout\,
	combout => \inst1|Mux5~1_combout\);

\inst1|regs[0][10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux5~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[0][10]~q\);

\inst1|Mux21~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux21~0_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[12][10]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[8][10]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[4][10]~q\ 
-- ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[0][10]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][10]~q\,
	datab => \inst1|ALT_INV_regs[4][10]~q\,
	datac => \inst1|ALT_INV_regs[8][10]~q\,
	datad => \inst1|ALT_INV_regs[12][10]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux21~0_combout\);

\inst1|Mux21~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux21~1_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[13][10]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[9][10]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[5][10]~q\ 
-- ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[1][10]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[1][10]~q\,
	datab => \inst1|ALT_INV_regs[5][10]~q\,
	datac => \inst1|ALT_INV_regs[9][10]~q\,
	datad => \inst1|ALT_INV_regs[13][10]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux21~1_combout\);

\inst1|Mux21~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux21~2_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[14][10]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[10][10]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[6][10]~q\ 
-- ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[2][10]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[2][10]~q\,
	datab => \inst1|ALT_INV_regs[6][10]~q\,
	datac => \inst1|ALT_INV_regs[10][10]~q\,
	datad => \inst1|ALT_INV_regs[14][10]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux21~2_combout\);

\inst1|Mux21~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux21~3_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[15][10]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[11][10]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[7][10]~q\ 
-- ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[3][10]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[3][10]~q\,
	datab => \inst1|ALT_INV_regs[7][10]~q\,
	datac => \inst1|ALT_INV_regs[11][10]~q\,
	datad => \inst1|ALT_INV_regs[15][10]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux21~3_combout\);

\inst1|Mux21~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux21~4_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|Mux21~3_combout\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|Mux21~2_combout\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( 
-- \inst1|Mux21~1_combout\ ) ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|Mux21~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux21~0_combout\,
	datab => \inst1|ALT_INV_Mux21~1_combout\,
	datac => \inst1|ALT_INV_Mux21~2_combout\,
	datad => \inst1|ALT_INV_Mux21~3_combout\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux21~4_combout\);

\inst2|OP1_Mux|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|OP1_Mux|Mux5~0_combout\ = ( \inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst6|temp_op\(10) ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux37~4_combout\ ) ) ) 
-- # ( \inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux21~4_combout\ ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst|pc_counter\(10) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(10),
	datab => \inst1|ALT_INV_Mux21~4_combout\,
	datac => \inst1|ALT_INV_Mux37~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(10),
	datae => \inst5|ALT_INV_Op1_mux_select[0]~3_combout\,
	dataf => \inst5|ALT_INV_Op1_mux_select[1]~2_combout\,
	combout => \inst2|OP1_Mux|Mux5~0_combout\);

\inst2|temp_op1_out[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|OP1_Mux|Mux5~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op1_write~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|temp_op1_out\(10));

\inst3|memory_rtl_0|auto_generated|ram_block1a10\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "00000008",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_0|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 10,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 10,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_0|auto_generated|ram_block1a10_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a10_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a10_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_0|auto_generated|ram_block1a10_PORTBDATAOUT_bus\);

\inst6|temp_opcode[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a10~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_opcode\(2));

\inst5|dpcr_lsb_sel~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|dpcr_lsb_sel~0_combout\ = (\inst6|temp_opcode\(3) & (!\inst6|temp_opcode\(2) & (!\inst6|temp_opcode\(1) & !\inst6|temp_opcode\(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000000010000000000000001000000000000000100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(3),
	datab => \inst6|ALT_INV_temp_opcode\(2),
	datac => \inst6|ALT_INV_temp_opcode\(1),
	datad => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|dpcr_lsb_sel~0_combout\);

\inst5|Mux15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux15~0_combout\ = ( \inst6|temp_opcode\(1) & ( \inst6|temp_opcode\(0) & ( (!\inst6|temp_opcode\(3) & !\inst6|temp_opcode\(2)) ) ) ) # ( !\inst6|temp_opcode\(1) & ( !\inst6|temp_opcode\(0) & ( ((!\inst6|temp_opcode\(2) & ((\inst6|temp_AM\(0)) # 
-- (\inst6|temp_AM\(1))))) # (\inst6|temp_opcode\(3)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111100001111000000000000000000000000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst6|ALT_INV_temp_opcode\(3),
	datad => \inst6|ALT_INV_temp_opcode\(2),
	datae => \inst6|ALT_INV_temp_opcode\(1),
	dataf => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|Mux15~0_combout\);

\inst5|ld_r~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|ld_r~1_combout\ = ( \inst5|Mux15~0_combout\ & ( \inst5|ld_r~0_combout\ & ( (!\inst6|temp_opcode\(5)) # (((\inst5|sop_wr~0_combout\ & \inst5|Mux16~1_combout\)) # (\inst5|dpcr_lsb_sel~0_combout\)) ) ) ) # ( !\inst5|Mux15~0_combout\ & ( 
-- \inst5|ld_r~0_combout\ & ( (!\inst6|temp_opcode\(5) & (((\inst5|sop_wr~0_combout\ & \inst5|Mux16~1_combout\)))) # (\inst6|temp_opcode\(5) & (((\inst5|sop_wr~0_combout\ & \inst5|Mux16~1_combout\)) # (\inst5|dpcr_lsb_sel~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000010001000111111011101110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(5),
	datab => \inst5|ALT_INV_dpcr_lsb_sel~0_combout\,
	datac => \inst5|ALT_INV_sop_wr~0_combout\,
	datad => \inst5|ALT_INV_Mux16~1_combout\,
	datae => \inst5|ALT_INV_Mux15~0_combout\,
	dataf => \inst5|ALT_INV_ld_r~0_combout\,
	combout => \inst5|ld_r~1_combout\);

\inst1|Decoder0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Decoder0~4_combout\ = ( !\inst6|temp_rz\(3) & ( (\inst5|ld_r~1_combout\ & (!\inst6|temp_rz\(0) & (!\inst6|temp_rz\(1) & \inst6|temp_rz\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000000000000000000000000000000010000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~1_combout\,
	datab => \inst6|ALT_INV_temp_rz\(0),
	datac => \inst6|ALT_INV_temp_rz\(1),
	datad => \inst6|ALT_INV_temp_rz\(2),
	datae => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Decoder0~4_combout\);

\inst1|regs[4][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux7~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[4][8]~q\);

\inst1|regs[8][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux7~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[8][8]~q\);

\inst1|regs[12][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux7~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[12][8]~q\);

\inst1|Mux39~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux39~0_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[12][8]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[8][8]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[4][8]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[0][8]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][8]~q\,
	datab => \inst1|ALT_INV_regs[4][8]~q\,
	datac => \inst1|ALT_INV_regs[8][8]~q\,
	datad => \inst1|ALT_INV_regs[12][8]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux39~0_combout\);

\inst1|regs[1][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux7~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[1][8]~q\);

\inst1|regs[5][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux7~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[5][8]~q\);

\inst1|regs[9][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux7~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[9][8]~q\);

\inst1|regs[13][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux7~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[13][8]~q\);

\inst1|Mux39~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux39~1_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[13][8]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[9][8]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[5][8]~q\ ) ) 
-- ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[1][8]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[1][8]~q\,
	datab => \inst1|ALT_INV_regs[5][8]~q\,
	datac => \inst1|ALT_INV_regs[9][8]~q\,
	datad => \inst1|ALT_INV_regs[13][8]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux39~1_combout\);

\inst1|regs[2][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux7~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[2][8]~q\);

\inst1|regs[6][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux7~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[6][8]~q\);

\inst1|regs[10][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux7~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[10][8]~q\);

\inst1|regs[14][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux7~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[14][8]~q\);

\inst1|Mux39~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux39~2_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[14][8]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[10][8]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[6][8]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[2][8]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[2][8]~q\,
	datab => \inst1|ALT_INV_regs[6][8]~q\,
	datac => \inst1|ALT_INV_regs[10][8]~q\,
	datad => \inst1|ALT_INV_regs[14][8]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux39~2_combout\);

\inst1|regs[3][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux7~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[3][8]~q\);

\inst1|regs[7][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux7~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[7][8]~q\);

\inst1|regs[11][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux7~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[11][8]~q\);

\inst1|regs[15][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux7~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[15][8]~q\);

\inst1|Mux39~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux39~3_combout\ = ( \inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[15][8]~q\ ) ) ) # ( !\inst6|temp_rz\(2) & ( \inst6|temp_rz\(3) & ( \inst1|regs[11][8]~q\ ) ) ) # ( \inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[7][8]~q\ ) 
-- ) ) # ( !\inst6|temp_rz\(2) & ( !\inst6|temp_rz\(3) & ( \inst1|regs[3][8]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[3][8]~q\,
	datab => \inst1|ALT_INV_regs[7][8]~q\,
	datac => \inst1|ALT_INV_regs[11][8]~q\,
	datad => \inst1|ALT_INV_regs[15][8]~q\,
	datae => \inst6|ALT_INV_temp_rz\(2),
	dataf => \inst6|ALT_INV_temp_rz\(3),
	combout => \inst1|Mux39~3_combout\);

\inst1|Mux39~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux39~4_combout\ = ( \inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|Mux39~3_combout\ ) ) ) # ( !\inst6|temp_rz\(0) & ( \inst6|temp_rz\(1) & ( \inst1|Mux39~2_combout\ ) ) ) # ( \inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( 
-- \inst1|Mux39~1_combout\ ) ) ) # ( !\inst6|temp_rz\(0) & ( !\inst6|temp_rz\(1) & ( \inst1|Mux39~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux39~0_combout\,
	datab => \inst1|ALT_INV_Mux39~1_combout\,
	datac => \inst1|ALT_INV_Mux39~2_combout\,
	datad => \inst1|ALT_INV_Mux39~3_combout\,
	datae => \inst6|ALT_INV_temp_rz\(0),
	dataf => \inst6|ALT_INV_temp_rz\(1),
	combout => \inst1|Mux39~4_combout\);

\inst6|temp_op[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Selector1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(8));

\inst4|OP2_Mux|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst4|OP2_Mux|Mux7~0_combout\ = ( \inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst6|temp_op\(8) ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( \inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux39~4_combout\ ) ) ) 
-- # ( \inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst1|Mux23~4_combout\ ) ) ) # ( !\inst5|Op2_mux_select[0]~2_combout\ & ( !\inst5|Op2_mux_select[1]~1_combout\ & ( \inst|pc_counter\(8) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(8),
	datab => \inst1|ALT_INV_Mux23~4_combout\,
	datac => \inst1|ALT_INV_Mux39~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(8),
	datae => \inst5|ALT_INV_Op2_mux_select[0]~2_combout\,
	dataf => \inst5|ALT_INV_Op2_mux_select[1]~1_combout\,
	combout => \inst4|OP2_Mux|Mux7~0_combout\);

\inst4|temp_op2_out[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|OP2_Mux|Mux7~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op2_write~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|temp_op2_out\(8));

\inst15|Mux7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux7~1_combout\ = ( \inst4|temp_op2_out\(8) & ( (\inst5|state.T3~q\ & (\inst5|Mux12~0_combout\ & ((\inst2|temp_op1_out\(8)) # (\inst5|Mux14~0_combout\)))) ) ) # ( !\inst4|temp_op2_out\(8) & ( (\inst5|state.T3~q\ & (\inst5|Mux12~0_combout\ & 
-- (\inst5|Mux14~0_combout\ & \inst2|temp_op1_out\(8)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000010001000100000000000000010000000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_Mux12~0_combout\,
	datac => \inst5|ALT_INV_Mux14~0_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(8),
	datae => \inst4|ALT_INV_temp_op2_out\(8),
	combout => \inst15|Mux7~1_combout\);

\inst15|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux7~0_combout\ = ( \inst5|Mux13~1_combout\ & ( \inst15|Mux7~1_combout\ ) ) # ( !\inst5|Mux13~1_combout\ & ( \inst15|Mux7~1_combout\ & ( (!\inst15|Mux7~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~29_sumout\)))) # 
-- (\inst15|Mux7~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~29_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( \inst5|Mux13~1_combout\ & ( !\inst15|Mux7~1_combout\ & ( (!\inst15|Mux7~0_combout\ & (((\inst15|Mux0~0_combout\ & 
-- \inst15|Add0~29_sumout\)))) # (\inst15|Mux7~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~29_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( !\inst5|Mux13~1_combout\ & ( !\inst15|Mux7~1_combout\ & ( (!\inst15|Mux7~0_combout\ & 
-- (((\inst15|Mux0~0_combout\ & \inst15|Add0~29_sumout\)))) # (\inst15|Mux7~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~29_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011111000100010001111100010001000111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux7~0_combout\,
	datab => \inst15|ALT_INV_Mux15~0_combout\,
	datac => \inst15|ALT_INV_Mux0~0_combout\,
	datad => \inst15|ALT_INV_Add0~29_sumout\,
	datae => \inst5|ALT_INV_Mux13~1_combout\,
	dataf => \inst15|ALT_INV_Mux7~1_combout\,
	combout => \inst15|Mux7~0_combout\);

\Sip_in[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sip_in(8),
	o => \Sip_in[8]~input_o\);

\inst7|sip_r[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Sip_in[8]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sip_r\(8));

\inst3|memory_rtl_1|auto_generated|ram_block1a8\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000008",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_1|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 8,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 8,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_1|auto_generated|ram_block1a8_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a8_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a8_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_1|auto_generated|ram_block1a8_PORTBDATAOUT_bus\);

\inst1|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux7~0_combout\ = (!\inst4|temp_op2_out\(8) & (\inst3|memory_rtl_1|auto_generated|ram_block1a8~portbdataout\ & ((\inst1|Mux0~1_combout\)))) # (\inst4|temp_op2_out\(8) & ((!\inst1|Mux1~1_combout\) # 
-- ((\inst3|memory_rtl_1|auto_generated|ram_block1a8~portbdataout\ & \inst1|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001110011010100000111001101010000011100110101000001110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(8),
	datab => \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a8~portbdataout\,
	datac => \inst1|ALT_INV_Mux1~1_combout\,
	datad => \inst1|ALT_INV_Mux0~1_combout\,
	combout => \inst1|Mux7~0_combout\);

\inst1|Mux7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux7~1_combout\ = ( \inst1|Mux7~0_combout\ ) # ( !\inst1|Mux7~0_combout\ & ( (\inst1|Mux0~0_combout\ & ((!\inst1|Mux1~0_combout\ & (\inst15|Mux7~0_combout\)) # (\inst1|Mux1~0_combout\ & ((\inst7|sip_r\(8)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000111111111111111111100000100000001111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux7~0_combout\,
	datab => \inst1|ALT_INV_Mux1~0_combout\,
	datac => \inst1|ALT_INV_Mux0~0_combout\,
	datad => \inst7|ALT_INV_sip_r\(8),
	datae => \inst1|ALT_INV_Mux7~0_combout\,
	combout => \inst1|Mux7~1_combout\);

\inst1|regs[0][8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux7~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[0][8]~q\);

\inst1|Mux23~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux23~0_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[12][8]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[8][8]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[4][8]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[0][8]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][8]~q\,
	datab => \inst1|ALT_INV_regs[4][8]~q\,
	datac => \inst1|ALT_INV_regs[8][8]~q\,
	datad => \inst1|ALT_INV_regs[12][8]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux23~0_combout\);

\inst1|Mux23~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux23~1_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[13][8]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[9][8]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[5][8]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[1][8]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[1][8]~q\,
	datab => \inst1|ALT_INV_regs[5][8]~q\,
	datac => \inst1|ALT_INV_regs[9][8]~q\,
	datad => \inst1|ALT_INV_regs[13][8]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux23~1_combout\);

\inst1|Mux23~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux23~2_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[14][8]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[10][8]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[6][8]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[2][8]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[2][8]~q\,
	datab => \inst1|ALT_INV_regs[6][8]~q\,
	datac => \inst1|ALT_INV_regs[10][8]~q\,
	datad => \inst1|ALT_INV_regs[14][8]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux23~2_combout\);

\inst1|Mux23~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux23~3_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[15][8]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[11][8]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[7][8]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[3][8]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[3][8]~q\,
	datab => \inst1|ALT_INV_regs[7][8]~q\,
	datac => \inst1|ALT_INV_regs[11][8]~q\,
	datad => \inst1|ALT_INV_regs[15][8]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux23~3_combout\);

\inst1|Mux23~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux23~4_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|Mux23~3_combout\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|Mux23~2_combout\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( 
-- \inst1|Mux23~1_combout\ ) ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|Mux23~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux23~0_combout\,
	datab => \inst1|ALT_INV_Mux23~1_combout\,
	datac => \inst1|ALT_INV_Mux23~2_combout\,
	datad => \inst1|ALT_INV_Mux23~3_combout\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux23~4_combout\);

\inst2|OP1_Mux|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|OP1_Mux|Mux7~0_combout\ = ( \inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst6|temp_op\(8) ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux39~4_combout\ ) ) ) 
-- # ( \inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux23~4_combout\ ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst|pc_counter\(8) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(8),
	datab => \inst1|ALT_INV_Mux23~4_combout\,
	datac => \inst1|ALT_INV_Mux39~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(8),
	datae => \inst5|ALT_INV_Op1_mux_select[0]~3_combout\,
	dataf => \inst5|ALT_INV_Op1_mux_select[1]~2_combout\,
	combout => \inst2|OP1_Mux|Mux7~0_combout\);

\inst2|temp_op1_out[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|OP1_Mux|Mux7~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op1_write~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|temp_op1_out\(8));

\inst3|memory_rtl_0|auto_generated|ram_block1a8\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000008",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_0|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 8,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 8,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_0|auto_generated|ram_block1a8_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a8_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a8_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_0|auto_generated|ram_block1a8_PORTBDATAOUT_bus\);

\inst6|temp_opcode[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a8~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_opcode\(0));

\inst5|Mux14~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux14~1_combout\ = ( \inst6|temp_opcode\(3) & ( (!\inst6|temp_opcode\(4) & (!\inst6|temp_opcode\(0) & (!\inst6|temp_opcode\(1) & \inst6|temp_opcode\(2)))) ) ) # ( !\inst6|temp_opcode\(3) & ( (!\inst6|temp_opcode\(4) & ((!\inst6|temp_opcode\(0) & 
-- (!\inst6|temp_opcode\(1) & \inst6|temp_opcode\(2))) # (\inst6|temp_opcode\(0) & (\inst6|temp_opcode\(1) & !\inst6|temp_opcode\(2))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001010000000000000001000000000000010100000000000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(4),
	datab => \inst6|ALT_INV_temp_opcode\(0),
	datac => \inst6|ALT_INV_temp_opcode\(1),
	datad => \inst6|ALT_INV_temp_opcode\(2),
	datae => \inst6|ALT_INV_temp_opcode\(3),
	combout => \inst5|Mux14~1_combout\);

\inst15|Mux4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux4~1_combout\ = ( \inst4|temp_op2_out\(11) & ( (\inst5|state.T3~q\ & (\inst5|Mux12~0_combout\ & ((\inst2|temp_op1_out\(11)) # (\inst5|Mux14~0_combout\)))) ) ) # ( !\inst4|temp_op2_out\(11) & ( (\inst5|state.T3~q\ & (\inst5|Mux12~0_combout\ & 
-- (\inst5|Mux14~0_combout\ & \inst2|temp_op1_out\(11)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000010001000100000000000000010000000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_Mux12~0_combout\,
	datac => \inst5|ALT_INV_Mux14~0_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(11),
	datae => \inst4|ALT_INV_temp_op2_out\(11),
	combout => \inst15|Mux4~1_combout\);

\inst15|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux4~0_combout\ = ( \inst5|Mux13~1_combout\ & ( \inst15|Mux4~1_combout\ ) ) # ( !\inst5|Mux13~1_combout\ & ( \inst15|Mux4~1_combout\ & ( (!\inst15|Mux4~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~17_sumout\)))) # 
-- (\inst15|Mux4~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~17_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( \inst5|Mux13~1_combout\ & ( !\inst15|Mux4~1_combout\ & ( (!\inst15|Mux4~0_combout\ & (((\inst15|Mux0~0_combout\ & 
-- \inst15|Add0~17_sumout\)))) # (\inst15|Mux4~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~17_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( !\inst5|Mux13~1_combout\ & ( !\inst15|Mux4~1_combout\ & ( (!\inst15|Mux4~0_combout\ & 
-- (((\inst15|Mux0~0_combout\ & \inst15|Add0~17_sumout\)))) # (\inst15|Mux4~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~17_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011111000100010001111100010001000111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux4~0_combout\,
	datab => \inst15|ALT_INV_Mux15~0_combout\,
	datac => \inst15|ALT_INV_Mux0~0_combout\,
	datad => \inst15|ALT_INV_Add0~17_sumout\,
	datae => \inst5|ALT_INV_Mux13~1_combout\,
	dataf => \inst15|ALT_INV_Mux4~1_combout\,
	combout => \inst15|Mux4~0_combout\);

\Sip_in[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sip_in(11),
	o => \Sip_in[11]~input_o\);

\inst7|sip_r[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Sip_in[11]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sip_r\(11));

\inst3|memory_rtl_1|auto_generated|ram_block1a11\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000058",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_1|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 11,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 11,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_1|auto_generated|ram_block1a11_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a11_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a11_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_1|auto_generated|ram_block1a11_PORTBDATAOUT_bus\);

\inst1|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux4~0_combout\ = (!\inst4|temp_op2_out\(11) & (\inst3|memory_rtl_1|auto_generated|ram_block1a11~portbdataout\ & ((\inst1|Mux0~1_combout\)))) # (\inst4|temp_op2_out\(11) & ((!\inst1|Mux1~1_combout\) # 
-- ((\inst3|memory_rtl_1|auto_generated|ram_block1a11~portbdataout\ & \inst1|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001110011010100000111001101010000011100110101000001110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(11),
	datab => \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a11~portbdataout\,
	datac => \inst1|ALT_INV_Mux1~1_combout\,
	datad => \inst1|ALT_INV_Mux0~1_combout\,
	combout => \inst1|Mux4~0_combout\);

\inst1|Mux4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux4~1_combout\ = ( \inst1|Mux4~0_combout\ ) # ( !\inst1|Mux4~0_combout\ & ( (\inst1|Mux0~0_combout\ & ((!\inst1|Mux1~0_combout\ & (\inst15|Mux4~0_combout\)) # (\inst1|Mux1~0_combout\ & ((\inst7|sip_r\(11)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000111111111111111111100000100000001111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux4~0_combout\,
	datab => \inst1|ALT_INV_Mux1~0_combout\,
	datac => \inst1|ALT_INV_Mux0~0_combout\,
	datad => \inst7|ALT_INV_sip_r\(11),
	datae => \inst1|ALT_INV_Mux4~0_combout\,
	combout => \inst1|Mux4~1_combout\);

\inst1|regs[0][11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux4~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[0][11]~q\);

\inst1|Mux20~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux20~0_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[3][11]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[2][11]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[1][11]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[0][11]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][11]~q\,
	datab => \inst1|ALT_INV_regs[1][11]~q\,
	datac => \inst1|ALT_INV_regs[2][11]~q\,
	datad => \inst1|ALT_INV_regs[3][11]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux20~0_combout\);

\inst1|Mux20~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux20~1_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[7][11]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[6][11]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[5][11]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[4][11]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[4][11]~q\,
	datab => \inst1|ALT_INV_regs[5][11]~q\,
	datac => \inst1|ALT_INV_regs[6][11]~q\,
	datad => \inst1|ALT_INV_regs[7][11]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux20~1_combout\);

\inst1|Mux20~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux20~2_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[11][11]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[10][11]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[9][11]~q\ 
-- ) ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[8][11]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[8][11]~q\,
	datab => \inst1|ALT_INV_regs[9][11]~q\,
	datac => \inst1|ALT_INV_regs[10][11]~q\,
	datad => \inst1|ALT_INV_regs[11][11]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux20~2_combout\);

\inst1|Mux20~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux20~3_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[15][11]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[14][11]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( 
-- \inst1|regs[13][11]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[12][11]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[12][11]~q\,
	datab => \inst1|ALT_INV_regs[13][11]~q\,
	datac => \inst1|ALT_INV_regs[14][11]~q\,
	datad => \inst1|ALT_INV_regs[15][11]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux20~3_combout\);

\inst1|Mux20~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux20~4_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|Mux20~3_combout\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|Mux20~2_combout\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( 
-- \inst1|Mux20~1_combout\ ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|Mux20~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux20~0_combout\,
	datab => \inst1|ALT_INV_Mux20~1_combout\,
	datac => \inst1|ALT_INV_Mux20~2_combout\,
	datad => \inst1|ALT_INV_Mux20~3_combout\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux20~4_combout\);

\inst2|OP1_Mux|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|OP1_Mux|Mux4~0_combout\ = ( \inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst6|temp_op\(11) ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux36~4_combout\ ) ) ) 
-- # ( \inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux20~4_combout\ ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst|pc_counter\(11) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(11),
	datab => \inst1|ALT_INV_Mux20~4_combout\,
	datac => \inst1|ALT_INV_Mux36~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(11),
	datae => \inst5|ALT_INV_Op1_mux_select[0]~3_combout\,
	dataf => \inst5|ALT_INV_Op1_mux_select[1]~2_combout\,
	combout => \inst2|OP1_Mux|Mux4~0_combout\);

\inst2|temp_op1_out[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|OP1_Mux|Mux4~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op1_write~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|temp_op1_out\(11));

\inst3|memory_rtl_0|auto_generated|ram_block1a11\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000058",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_0|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 11,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 11,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_0|auto_generated|ram_block1a11_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a11_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a11_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_0|auto_generated|ram_block1a11_PORTBDATAOUT_bus\);

\inst6|temp_opcode[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a11~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_opcode\(3));

\inst5|Mux13~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux13~1_combout\ = ( !\inst6|temp_opcode\(0) & ( (!\inst6|temp_opcode\(4) & (\inst6|temp_opcode\(3) & (!\inst6|temp_opcode\(5) & !\inst6|temp_opcode\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000000000000000000000000000100000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(4),
	datab => \inst6|ALT_INV_temp_opcode\(3),
	datac => \inst6|ALT_INV_temp_opcode\(5),
	datad => \inst6|ALT_INV_temp_opcode\(1),
	datae => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|Mux13~1_combout\);

\inst15|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux0~0_combout\ = (!\inst5|state.T3~q\ & (((!\inst5|state.init~q\)))) # (\inst5|state.T3~q\ & (\inst5|Mux12~0_combout\ & ((!\inst5|Mux13~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011000110100000101100011010000010110001101000001011000110100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_Mux12~0_combout\,
	datac => \inst5|ALT_INV_state.init~q\,
	datad => \inst5|ALT_INV_Mux13~1_combout\,
	combout => \inst15|Mux0~0_combout\);

\inst15|Mux6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux6~1_combout\ = ( \inst4|temp_op2_out\(9) & ( (\inst5|state.T3~q\ & (\inst5|Mux12~0_combout\ & ((\inst2|temp_op1_out\(9)) # (\inst5|Mux14~0_combout\)))) ) ) # ( !\inst4|temp_op2_out\(9) & ( (\inst5|state.T3~q\ & (\inst5|Mux12~0_combout\ & 
-- (\inst5|Mux14~0_combout\ & \inst2|temp_op1_out\(9)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000010001000100000000000000010000000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_Mux12~0_combout\,
	datac => \inst5|ALT_INV_Mux14~0_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(9),
	datae => \inst4|ALT_INV_temp_op2_out\(9),
	combout => \inst15|Mux6~1_combout\);

\inst15|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux6~0_combout\ = ( \inst5|Mux13~1_combout\ & ( \inst15|Mux6~1_combout\ ) ) # ( !\inst5|Mux13~1_combout\ & ( \inst15|Mux6~1_combout\ & ( (!\inst15|Mux6~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~25_sumout\)))) # 
-- (\inst15|Mux6~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~25_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( \inst5|Mux13~1_combout\ & ( !\inst15|Mux6~1_combout\ & ( (!\inst15|Mux6~0_combout\ & (((\inst15|Mux0~0_combout\ & 
-- \inst15|Add0~25_sumout\)))) # (\inst15|Mux6~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~25_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( !\inst5|Mux13~1_combout\ & ( !\inst15|Mux6~1_combout\ & ( (!\inst15|Mux6~0_combout\ & 
-- (((\inst15|Mux0~0_combout\ & \inst15|Add0~25_sumout\)))) # (\inst15|Mux6~0_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~25_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011111000100010001111100010001000111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux6~0_combout\,
	datab => \inst15|ALT_INV_Mux15~0_combout\,
	datac => \inst15|ALT_INV_Mux0~0_combout\,
	datad => \inst15|ALT_INV_Add0~25_sumout\,
	datae => \inst5|ALT_INV_Mux13~1_combout\,
	dataf => \inst15|ALT_INV_Mux6~1_combout\,
	combout => \inst15|Mux6~0_combout\);

\Sip_in[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sip_in(9),
	o => \Sip_in[9]~input_o\);

\inst7|sip_r[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Sip_in[9]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sip_r\(9));

\inst3|memory_rtl_1|auto_generated|ram_block1a9\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000008",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_1|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 9,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 9,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_1|auto_generated|ram_block1a9_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a9_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a9_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_1|auto_generated|ram_block1a9_PORTBDATAOUT_bus\);

\inst1|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux6~0_combout\ = (!\inst4|temp_op2_out\(9) & (\inst3|memory_rtl_1|auto_generated|ram_block1a9~portbdataout\ & ((\inst1|Mux0~1_combout\)))) # (\inst4|temp_op2_out\(9) & ((!\inst1|Mux1~1_combout\) # 
-- ((\inst3|memory_rtl_1|auto_generated|ram_block1a9~portbdataout\ & \inst1|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001110011010100000111001101010000011100110101000001110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(9),
	datab => \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a9~portbdataout\,
	datac => \inst1|ALT_INV_Mux1~1_combout\,
	datad => \inst1|ALT_INV_Mux0~1_combout\,
	combout => \inst1|Mux6~0_combout\);

\inst1|Mux6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux6~1_combout\ = ( \inst1|Mux6~0_combout\ ) # ( !\inst1|Mux6~0_combout\ & ( (\inst1|Mux0~0_combout\ & ((!\inst1|Mux1~0_combout\ & (\inst15|Mux6~0_combout\)) # (\inst1|Mux1~0_combout\ & ((\inst7|sip_r\(9)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000111111111111111111100000100000001111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux6~0_combout\,
	datab => \inst1|ALT_INV_Mux1~0_combout\,
	datac => \inst1|ALT_INV_Mux0~0_combout\,
	datad => \inst7|ALT_INV_sip_r\(9),
	datae => \inst1|ALT_INV_Mux6~0_combout\,
	combout => \inst1|Mux6~1_combout\);

\inst1|regs[0][9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux6~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[0][9]~q\);

\inst1|Mux22~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux22~0_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[3][9]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[2][9]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[1][9]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[0][9]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][9]~q\,
	datab => \inst1|ALT_INV_regs[1][9]~q\,
	datac => \inst1|ALT_INV_regs[2][9]~q\,
	datad => \inst1|ALT_INV_regs[3][9]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux22~0_combout\);

\inst1|Mux22~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux22~1_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[7][9]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[6][9]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[5][9]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[4][9]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[4][9]~q\,
	datab => \inst1|ALT_INV_regs[5][9]~q\,
	datac => \inst1|ALT_INV_regs[6][9]~q\,
	datad => \inst1|ALT_INV_regs[7][9]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux22~1_combout\);

\inst1|Mux22~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux22~2_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[11][9]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[10][9]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[9][9]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[8][9]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[8][9]~q\,
	datab => \inst1|ALT_INV_regs[9][9]~q\,
	datac => \inst1|ALT_INV_regs[10][9]~q\,
	datad => \inst1|ALT_INV_regs[11][9]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux22~2_combout\);

\inst1|Mux22~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux22~3_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[15][9]~q\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|regs[14][9]~q\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[13][9]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|regs[12][9]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[12][9]~q\,
	datab => \inst1|ALT_INV_regs[13][9]~q\,
	datac => \inst1|ALT_INV_regs[14][9]~q\,
	datad => \inst1|ALT_INV_regs[15][9]~q\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux22~3_combout\);

\inst1|Mux22~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux22~4_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|Mux22~3_combout\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|Mux22~2_combout\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( 
-- \inst1|Mux22~1_combout\ ) ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|Mux22~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux22~0_combout\,
	datab => \inst1|ALT_INV_Mux22~1_combout\,
	datac => \inst1|ALT_INV_Mux22~2_combout\,
	datad => \inst1|ALT_INV_Mux22~3_combout\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux22~4_combout\);

\inst2|OP1_Mux|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|OP1_Mux|Mux6~0_combout\ = ( \inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst6|temp_op\(9) ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux38~4_combout\ ) ) ) 
-- # ( \inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux22~4_combout\ ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst|pc_counter\(9) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(9),
	datab => \inst1|ALT_INV_Mux22~4_combout\,
	datac => \inst1|ALT_INV_Mux38~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(9),
	datae => \inst5|ALT_INV_Op1_mux_select[0]~3_combout\,
	dataf => \inst5|ALT_INV_Op1_mux_select[1]~2_combout\,
	combout => \inst2|OP1_Mux|Mux6~0_combout\);

\inst2|temp_op1_out[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|OP1_Mux|Mux6~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op1_write~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|temp_op1_out\(9));

\inst3|memory_rtl_0|auto_generated|ram_block1a9\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000008",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_0|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 9,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 9,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a9_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\);

\inst6|temp_opcode[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_opcode\(1));

\inst5|Mux13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux13~0_combout\ = (!\inst6|temp_opcode\(5) & (!\inst6|temp_opcode\(1) & !\inst6|temp_opcode\(0)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000010000000100000001000000010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(5),
	datab => \inst6|ALT_INV_temp_opcode\(1),
	datac => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|Mux13~0_combout\);

\inst5|Selector0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Selector0~2_combout\ = (\inst6|temp_opcode\(4) & (\inst5|Mux13~0_combout\ & (\inst5|state.T4~q\ & \inst5|Selector0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000100000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(4),
	datab => \inst5|ALT_INV_Mux13~0_combout\,
	datac => \inst5|ALT_INV_state.T4~q\,
	datad => \inst5|ALT_INV_Selector0~0_combout\,
	combout => \inst5|Selector0~2_combout\);

\inst|pc_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~9_sumout\,
	asdata => \inst2|temp_op1_out\(13),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|Selector0~2_combout\,
	ena => \inst5|Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(13));

\inst2|OP1_Mux|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|OP1_Mux|Mux2~0_combout\ = ( \inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst6|temp_op\(13) ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux34~4_combout\ ) ) ) 
-- # ( \inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux18~4_combout\ ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst|pc_counter\(13) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(13),
	datab => \inst1|ALT_INV_Mux18~4_combout\,
	datac => \inst1|ALT_INV_Mux34~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(13),
	datae => \inst5|ALT_INV_Op1_mux_select[0]~3_combout\,
	dataf => \inst5|ALT_INV_Op1_mux_select[1]~2_combout\,
	combout => \inst2|OP1_Mux|Mux2~0_combout\);

\inst2|temp_op1_out[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|OP1_Mux|Mux2~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op1_write~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|temp_op1_out\(13));

\inst3|memory_rtl_0|auto_generated|ram_block1a13\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000050",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_0|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 13,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 13,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_0|auto_generated|ram_block1a13_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a13_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a13_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_0|auto_generated|ram_block1a13_PORTBDATAOUT_bus\);

\inst6|temp_opcode[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a13~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_opcode\(5));

\inst5|Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Mux12~0_combout\ = ( \inst6|temp_opcode\(2) & ( \inst6|temp_opcode\(3) & ( (!\inst6|temp_opcode\(4) & (!\inst6|temp_opcode\(5) & (!\inst6|temp_opcode\(0) & !\inst6|temp_opcode\(1)))) ) ) ) # ( !\inst6|temp_opcode\(2) & ( \inst6|temp_opcode\(3) & ( 
-- (!\inst6|temp_opcode\(0) & (!\inst6|temp_opcode\(1) & (!\inst6|temp_opcode\(4) $ (\inst6|temp_opcode\(5))))) ) ) ) # ( \inst6|temp_opcode\(2) & ( !\inst6|temp_opcode\(3) & ( (!\inst6|temp_opcode\(4) & (!\inst6|temp_opcode\(5) & (!\inst6|temp_opcode\(0) & 
-- !\inst6|temp_opcode\(1)))) ) ) ) # ( !\inst6|temp_opcode\(2) & ( !\inst6|temp_opcode\(3) & ( (!\inst6|temp_opcode\(4) & (!\inst6|temp_opcode\(5) & (\inst6|temp_opcode\(0) & \inst6|temp_opcode\(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001000100000000000000010010000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(4),
	datab => \inst6|ALT_INV_temp_opcode\(5),
	datac => \inst6|ALT_INV_temp_opcode\(0),
	datad => \inst6|ALT_INV_temp_opcode\(1),
	datae => \inst6|ALT_INV_temp_opcode\(2),
	dataf => \inst6|ALT_INV_temp_opcode\(3),
	combout => \inst5|Mux12~0_combout\);

\inst15|Mux15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux15~0_combout\ = ( \inst5|Mux14~0_combout\ & ( (!\inst5|state.T3~q\ & \inst5|state.init~q\) ) ) # ( !\inst5|Mux14~0_combout\ & ( (!\inst5|state.T3~q\ & (((\inst5|state.init~q\)))) # (\inst5|state.T3~q\ & (!\inst5|Mux12~0_combout\ & 
-- ((!\inst5|Mux13~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100111000001010000010100000101001001110000010100000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_Mux12~0_combout\,
	datac => \inst5|ALT_INV_state.init~q\,
	datad => \inst5|ALT_INV_Mux13~1_combout\,
	datae => \inst5|ALT_INV_Mux14~0_combout\,
	combout => \inst15|Mux15~0_combout\);

\inst15|Mux15~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux15~2_combout\ = ( \inst4|temp_op2_out\(0) & ( (\inst5|state.T3~q\ & (\inst5|Mux13~1_combout\ & ((\inst2|temp_op1_out\(0)) # (\inst5|Mux14~0_combout\)))) ) ) # ( !\inst4|temp_op2_out\(0) & ( (\inst5|state.T3~q\ & (\inst5|Mux13~1_combout\ & 
-- (\inst5|Mux14~0_combout\ & \inst2|temp_op1_out\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000010001000100000000000000010000000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_Mux13~1_combout\,
	datac => \inst5|ALT_INV_Mux14~0_combout\,
	datad => \inst2|ALT_INV_temp_op1_out\(0),
	datae => \inst4|ALT_INV_temp_op2_out\(0),
	combout => \inst15|Mux15~2_combout\);

\inst15|Mux15~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst15|Mux15~1_combout\ = ( \inst5|Mux12~0_combout\ & ( \inst15|Mux15~2_combout\ ) ) # ( !\inst5|Mux12~0_combout\ & ( \inst15|Mux15~2_combout\ & ( (!\inst15|Mux15~1_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~61_sumout\)))) # 
-- (\inst15|Mux15~1_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~61_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( \inst5|Mux12~0_combout\ & ( !\inst15|Mux15~2_combout\ & ( (!\inst15|Mux15~1_combout\ & (((\inst15|Mux0~0_combout\ & 
-- \inst15|Add0~61_sumout\)))) # (\inst15|Mux15~1_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~61_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) ) # ( !\inst5|Mux12~0_combout\ & ( !\inst15|Mux15~2_combout\ & ( (!\inst15|Mux15~1_combout\ & 
-- (((\inst15|Mux0~0_combout\ & \inst15|Add0~61_sumout\)))) # (\inst15|Mux15~1_combout\ & (((\inst15|Mux0~0_combout\ & \inst15|Add0~61_sumout\)) # (\inst15|Mux15~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011111000100010001111100010001000111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux15~1_combout\,
	datab => \inst15|ALT_INV_Mux15~0_combout\,
	datac => \inst15|ALT_INV_Mux0~0_combout\,
	datad => \inst15|ALT_INV_Add0~61_sumout\,
	datae => \inst5|ALT_INV_Mux12~0_combout\,
	dataf => \inst15|ALT_INV_Mux15~2_combout\,
	combout => \inst15|Mux15~1_combout\);

\Sip_in[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sip_in(0),
	o => \Sip_in[0]~input_o\);

\inst7|sip_r[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \Sip_in[0]~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sip_r\(0));

\inst3|memory_rtl_1|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000030",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_1|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_1|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_1|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_1|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

\inst1|Mux15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux15~0_combout\ = (!\inst4|temp_op2_out\(0) & (\inst3|memory_rtl_1|auto_generated|ram_block1a0~portbdataout\ & ((\inst1|Mux0~1_combout\)))) # (\inst4|temp_op2_out\(0) & ((!\inst1|Mux1~1_combout\) # 
-- ((\inst3|memory_rtl_1|auto_generated|ram_block1a0~portbdataout\ & \inst1|Mux0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001110011010100000111001101010000011100110101000001110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(0),
	datab => \inst3|memory_rtl_1|auto_generated|ALT_INV_ram_block1a0~portbdataout\,
	datac => \inst1|ALT_INV_Mux1~1_combout\,
	datad => \inst1|ALT_INV_Mux0~1_combout\,
	combout => \inst1|Mux15~0_combout\);

\inst1|Mux15~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux15~1_combout\ = ( \inst1|Mux15~0_combout\ ) # ( !\inst1|Mux15~0_combout\ & ( (\inst1|Mux0~0_combout\ & ((!\inst1|Mux1~0_combout\ & (\inst15|Mux15~1_combout\)) # (\inst1|Mux1~0_combout\ & ((\inst7|sip_r\(0)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000111111111111111111100000100000001111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|ALT_INV_Mux15~1_combout\,
	datab => \inst1|ALT_INV_Mux1~0_combout\,
	datac => \inst1|ALT_INV_Mux0~0_combout\,
	datad => \inst7|ALT_INV_sip_r\(0),
	datae => \inst1|ALT_INV_Mux15~0_combout\,
	combout => \inst1|Mux15~1_combout\);

\inst1|regs[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst1|Mux15~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst1|Decoder0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|regs[0][0]~q\);

\inst1|Mux31~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux31~0_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[12][0]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[8][0]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[4][0]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[0][0]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[0][0]~q\,
	datab => \inst1|ALT_INV_regs[4][0]~q\,
	datac => \inst1|ALT_INV_regs[8][0]~q\,
	datad => \inst1|ALT_INV_regs[12][0]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux31~0_combout\);

\inst1|Mux31~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux31~1_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[13][0]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[9][0]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[5][0]~q\ ) ) 
-- ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[1][0]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[1][0]~q\,
	datab => \inst1|ALT_INV_regs[5][0]~q\,
	datac => \inst1|ALT_INV_regs[9][0]~q\,
	datad => \inst1|ALT_INV_regs[13][0]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux31~1_combout\);

\inst1|Mux31~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux31~2_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[14][0]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[10][0]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[6][0]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[2][0]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[2][0]~q\,
	datab => \inst1|ALT_INV_regs[6][0]~q\,
	datac => \inst1|ALT_INV_regs[10][0]~q\,
	datad => \inst1|ALT_INV_regs[14][0]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux31~2_combout\);

\inst1|Mux31~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux31~3_combout\ = ( \inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[15][0]~q\ ) ) ) # ( !\inst6|temp_rx\(2) & ( \inst6|temp_rx\(3) & ( \inst1|regs[11][0]~q\ ) ) ) # ( \inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[7][0]~q\ ) 
-- ) ) # ( !\inst6|temp_rx\(2) & ( !\inst6|temp_rx\(3) & ( \inst1|regs[3][0]~q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_regs[3][0]~q\,
	datab => \inst1|ALT_INV_regs[7][0]~q\,
	datac => \inst1|ALT_INV_regs[11][0]~q\,
	datad => \inst1|ALT_INV_regs[15][0]~q\,
	datae => \inst6|ALT_INV_temp_rx\(2),
	dataf => \inst6|ALT_INV_temp_rx\(3),
	combout => \inst1|Mux31~3_combout\);

\inst1|Mux31~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst1|Mux31~4_combout\ = ( \inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|Mux31~3_combout\ ) ) ) # ( !\inst6|temp_rx\(0) & ( \inst6|temp_rx\(1) & ( \inst1|Mux31~2_combout\ ) ) ) # ( \inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( 
-- \inst1|Mux31~1_combout\ ) ) ) # ( !\inst6|temp_rx\(0) & ( !\inst6|temp_rx\(1) & ( \inst1|Mux31~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|ALT_INV_Mux31~0_combout\,
	datab => \inst1|ALT_INV_Mux31~1_combout\,
	datac => \inst1|ALT_INV_Mux31~2_combout\,
	datad => \inst1|ALT_INV_Mux31~3_combout\,
	datae => \inst6|ALT_INV_temp_rx\(0),
	dataf => \inst6|ALT_INV_temp_rx\(1),
	combout => \inst1|Mux31~4_combout\);

\inst2|OP1_Mux|Mux15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|OP1_Mux|Mux15~0_combout\ = ( \inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst6|temp_op\(0) ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux47~4_combout\ ) ) ) 
-- # ( \inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux31~4_combout\ ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst|pc_counter\(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(0),
	datab => \inst1|ALT_INV_Mux31~4_combout\,
	datac => \inst1|ALT_INV_Mux47~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(0),
	datae => \inst5|ALT_INV_Op1_mux_select[0]~3_combout\,
	dataf => \inst5|ALT_INV_Op1_mux_select[1]~2_combout\,
	combout => \inst2|OP1_Mux|Mux15~0_combout\);

\inst2|temp_op1_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|OP1_Mux|Mux15~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op1_write~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|temp_op1_out\(0));

\inst|pc_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~61_sumout\,
	asdata => \inst2|temp_op1_out\(0),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|Selector0~2_combout\,
	ena => \inst5|Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(0));

\inst|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~57_sumout\ = SUM(( \inst|pc_counter\(1) ) + ( GND ) + ( \inst|Add0~62\ ))
-- \inst|Add0~58\ = CARRY(( \inst|pc_counter\(1) ) + ( GND ) + ( \inst|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_pc_counter\(1),
	cin => \inst|Add0~62\,
	sumout => \inst|Add0~57_sumout\,
	cout => \inst|Add0~58\);

\inst|pc_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~57_sumout\,
	asdata => \inst2|temp_op1_out\(1),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|Selector0~2_combout\,
	ena => \inst5|Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(1));

\inst|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~53_sumout\ = SUM(( \inst|pc_counter\(2) ) + ( GND ) + ( \inst|Add0~58\ ))
-- \inst|Add0~54\ = CARRY(( \inst|pc_counter\(2) ) + ( GND ) + ( \inst|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_pc_counter\(2),
	cin => \inst|Add0~58\,
	sumout => \inst|Add0~53_sumout\,
	cout => \inst|Add0~54\);

\inst|pc_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~53_sumout\,
	asdata => \inst2|temp_op1_out\(2),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|Selector0~2_combout\,
	ena => \inst5|Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(2));

\inst|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~49_sumout\ = SUM(( \inst|pc_counter\(3) ) + ( GND ) + ( \inst|Add0~54\ ))
-- \inst|Add0~50\ = CARRY(( \inst|pc_counter\(3) ) + ( GND ) + ( \inst|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_pc_counter\(3),
	cin => \inst|Add0~54\,
	sumout => \inst|Add0~49_sumout\,
	cout => \inst|Add0~50\);

\inst|pc_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~49_sumout\,
	asdata => \inst2|temp_op1_out\(3),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|Selector0~2_combout\,
	ena => \inst5|Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(3));

\inst|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~45_sumout\ = SUM(( \inst|pc_counter\(4) ) + ( GND ) + ( \inst|Add0~50\ ))
-- \inst|Add0~46\ = CARRY(( \inst|pc_counter\(4) ) + ( GND ) + ( \inst|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_pc_counter\(4),
	cin => \inst|Add0~50\,
	sumout => \inst|Add0~45_sumout\,
	cout => \inst|Add0~46\);

\inst|pc_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~45_sumout\,
	asdata => \inst2|temp_op1_out\(4),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|Selector0~2_combout\,
	ena => \inst5|Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(4));

\inst|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~41_sumout\ = SUM(( \inst|pc_counter\(5) ) + ( GND ) + ( \inst|Add0~46\ ))
-- \inst|Add0~42\ = CARRY(( \inst|pc_counter\(5) ) + ( GND ) + ( \inst|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_pc_counter\(5),
	cin => \inst|Add0~46\,
	sumout => \inst|Add0~41_sumout\,
	cout => \inst|Add0~42\);

\inst|pc_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~41_sumout\,
	asdata => \inst2|temp_op1_out\(5),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|Selector0~2_combout\,
	ena => \inst5|Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(5));

\inst|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~37_sumout\ = SUM(( \inst|pc_counter\(6) ) + ( GND ) + ( \inst|Add0~42\ ))
-- \inst|Add0~38\ = CARRY(( \inst|pc_counter\(6) ) + ( GND ) + ( \inst|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_pc_counter\(6),
	cin => \inst|Add0~42\,
	sumout => \inst|Add0~37_sumout\,
	cout => \inst|Add0~38\);

\inst|pc_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~37_sumout\,
	asdata => \inst2|temp_op1_out\(6),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|Selector0~2_combout\,
	ena => \inst5|Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(6));

\inst|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~33_sumout\ = SUM(( \inst|pc_counter\(7) ) + ( GND ) + ( \inst|Add0~38\ ))
-- \inst|Add0~34\ = CARRY(( \inst|pc_counter\(7) ) + ( GND ) + ( \inst|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_pc_counter\(7),
	cin => \inst|Add0~38\,
	sumout => \inst|Add0~33_sumout\,
	cout => \inst|Add0~34\);

\inst|pc_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~33_sumout\,
	asdata => \inst2|temp_op1_out\(7),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|Selector0~2_combout\,
	ena => \inst5|Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(7));

\inst|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~29_sumout\ = SUM(( \inst|pc_counter\(8) ) + ( GND ) + ( \inst|Add0~34\ ))
-- \inst|Add0~30\ = CARRY(( \inst|pc_counter\(8) ) + ( GND ) + ( \inst|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_pc_counter\(8),
	cin => \inst|Add0~34\,
	sumout => \inst|Add0~29_sumout\,
	cout => \inst|Add0~30\);

\inst|pc_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~29_sumout\,
	asdata => \inst2|temp_op1_out\(8),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|Selector0~2_combout\,
	ena => \inst5|Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(8));

\inst|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~25_sumout\ = SUM(( \inst|pc_counter\(9) ) + ( GND ) + ( \inst|Add0~30\ ))
-- \inst|Add0~26\ = CARRY(( \inst|pc_counter\(9) ) + ( GND ) + ( \inst|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_pc_counter\(9),
	cin => \inst|Add0~30\,
	sumout => \inst|Add0~25_sumout\,
	cout => \inst|Add0~26\);

\inst|pc_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~25_sumout\,
	asdata => \inst2|temp_op1_out\(9),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|Selector0~2_combout\,
	ena => \inst5|Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(9));

\inst|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~21_sumout\ = SUM(( \inst|pc_counter\(10) ) + ( GND ) + ( \inst|Add0~26\ ))
-- \inst|Add0~22\ = CARRY(( \inst|pc_counter\(10) ) + ( GND ) + ( \inst|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_pc_counter\(10),
	cin => \inst|Add0~26\,
	sumout => \inst|Add0~21_sumout\,
	cout => \inst|Add0~22\);

\inst|pc_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~21_sumout\,
	asdata => \inst2|temp_op1_out\(10),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|Selector0~2_combout\,
	ena => \inst5|Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(10));

\inst|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~17_sumout\ = SUM(( \inst|pc_counter\(11) ) + ( GND ) + ( \inst|Add0~22\ ))
-- \inst|Add0~18\ = CARRY(( \inst|pc_counter\(11) ) + ( GND ) + ( \inst|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_pc_counter\(11),
	cin => \inst|Add0~22\,
	sumout => \inst|Add0~17_sumout\,
	cout => \inst|Add0~18\);

\inst|pc_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~17_sumout\,
	asdata => \inst2|temp_op1_out\(11),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|Selector0~2_combout\,
	ena => \inst5|Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(11));

\inst|pc_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~13_sumout\,
	asdata => \inst2|temp_op1_out\(12),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|Selector0~2_combout\,
	ena => \inst5|Selector0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(12));

\inst2|OP1_Mux|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|OP1_Mux|Mux3~0_combout\ = ( \inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst6|temp_op\(12) ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( \inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux35~4_combout\ ) ) ) 
-- # ( \inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst1|Mux19~4_combout\ ) ) ) # ( !\inst5|Op1_mux_select[0]~3_combout\ & ( !\inst5|Op1_mux_select[1]~2_combout\ & ( \inst|pc_counter\(12) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(12),
	datab => \inst1|ALT_INV_Mux19~4_combout\,
	datac => \inst1|ALT_INV_Mux35~4_combout\,
	datad => \inst6|ALT_INV_temp_op\(12),
	datae => \inst5|ALT_INV_Op1_mux_select[0]~3_combout\,
	dataf => \inst5|ALT_INV_Op1_mux_select[1]~2_combout\,
	combout => \inst2|OP1_Mux|Mux3~0_combout\);

\inst2|temp_op1_out[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|OP1_Mux|Mux3~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|Op1_write~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|temp_op1_out\(12));

\inst3|memory_rtl_0|auto_generated|ram_block1a12\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "00000008",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_0|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 12,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 12,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_0|auto_generated|ram_block1a12_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a12_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a12_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_0|auto_generated|ram_block1a12_PORTBDATAOUT_bus\);

\inst6|temp_opcode[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a12~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_opcode\(4));

\inst5|wr_en~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|wr_en~0_combout\ = ( !\inst6|temp_opcode\(0) & ( (!\inst6|temp_opcode\(3) & (!\inst6|temp_opcode\(2) & ((\inst6|temp_AM\(0)) # (\inst6|temp_AM\(1))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000000000000000000000000000001110000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst6|ALT_INV_temp_opcode\(3),
	datad => \inst6|ALT_INV_temp_opcode\(2),
	datae => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|wr_en~0_combout\);

\inst5|wr_en~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|wr_en~1_combout\ = ( \inst5|Mux1~4_combout\ & ( \inst5|wr_en~0_combout\ & ( (\inst5|state.T3~q\ & (!\inst6|temp_opcode\(5) & ((\inst6|temp_opcode\(1)) # (\inst6|temp_opcode\(4))))) ) ) ) # ( !\inst5|Mux1~4_combout\ & ( \inst5|wr_en~0_combout\ & ( 
-- (!\inst6|temp_opcode\(4) & (\inst5|state.T3~q\ & (!\inst6|temp_opcode\(5) & \inst6|temp_opcode\(1)))) ) ) ) # ( \inst5|Mux1~4_combout\ & ( !\inst5|wr_en~0_combout\ & ( (\inst6|temp_opcode\(4) & (\inst5|state.T3~q\ & !\inst6|temp_opcode\(5))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000100000001000000000000001000000001000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(4),
	datab => \inst5|ALT_INV_state.T3~q\,
	datac => \inst6|ALT_INV_temp_opcode\(5),
	datad => \inst6|ALT_INV_temp_opcode\(1),
	datae => \inst5|ALT_INV_Mux1~4_combout\,
	dataf => \inst5|ALT_INV_wr_en~0_combout\,
	combout => \inst5|wr_en~1_combout\);

\inst3|memory_rtl_0|auto_generated|ram_block1a15\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "80000040",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/ReCOP.ram0_memory_e411fb78.hdl.mif",
	init_file_layout => "port_b",
	logical_ram_name => "memory:inst3|altsyncram:memory_rtl_0|altsyncram_rdr1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "old",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 15,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock0",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 1,
	port_b_first_address => 0,
	port_b_first_bit_number => 15,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 16,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock0",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \inst5|wr_en~1_combout\,
	portbre => VCC,
	clk0 => \ALT_INV_clock~input_o\,
	portadatain => \inst3|memory_rtl_0|auto_generated|ram_block1a15_PORTADATAIN_bus\,
	portaaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a15_PORTAADDR_bus\,
	portbaddr => \inst3|memory_rtl_0|auto_generated|ram_block1a15_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \inst3|memory_rtl_0|auto_generated|ram_block1a15_PORTBDATAOUT_bus\);

\inst6|temp_AM[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|memory_rtl_0|auto_generated|ram_block1a15~portbdataout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_AM\(1));

\inst5|Selector1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|Selector1~0_combout\ = (!\inst5|state.T1~q\ & ((!\inst5|state.T1_1~q\) # (!\inst6|temp_AM\(1) $ (\inst6|temp_AM\(0)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111100100000000111110010000000011111001000000001111100100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst5|ALT_INV_state.T1_1~q\,
	datad => \inst5|ALT_INV_state.T1~q\,
	combout => \inst5|Selector1~0_combout\);

\inst5|alu_operation[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|alu_operation[1]~0_combout\ = ( !\inst6|temp_opcode\(1) & ( !\inst6|temp_opcode\(0) & ( (!\inst6|temp_opcode\(4) & (\inst5|state.T3~q\ & (\inst6|temp_opcode\(3) & !\inst6|temp_opcode\(5)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(4),
	datab => \inst5|ALT_INV_state.T3~q\,
	datac => \inst6|ALT_INV_temp_opcode\(3),
	datad => \inst6|ALT_INV_temp_opcode\(5),
	datae => \inst6|ALT_INV_temp_opcode\(1),
	dataf => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|alu_operation[1]~0_combout\);

\inst5|alu_operation[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|alu_operation[0]~1_combout\ = (\inst5|state.T3~q\ & \inst5|Mux14~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_Mux14~0_combout\,
	combout => \inst5|alu_operation[0]~1_combout\);

\inst5|present_wr~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|present_wr~0_combout\ = ( !\inst6|temp_opcode\(0) & ( (!\inst6|temp_AM\(1) & (\inst6|temp_AM\(0) & (\inst6|temp_opcode\(3) & !\inst6|temp_opcode\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000000000000000000000000000010000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst6|ALT_INV_temp_opcode\(3),
	datad => \inst6|ALT_INV_temp_opcode\(1),
	datae => \inst6|ALT_INV_temp_opcode\(0),
	combout => \inst5|present_wr~0_combout\);

\inst5|present_wr~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|present_wr~1_combout\ = (\inst6|temp_opcode\(4) & (\inst5|state.T3~q\ & (\inst6|temp_opcode\(2) & !\inst6|temp_opcode\(5))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000000000000010000000000000001000000000000000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(4),
	datab => \inst5|ALT_INV_state.T3~q\,
	datac => \inst6|ALT_INV_temp_opcode\(2),
	datad => \inst6|ALT_INV_temp_opcode\(5),
	combout => \inst5|present_wr~1_combout\);

\inst19|store[15]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst19|store[15]~0_combout\ = ( !\inst4|temp_op2_out\(11) & ( !\inst4|temp_op2_out\(0) & ( (!\inst4|temp_op2_out\(15) & (!\inst4|temp_op2_out\(14) & (!\inst4|temp_op2_out\(13) & !\inst4|temp_op2_out\(12)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(15),
	datab => \inst4|ALT_INV_temp_op2_out\(14),
	datac => \inst4|ALT_INV_temp_op2_out\(13),
	datad => \inst4|ALT_INV_temp_op2_out\(12),
	datae => \inst4|ALT_INV_temp_op2_out\(11),
	dataf => \inst4|ALT_INV_temp_op2_out\(0),
	combout => \inst19|store[15]~0_combout\);

\inst19|store[15]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst19|store[15]~1_combout\ = ( !\inst4|temp_op2_out\(6) & ( (!\inst4|temp_op2_out\(10) & (!\inst4|temp_op2_out\(9) & (!\inst4|temp_op2_out\(8) & !\inst4|temp_op2_out\(7)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000010000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(10),
	datab => \inst4|ALT_INV_temp_op2_out\(9),
	datac => \inst4|ALT_INV_temp_op2_out\(8),
	datad => \inst4|ALT_INV_temp_op2_out\(7),
	datae => \inst4|ALT_INV_temp_op2_out\(6),
	combout => \inst19|store[15]~1_combout\);

\inst19|store[15]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst19|store[15]~2_combout\ = (!\inst4|temp_op2_out\(4) & (!\inst4|temp_op2_out\(3) & (!\inst4|temp_op2_out\(2) & !\inst4|temp_op2_out\(1))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000010000000000000001000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(4),
	datab => \inst4|ALT_INV_temp_op2_out\(3),
	datac => \inst4|ALT_INV_temp_op2_out\(2),
	datad => \inst4|ALT_INV_temp_op2_out\(1),
	combout => \inst19|store[15]~2_combout\);

\inst19|store[15]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst19|store[15]~3_combout\ = ( \inst19|store[15]~1_combout\ & ( \inst19|store[15]~2_combout\ & ( (!\inst4|temp_op2_out\(5) & (\inst5|present_wr~0_combout\ & (\inst5|present_wr~1_combout\ & \inst19|store[15]~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|ALT_INV_temp_op2_out\(5),
	datab => \inst5|ALT_INV_present_wr~0_combout\,
	datac => \inst5|ALT_INV_present_wr~1_combout\,
	datad => \inst19|ALT_INV_store[15]~0_combout\,
	datae => \inst19|ALT_INV_store[15]~1_combout\,
	dataf => \inst19|ALT_INV_store[15]~2_combout\,
	combout => \inst19|store[15]~3_combout\);

\inst19|store[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(15),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst19|store[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst19|store\(15));

\inst19|store[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(14),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst19|store[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst19|store\(14));

\inst19|store[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(13),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst19|store[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst19|store\(13));

\inst19|store[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(12),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst19|store[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst19|store\(12));

\inst19|store[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(11),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst19|store[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst19|store\(11));

\inst19|store[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(10),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst19|store[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst19|store\(10));

\inst19|store[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(9),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst19|store[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst19|store\(9));

\inst19|store[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(8),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst19|store[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst19|store\(8));

\inst19|store[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(7),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst19|store[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst19|store\(7));

\inst19|store[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(6),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst19|store[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst19|store\(6));

\inst19|store[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(5),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst19|store[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst19|store\(5));

\inst19|store[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(4),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst19|store[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst19|store\(4));

\inst19|store[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(3),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst19|store[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst19|store\(3));

\inst19|store[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(2),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst19|store[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst19|store\(2));

\inst19|store[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(1),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst19|store[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst19|store\(1));

\inst19|store[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(0),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst19|store[15]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst19|store\(0));

\inst5|present_wr~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|present_wr~2_combout\ = (\inst5|present_wr~0_combout\ & \inst5|present_wr~1_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_present_wr~0_combout\,
	datab => \inst5|ALT_INV_present_wr~1_combout\,
	combout => \inst5|present_wr~2_combout\);

\inst5|dpcr_lsb_sel~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|dpcr_lsb_sel~1_combout\ = ( \inst6|temp_opcode\(5) & ( \inst5|dpcr_lsb_sel~0_combout\ & ( (!\inst6|temp_AM\(1) & (\inst6|temp_AM\(0) & (!\inst6|temp_opcode\(4) & \inst5|state.T3~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst6|ALT_INV_temp_opcode\(4),
	datad => \inst5|ALT_INV_state.T3~q\,
	datae => \inst6|ALT_INV_temp_opcode\(5),
	dataf => \inst5|ALT_INV_dpcr_lsb_sel~0_combout\,
	combout => \inst5|dpcr_lsb_sel~1_combout\);

\inst5|dpcr_wr~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|dpcr_wr~0_combout\ = ( \inst5|dpcr_lsb_sel~0_combout\ & ( (\inst6|temp_AM\(0) & (!\inst6|temp_opcode\(4) & (\inst5|state.T3~q\ & \inst6|temp_opcode\(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000010000000000000000000000000000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(0),
	datab => \inst6|ALT_INV_temp_opcode\(4),
	datac => \inst5|ALT_INV_state.T3~q\,
	datad => \inst6|ALT_INV_temp_opcode\(5),
	datae => \inst5|ALT_INV_dpcr_lsb_sel~0_combout\,
	combout => \inst5|dpcr_wr~0_combout\);

\inst5|sop_wr~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|sop_wr~1_combout\ = (\inst6|temp_opcode\(4) & (\inst5|state.T3~q\ & (\inst5|Mux1~9_combout\ & \inst5|sop_wr~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000001000000000000000100000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_opcode\(4),
	datab => \inst5|ALT_INV_state.T3~q\,
	datac => \inst5|ALT_INV_Mux1~9_combout\,
	datad => \inst5|ALT_INV_sop_wr~0_combout\,
	combout => \inst5|sop_wr~1_combout\);

\inst7|dpcr[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(15),
	asdata => \inst4|temp_op2_out\(15),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(31));

\inst7|dpcr[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(14),
	asdata => \inst4|temp_op2_out\(14),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(30));

\inst7|dpcr[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(13),
	asdata => \inst4|temp_op2_out\(13),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(29));

\inst7|dpcr[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(12),
	asdata => \inst4|temp_op2_out\(12),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(28));

\inst7|dpcr[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(11),
	asdata => \inst4|temp_op2_out\(11),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(27));

\inst7|dpcr[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(10),
	asdata => \inst4|temp_op2_out\(10),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(26));

\inst7|dpcr[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(9),
	asdata => \inst4|temp_op2_out\(9),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(25));

\inst7|dpcr[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(8),
	asdata => \inst4|temp_op2_out\(8),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(24));

\inst7|dpcr[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(7),
	asdata => \inst4|temp_op2_out\(7),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(23));

\inst7|dpcr[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(6),
	asdata => \inst4|temp_op2_out\(6),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(22));

\inst7|dpcr[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(5),
	asdata => \inst4|temp_op2_out\(5),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(21));

\inst7|dpcr[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(4),
	asdata => \inst4|temp_op2_out\(4),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(20));

\inst7|dpcr[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(3),
	asdata => \inst4|temp_op2_out\(3),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(19));

\inst7|dpcr[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(2),
	asdata => \inst4|temp_op2_out\(2),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(18));

\inst7|dpcr[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(1),
	asdata => \inst4|temp_op2_out\(1),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(17));

\inst7|dpcr[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst2|temp_op1_out\(0),
	asdata => \inst4|temp_op2_out\(0),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(16));

\inst7|dpcr[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(15),
	asdata => \inst2|temp_op1_out\(15),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(15));

\inst7|dpcr[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(14),
	asdata => \inst2|temp_op1_out\(14),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(14));

\inst7|dpcr[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(13),
	asdata => \inst2|temp_op1_out\(13),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(13));

\inst7|dpcr[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(12),
	asdata => \inst2|temp_op1_out\(12),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(12));

\inst7|dpcr[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(11),
	asdata => \inst2|temp_op1_out\(11),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(11));

\inst7|dpcr[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(10),
	asdata => \inst2|temp_op1_out\(10),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(10));

\inst7|dpcr[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(9),
	asdata => \inst2|temp_op1_out\(9),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(9));

\inst7|dpcr[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(8),
	asdata => \inst2|temp_op1_out\(8),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(8));

\inst7|dpcr[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(7),
	asdata => \inst2|temp_op1_out\(7),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(7));

\inst7|dpcr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(6),
	asdata => \inst2|temp_op1_out\(6),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(6));

\inst7|dpcr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(5),
	asdata => \inst2|temp_op1_out\(5),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(5));

\inst7|dpcr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(4),
	asdata => \inst2|temp_op1_out\(4),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(4));

\inst7|dpcr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(3),
	asdata => \inst2|temp_op1_out\(3),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(3));

\inst7|dpcr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(2),
	asdata => \inst2|temp_op1_out\(2),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(2));

\inst7|dpcr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(1),
	asdata => \inst2|temp_op1_out\(1),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(1));

\inst7|dpcr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(0),
	asdata => \inst2|temp_op1_out\(0),
	clrn => \ALT_INV_reset~input_o\,
	sload => \inst5|dpcr_lsb_sel~1_combout\,
	ena => \inst5|dpcr_wr~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|dpcr\(0));

\inst5|rf_input_sel[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|rf_input_sel[1]~1_combout\ = (\inst5|ld_r~0_combout\ & \inst5|Mux17~1_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~0_combout\,
	datab => \inst5|ALT_INV_Mux17~1_combout\,
	combout => \inst5|rf_input_sel[1]~1_combout\);

\inst5|rf_input_sel[0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|rf_input_sel[0]~2_combout\ = (!\inst5|ld_r~0_combout\) # (\inst5|Mux18~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101110111011101110111011101110111011101110111011101110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_ld_r~0_combout\,
	datab => \inst5|ALT_INV_Mux18~0_combout\,
	combout => \inst5|rf_input_sel[0]~2_combout\);

\inst7|sop[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(15),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|sop_wr~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sop\(15));

\inst7|sop[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(14),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|sop_wr~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sop\(14));

\inst7|sop[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(13),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|sop_wr~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sop\(13));

\inst7|sop[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(12),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|sop_wr~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sop\(12));

\inst7|sop[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(11),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|sop_wr~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sop\(11));

\inst7|sop[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(10),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|sop_wr~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sop\(10));

\inst7|sop[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(9),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|sop_wr~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sop\(9));

\inst7|sop[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(8),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|sop_wr~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sop\(8));

\inst7|sop[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(7),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|sop_wr~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sop\(7));

\inst7|sop[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(6),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|sop_wr~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sop\(6));

\inst7|sop[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(5),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|sop_wr~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sop\(5));

\inst7|sop[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(4),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|sop_wr~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sop\(4));

\inst7|sop[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(3),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|sop_wr~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sop\(3));

\inst7|sop[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(2),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|sop_wr~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sop\(2));

\inst7|sop[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(1),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|sop_wr~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sop\(1));

\inst7|sop[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst4|temp_op2_out\(0),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst5|sop_wr~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|sop\(0));

\inst5|state_is[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|state_is\(2) = (\inst5|state.T4~q\) # (\inst5|state.T3~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011101110111011101110111011101110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T3~q\,
	datab => \inst5|ALT_INV_state.T4~q\,
	combout => \inst5|state_is\(2));

\inst5|WideOr3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|WideOr3~combout\ = ((!\inst5|state.init~q\) # (\inst5|state.T3~q\)) # (\inst5|state.T1~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111011111110111111101111111011111110111111101111111011111110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T1~q\,
	datab => \inst5|ALT_INV_state.T3~q\,
	datac => \inst5|ALT_INV_state.init~q\,
	combout => \inst5|WideOr3~combout\);

\inst5|WideOr4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst5|WideOr4~combout\ = (\inst5|next_state.T1~0_combout\) # (\inst5|state.T1_1~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011101110111011101110111011101110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst5|ALT_INV_state.T1_1~q\,
	datab => \inst5|ALT_INV_next_state.T1~0_combout\,
	combout => \inst5|WideOr4~combout\);

ww_ir_write <= \ir_write~output_o\;

ww_z_flag <= \z_flag~output_o\;

ww_clr_z_flag <= \clr_z_flag~output_o\;

ww_alu_operation(2) <= \alu_operation[2]~output_o\;

ww_alu_operation(1) <= \alu_operation[1]~output_o\;

ww_alu_operation(0) <= \alu_operation[0]~output_o\;

ww_Op1_out(15) <= \Op1_out[15]~output_o\;

ww_Op1_out(14) <= \Op1_out[14]~output_o\;

ww_Op1_out(13) <= \Op1_out[13]~output_o\;

ww_Op1_out(12) <= \Op1_out[12]~output_o\;

ww_Op1_out(11) <= \Op1_out[11]~output_o\;

ww_Op1_out(10) <= \Op1_out[10]~output_o\;

ww_Op1_out(9) <= \Op1_out[9]~output_o\;

ww_Op1_out(8) <= \Op1_out[8]~output_o\;

ww_Op1_out(7) <= \Op1_out[7]~output_o\;

ww_Op1_out(6) <= \Op1_out[6]~output_o\;

ww_Op1_out(5) <= \Op1_out[5]~output_o\;

ww_Op1_out(4) <= \Op1_out[4]~output_o\;

ww_Op1_out(3) <= \Op1_out[3]~output_o\;

ww_Op1_out(2) <= \Op1_out[2]~output_o\;

ww_Op1_out(1) <= \Op1_out[1]~output_o\;

ww_Op1_out(0) <= \Op1_out[0]~output_o\;

ww_Op1_write <= \Op1_write~output_o\;

ww_op1_mux_select(1) <= \op1_mux_select[1]~output_o\;

ww_op1_mux_select(0) <= \op1_mux_select[0]~output_o\;

ww_op(15) <= \op[15]~output_o\;

ww_op(14) <= \op[14]~output_o\;

ww_op(13) <= \op[13]~output_o\;

ww_op(12) <= \op[12]~output_o\;

ww_op(11) <= \op[11]~output_o\;

ww_op(10) <= \op[10]~output_o\;

ww_op(9) <= \op[9]~output_o\;

ww_op(8) <= \op[8]~output_o\;

ww_op(7) <= \op[7]~output_o\;

ww_op(6) <= \op[6]~output_o\;

ww_op(5) <= \op[5]~output_o\;

ww_op(4) <= \op[4]~output_o\;

ww_op(3) <= \op[3]~output_o\;

ww_op(2) <= \op[2]~output_o\;

ww_op(1) <= \op[1]~output_o\;

ww_op(0) <= \op[0]~output_o\;

ww_check_AM <= \check_AM~output_o\;

ww_wr_en <= \wr_en~output_o\;

ww_Op2_out(15) <= \Op2_out[15]~output_o\;

ww_Op2_out(14) <= \Op2_out[14]~output_o\;

ww_Op2_out(13) <= \Op2_out[13]~output_o\;

ww_Op2_out(12) <= \Op2_out[12]~output_o\;

ww_Op2_out(11) <= \Op2_out[11]~output_o\;

ww_Op2_out(10) <= \Op2_out[10]~output_o\;

ww_Op2_out(9) <= \Op2_out[9]~output_o\;

ww_Op2_out(8) <= \Op2_out[8]~output_o\;

ww_Op2_out(7) <= \Op2_out[7]~output_o\;

ww_Op2_out(6) <= \Op2_out[6]~output_o\;

ww_Op2_out(5) <= \Op2_out[5]~output_o\;

ww_Op2_out(4) <= \Op2_out[4]~output_o\;

ww_Op2_out(3) <= \Op2_out[3]~output_o\;

ww_Op2_out(2) <= \Op2_out[2]~output_o\;

ww_Op2_out(1) <= \Op2_out[1]~output_o\;

ww_Op2_out(0) <= \Op2_out[0]~output_o\;

ww_Op2_write <= \Op2_write~output_o\;

ww_op2_mux_select(1) <= \op2_mux_select[1]~output_o\;

ww_op2_mux_select(0) <= \op2_mux_select[0]~output_o\;

ww_pc_write <= \pc_write~output_o\;

ww_pc_mux_sel(1) <= \pc_mux_sel[1]~output_o\;

ww_pc_mux_sel(0) <= \pc_mux_sel[0]~output_o\;

ww_present_out(15) <= \present_out[15]~output_o\;

ww_present_out(14) <= \present_out[14]~output_o\;

ww_present_out(13) <= \present_out[13]~output_o\;

ww_present_out(12) <= \present_out[12]~output_o\;

ww_present_out(11) <= \present_out[11]~output_o\;

ww_present_out(10) <= \present_out[10]~output_o\;

ww_present_out(9) <= \present_out[9]~output_o\;

ww_present_out(8) <= \present_out[8]~output_o\;

ww_present_out(7) <= \present_out[7]~output_o\;

ww_present_out(6) <= \present_out[6]~output_o\;

ww_present_out(5) <= \present_out[5]~output_o\;

ww_present_out(4) <= \present_out[4]~output_o\;

ww_present_out(3) <= \present_out[3]~output_o\;

ww_present_out(2) <= \present_out[2]~output_o\;

ww_present_out(1) <= \present_out[1]~output_o\;

ww_present_out(0) <= \present_out[0]~output_o\;

ww_present_wr <= \present_wr~output_o\;

ww_ld_r <= \ld_r~output_o\;

ww_ALU_out(15) <= \ALU_out[15]~output_o\;

ww_ALU_out(14) <= \ALU_out[14]~output_o\;

ww_ALU_out(13) <= \ALU_out[13]~output_o\;

ww_ALU_out(12) <= \ALU_out[12]~output_o\;

ww_ALU_out(11) <= \ALU_out[11]~output_o\;

ww_ALU_out(10) <= \ALU_out[10]~output_o\;

ww_ALU_out(9) <= \ALU_out[9]~output_o\;

ww_ALU_out(8) <= \ALU_out[8]~output_o\;

ww_ALU_out(7) <= \ALU_out[7]~output_o\;

ww_ALU_out(6) <= \ALU_out[6]~output_o\;

ww_ALU_out(5) <= \ALU_out[5]~output_o\;

ww_ALU_out(4) <= \ALU_out[4]~output_o\;

ww_ALU_out(3) <= \ALU_out[3]~output_o\;

ww_ALU_out(2) <= \ALU_out[2]~output_o\;

ww_ALU_out(1) <= \ALU_out[1]~output_o\;

ww_ALU_out(0) <= \ALU_out[0]~output_o\;

ww_dm_out(15) <= \dm_out[15]~output_o\;

ww_dm_out(14) <= \dm_out[14]~output_o\;

ww_dm_out(13) <= \dm_out[13]~output_o\;

ww_dm_out(12) <= \dm_out[12]~output_o\;

ww_dm_out(11) <= \dm_out[11]~output_o\;

ww_dm_out(10) <= \dm_out[10]~output_o\;

ww_dm_out(9) <= \dm_out[9]~output_o\;

ww_dm_out(8) <= \dm_out[8]~output_o\;

ww_dm_out(7) <= \dm_out[7]~output_o\;

ww_dm_out(6) <= \dm_out[6]~output_o\;

ww_dm_out(5) <= \dm_out[5]~output_o\;

ww_dm_out(4) <= \dm_out[4]~output_o\;

ww_dm_out(3) <= \dm_out[3]~output_o\;

ww_dm_out(2) <= \dm_out[2]~output_o\;

ww_dm_out(1) <= \dm_out[1]~output_o\;

ww_dm_out(0) <= \dm_out[0]~output_o\;

ww_dpcr_lsb_sel <= \dpcr_lsb_sel~output_o\;

ww_dpcr_wr <= \dpcr_wr~output_o\;

ww_sop_wr <= \sop_wr~output_o\;

ww_AM(1) <= \AM[1]~output_o\;

ww_AM(0) <= \AM[0]~output_o\;

ww_opcode(5) <= \opcode[5]~output_o\;

ww_opcode(4) <= \opcode[4]~output_o\;

ww_opcode(3) <= \opcode[3]~output_o\;

ww_opcode(2) <= \opcode[2]~output_o\;

ww_opcode(1) <= \opcode[1]~output_o\;

ww_opcode(0) <= \opcode[0]~output_o\;

ww_alu_result_prev(15) <= \alu_result_prev[15]~output_o\;

ww_alu_result_prev(14) <= \alu_result_prev[14]~output_o\;

ww_alu_result_prev(13) <= \alu_result_prev[13]~output_o\;

ww_alu_result_prev(12) <= \alu_result_prev[12]~output_o\;

ww_alu_result_prev(11) <= \alu_result_prev[11]~output_o\;

ww_alu_result_prev(10) <= \alu_result_prev[10]~output_o\;

ww_alu_result_prev(9) <= \alu_result_prev[9]~output_o\;

ww_alu_result_prev(8) <= \alu_result_prev[8]~output_o\;

ww_alu_result_prev(7) <= \alu_result_prev[7]~output_o\;

ww_alu_result_prev(6) <= \alu_result_prev[6]~output_o\;

ww_alu_result_prev(5) <= \alu_result_prev[5]~output_o\;

ww_alu_result_prev(4) <= \alu_result_prev[4]~output_o\;

ww_alu_result_prev(3) <= \alu_result_prev[3]~output_o\;

ww_alu_result_prev(2) <= \alu_result_prev[2]~output_o\;

ww_alu_result_prev(1) <= \alu_result_prev[1]~output_o\;

ww_alu_result_prev(0) <= \alu_result_prev[0]~output_o\;

ww_dpcr(31) <= \dpcr[31]~output_o\;

ww_dpcr(30) <= \dpcr[30]~output_o\;

ww_dpcr(29) <= \dpcr[29]~output_o\;

ww_dpcr(28) <= \dpcr[28]~output_o\;

ww_dpcr(27) <= \dpcr[27]~output_o\;

ww_dpcr(26) <= \dpcr[26]~output_o\;

ww_dpcr(25) <= \dpcr[25]~output_o\;

ww_dpcr(24) <= \dpcr[24]~output_o\;

ww_dpcr(23) <= \dpcr[23]~output_o\;

ww_dpcr(22) <= \dpcr[22]~output_o\;

ww_dpcr(21) <= \dpcr[21]~output_o\;

ww_dpcr(20) <= \dpcr[20]~output_o\;

ww_dpcr(19) <= \dpcr[19]~output_o\;

ww_dpcr(18) <= \dpcr[18]~output_o\;

ww_dpcr(17) <= \dpcr[17]~output_o\;

ww_dpcr(16) <= \dpcr[16]~output_o\;

ww_dpcr(15) <= \dpcr[15]~output_o\;

ww_dpcr(14) <= \dpcr[14]~output_o\;

ww_dpcr(13) <= \dpcr[13]~output_o\;

ww_dpcr(12) <= \dpcr[12]~output_o\;

ww_dpcr(11) <= \dpcr[11]~output_o\;

ww_dpcr(10) <= \dpcr[10]~output_o\;

ww_dpcr(9) <= \dpcr[9]~output_o\;

ww_dpcr(8) <= \dpcr[8]~output_o\;

ww_dpcr(7) <= \dpcr[7]~output_o\;

ww_dpcr(6) <= \dpcr[6]~output_o\;

ww_dpcr(5) <= \dpcr[5]~output_o\;

ww_dpcr(4) <= \dpcr[4]~output_o\;

ww_dpcr(3) <= \dpcr[3]~output_o\;

ww_dpcr(2) <= \dpcr[2]~output_o\;

ww_dpcr(1) <= \dpcr[1]~output_o\;

ww_dpcr(0) <= \dpcr[0]~output_o\;

ww_PC_out(15) <= \PC_out[15]~output_o\;

ww_PC_out(14) <= \PC_out[14]~output_o\;

ww_PC_out(13) <= \PC_out[13]~output_o\;

ww_PC_out(12) <= \PC_out[12]~output_o\;

ww_PC_out(11) <= \PC_out[11]~output_o\;

ww_PC_out(10) <= \PC_out[10]~output_o\;

ww_PC_out(9) <= \PC_out[9]~output_o\;

ww_PC_out(8) <= \PC_out[8]~output_o\;

ww_PC_out(7) <= \PC_out[7]~output_o\;

ww_PC_out(6) <= \PC_out[6]~output_o\;

ww_PC_out(5) <= \PC_out[5]~output_o\;

ww_PC_out(4) <= \PC_out[4]~output_o\;

ww_PC_out(3) <= \PC_out[3]~output_o\;

ww_PC_out(2) <= \PC_out[2]~output_o\;

ww_PC_out(1) <= \PC_out[1]~output_o\;

ww_PC_out(0) <= \PC_out[0]~output_o\;

ww_pm_outdata(15) <= \pm_outdata[15]~output_o\;

ww_pm_outdata(14) <= \pm_outdata[14]~output_o\;

ww_pm_outdata(13) <= \pm_outdata[13]~output_o\;

ww_pm_outdata(12) <= \pm_outdata[12]~output_o\;

ww_pm_outdata(11) <= \pm_outdata[11]~output_o\;

ww_pm_outdata(10) <= \pm_outdata[10]~output_o\;

ww_pm_outdata(9) <= \pm_outdata[9]~output_o\;

ww_pm_outdata(8) <= \pm_outdata[8]~output_o\;

ww_pm_outdata(7) <= \pm_outdata[7]~output_o\;

ww_pm_outdata(6) <= \pm_outdata[6]~output_o\;

ww_pm_outdata(5) <= \pm_outdata[5]~output_o\;

ww_pm_outdata(4) <= \pm_outdata[4]~output_o\;

ww_pm_outdata(3) <= \pm_outdata[3]~output_o\;

ww_pm_outdata(2) <= \pm_outdata[2]~output_o\;

ww_pm_outdata(1) <= \pm_outdata[1]~output_o\;

ww_pm_outdata(0) <= \pm_outdata[0]~output_o\;

ww_rf_mux(2) <= \rf_mux[2]~output_o\;

ww_rf_mux(1) <= \rf_mux[1]~output_o\;

ww_rf_mux(0) <= \rf_mux[0]~output_o\;

ww_Rx(15) <= \Rx[15]~output_o\;

ww_Rx(14) <= \Rx[14]~output_o\;

ww_Rx(13) <= \Rx[13]~output_o\;

ww_Rx(12) <= \Rx[12]~output_o\;

ww_Rx(11) <= \Rx[11]~output_o\;

ww_Rx(10) <= \Rx[10]~output_o\;

ww_Rx(9) <= \Rx[9]~output_o\;

ww_Rx(8) <= \Rx[8]~output_o\;

ww_Rx(7) <= \Rx[7]~output_o\;

ww_Rx(6) <= \Rx[6]~output_o\;

ww_Rx(5) <= \Rx[5]~output_o\;

ww_Rx(4) <= \Rx[4]~output_o\;

ww_Rx(3) <= \Rx[3]~output_o\;

ww_Rx(2) <= \Rx[2]~output_o\;

ww_Rx(1) <= \Rx[1]~output_o\;

ww_Rx(0) <= \Rx[0]~output_o\;

ww_Rx_out(3) <= \Rx_out[3]~output_o\;

ww_Rx_out(2) <= \Rx_out[2]~output_o\;

ww_Rx_out(1) <= \Rx_out[1]~output_o\;

ww_Rx_out(0) <= \Rx_out[0]~output_o\;

ww_Rz(15) <= \Rz[15]~output_o\;

ww_Rz(14) <= \Rz[14]~output_o\;

ww_Rz(13) <= \Rz[13]~output_o\;

ww_Rz(12) <= \Rz[12]~output_o\;

ww_Rz(11) <= \Rz[11]~output_o\;

ww_Rz(10) <= \Rz[10]~output_o\;

ww_Rz(9) <= \Rz[9]~output_o\;

ww_Rz(8) <= \Rz[8]~output_o\;

ww_Rz(7) <= \Rz[7]~output_o\;

ww_Rz(6) <= \Rz[6]~output_o\;

ww_Rz(5) <= \Rz[5]~output_o\;

ww_Rz(4) <= \Rz[4]~output_o\;

ww_Rz(3) <= \Rz[3]~output_o\;

ww_Rz(2) <= \Rz[2]~output_o\;

ww_Rz(1) <= \Rz[1]~output_o\;

ww_Rz(0) <= \Rz[0]~output_o\;

ww_Rz_out(3) <= \Rz_out[3]~output_o\;

ww_Rz_out(2) <= \Rz_out[2]~output_o\;

ww_Rz_out(1) <= \Rz_out[1]~output_o\;

ww_Rz_out(0) <= \Rz_out[0]~output_o\;

ww_sop(15) <= \sop[15]~output_o\;

ww_sop(14) <= \sop[14]~output_o\;

ww_sop(13) <= \sop[13]~output_o\;

ww_sop(12) <= \sop[12]~output_o\;

ww_sop(11) <= \sop[11]~output_o\;

ww_sop(10) <= \sop[10]~output_o\;

ww_sop(9) <= \sop[9]~output_o\;

ww_sop(8) <= \sop[8]~output_o\;

ww_sop(7) <= \sop[7]~output_o\;

ww_sop(6) <= \sop[6]~output_o\;

ww_sop(5) <= \sop[5]~output_o\;

ww_sop(4) <= \sop[4]~output_o\;

ww_sop(3) <= \sop[3]~output_o\;

ww_sop(2) <= \sop[2]~output_o\;

ww_sop(1) <= \sop[1]~output_o\;

ww_sop(0) <= \sop[0]~output_o\;

ww_state_is(2) <= \state_is[2]~output_o\;

ww_state_is(1) <= \state_is[1]~output_o\;

ww_state_is(0) <= \state_is[0]~output_o\;
END structure;


