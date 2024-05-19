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

-- DATE "05/12/2024 23:47:29"

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

ENTITY 	Fetch_testbench IS
    PORT (
	AM : OUT std_logic_vector(1 DOWNTO 0);
	ir_write : IN std_logic;
	check_AM : IN std_logic;
	reset : IN std_logic;
	clock : IN std_logic;
	pc_write : IN std_logic;
	ir : IN std_logic_vector(15 DOWNTO 0);
	mux_sel : IN std_logic_vector(1 DOWNTO 0);
	present_out : IN std_logic_vector(15 DOWNTO 0);
	rx : IN std_logic_vector(15 DOWNTO 0);
	op : OUT std_logic_vector(15 DOWNTO 0);
	opcode : OUT std_logic_vector(5 DOWNTO 0);
	PC_out : OUT std_logic_vector(15 DOWNTO 0);
	pm_outdata : OUT std_logic_vector(15 DOWNTO 0);
	Rx_out : OUT std_logic_vector(3 DOWNTO 0);
	Rz_out : OUT std_logic_vector(3 DOWNTO 0)
	);
END Fetch_testbench;

ARCHITECTURE structure OF Fetch_testbench IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_AM : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_ir_write : std_logic;
SIGNAL ww_check_AM : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_pc_write : std_logic;
SIGNAL ww_ir : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_mux_sel : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_present_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_rx : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_op : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_opcode : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_PC_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_pm_outdata : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Rx_out : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Rz_out : std_logic_vector(3 DOWNTO 0);
SIGNAL \AM[1]~output_o\ : std_logic;
SIGNAL \AM[0]~output_o\ : std_logic;
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
SIGNAL \opcode[5]~output_o\ : std_logic;
SIGNAL \opcode[4]~output_o\ : std_logic;
SIGNAL \opcode[3]~output_o\ : std_logic;
SIGNAL \opcode[2]~output_o\ : std_logic;
SIGNAL \opcode[1]~output_o\ : std_logic;
SIGNAL \opcode[0]~output_o\ : std_logic;
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
SIGNAL \Rx_out[3]~output_o\ : std_logic;
SIGNAL \Rx_out[2]~output_o\ : std_logic;
SIGNAL \Rx_out[1]~output_o\ : std_logic;
SIGNAL \Rx_out[0]~output_o\ : std_logic;
SIGNAL \Rz_out[3]~output_o\ : std_logic;
SIGNAL \Rz_out[2]~output_o\ : std_logic;
SIGNAL \Rz_out[1]~output_o\ : std_logic;
SIGNAL \Rz_out[0]~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \inst|Add0~61_sumout\ : std_logic;
SIGNAL \rx[0]~input_o\ : std_logic;
SIGNAL \ir[0]~input_o\ : std_logic;
SIGNAL \present_out[0]~input_o\ : std_logic;
SIGNAL \mux_sel[0]~input_o\ : std_logic;
SIGNAL \mux_sel[1]~input_o\ : std_logic;
SIGNAL \inst|PC_Mux_16|Mux15~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \inst|PC_Reg_16|Reg_out[15]~0_combout\ : std_logic;
SIGNAL \pc_write~input_o\ : std_logic;
SIGNAL \inst|Add0~62\ : std_logic;
SIGNAL \inst|Add0~57_sumout\ : std_logic;
SIGNAL \rx[1]~input_o\ : std_logic;
SIGNAL \ir[1]~input_o\ : std_logic;
SIGNAL \present_out[1]~input_o\ : std_logic;
SIGNAL \inst|PC_Mux_16|Mux14~0_combout\ : std_logic;
SIGNAL \inst|Add0~58\ : std_logic;
SIGNAL \inst|Add0~53_sumout\ : std_logic;
SIGNAL \rx[2]~input_o\ : std_logic;
SIGNAL \ir[2]~input_o\ : std_logic;
SIGNAL \present_out[2]~input_o\ : std_logic;
SIGNAL \inst|PC_Mux_16|Mux13~0_combout\ : std_logic;
SIGNAL \inst|Add0~54\ : std_logic;
SIGNAL \inst|Add0~49_sumout\ : std_logic;
SIGNAL \rx[3]~input_o\ : std_logic;
SIGNAL \ir[3]~input_o\ : std_logic;
SIGNAL \present_out[3]~input_o\ : std_logic;
SIGNAL \inst|PC_Mux_16|Mux12~0_combout\ : std_logic;
SIGNAL \inst|Add0~50\ : std_logic;
SIGNAL \inst|Add0~45_sumout\ : std_logic;
SIGNAL \rx[4]~input_o\ : std_logic;
SIGNAL \ir[4]~input_o\ : std_logic;
SIGNAL \present_out[4]~input_o\ : std_logic;
SIGNAL \inst|PC_Mux_16|Mux11~0_combout\ : std_logic;
SIGNAL \inst3|memory~534_combout\ : std_logic;
SIGNAL \ir_write~input_o\ : std_logic;
SIGNAL \check_AM~input_o\ : std_logic;
SIGNAL \inst3|memory~549_combout\ : std_logic;
SIGNAL \inst6|op[15]~0_combout\ : std_logic;
SIGNAL \inst6|op[14]~1_combout\ : std_logic;
SIGNAL \inst3|memory~535_combout\ : std_logic;
SIGNAL \inst6|op[13]~2_combout\ : std_logic;
SIGNAL \inst3|memory~536_combout\ : std_logic;
SIGNAL \inst6|op[12]~3_combout\ : std_logic;
SIGNAL \inst3|memory~537_combout\ : std_logic;
SIGNAL \inst6|op[11]~4_combout\ : std_logic;
SIGNAL \inst3|memory~538_combout\ : std_logic;
SIGNAL \inst6|op[10]~5_combout\ : std_logic;
SIGNAL \inst3|memory~548_combout\ : std_logic;
SIGNAL \inst6|op[9]~6_combout\ : std_logic;
SIGNAL \inst3|memory~539_combout\ : std_logic;
SIGNAL \inst6|op[8]~7_combout\ : std_logic;
SIGNAL \inst3|memory~547_combout\ : std_logic;
SIGNAL \inst6|op[7]~8_combout\ : std_logic;
SIGNAL \inst3|memory~540_combout\ : std_logic;
SIGNAL \inst6|op[6]~9_combout\ : std_logic;
SIGNAL \inst3|memory~546_combout\ : std_logic;
SIGNAL \inst6|op[5]~10_combout\ : std_logic;
SIGNAL \inst3|memory~545_combout\ : std_logic;
SIGNAL \inst6|op[4]~11_combout\ : std_logic;
SIGNAL \inst3|memory~544_combout\ : std_logic;
SIGNAL \inst6|op[3]~12_combout\ : std_logic;
SIGNAL \inst3|memory~541_combout\ : std_logic;
SIGNAL \inst6|op[2]~13_combout\ : std_logic;
SIGNAL \inst3|memory~543_combout\ : std_logic;
SIGNAL \inst6|op[1]~14_combout\ : std_logic;
SIGNAL \inst3|memory~542_combout\ : std_logic;
SIGNAL \inst6|op[0]~15_combout\ : std_logic;
SIGNAL \inst|Add0~46\ : std_logic;
SIGNAL \inst|Add0~41_sumout\ : std_logic;
SIGNAL \rx[5]~input_o\ : std_logic;
SIGNAL \ir[5]~input_o\ : std_logic;
SIGNAL \present_out[5]~input_o\ : std_logic;
SIGNAL \inst|PC_Mux_16|Mux10~0_combout\ : std_logic;
SIGNAL \inst|Add0~42\ : std_logic;
SIGNAL \inst|Add0~37_sumout\ : std_logic;
SIGNAL \rx[6]~input_o\ : std_logic;
SIGNAL \ir[6]~input_o\ : std_logic;
SIGNAL \present_out[6]~input_o\ : std_logic;
SIGNAL \inst|PC_Mux_16|Mux9~0_combout\ : std_logic;
SIGNAL \inst|Add0~38\ : std_logic;
SIGNAL \inst|Add0~33_sumout\ : std_logic;
SIGNAL \rx[7]~input_o\ : std_logic;
SIGNAL \ir[7]~input_o\ : std_logic;
SIGNAL \present_out[7]~input_o\ : std_logic;
SIGNAL \inst|PC_Mux_16|Mux8~0_combout\ : std_logic;
SIGNAL \inst|Add0~34\ : std_logic;
SIGNAL \inst|Add0~29_sumout\ : std_logic;
SIGNAL \rx[8]~input_o\ : std_logic;
SIGNAL \ir[8]~input_o\ : std_logic;
SIGNAL \present_out[8]~input_o\ : std_logic;
SIGNAL \inst|PC_Mux_16|Mux7~0_combout\ : std_logic;
SIGNAL \inst|Add0~30\ : std_logic;
SIGNAL \inst|Add0~25_sumout\ : std_logic;
SIGNAL \rx[9]~input_o\ : std_logic;
SIGNAL \ir[9]~input_o\ : std_logic;
SIGNAL \present_out[9]~input_o\ : std_logic;
SIGNAL \inst|PC_Mux_16|Mux6~0_combout\ : std_logic;
SIGNAL \inst|Add0~26\ : std_logic;
SIGNAL \inst|Add0~21_sumout\ : std_logic;
SIGNAL \rx[10]~input_o\ : std_logic;
SIGNAL \ir[10]~input_o\ : std_logic;
SIGNAL \present_out[10]~input_o\ : std_logic;
SIGNAL \inst|PC_Mux_16|Mux5~0_combout\ : std_logic;
SIGNAL \inst|Add0~22\ : std_logic;
SIGNAL \inst|Add0~17_sumout\ : std_logic;
SIGNAL \rx[11]~input_o\ : std_logic;
SIGNAL \ir[11]~input_o\ : std_logic;
SIGNAL \present_out[11]~input_o\ : std_logic;
SIGNAL \inst|PC_Mux_16|Mux4~0_combout\ : std_logic;
SIGNAL \inst|Add0~18\ : std_logic;
SIGNAL \inst|Add0~13_sumout\ : std_logic;
SIGNAL \rx[12]~input_o\ : std_logic;
SIGNAL \ir[12]~input_o\ : std_logic;
SIGNAL \present_out[12]~input_o\ : std_logic;
SIGNAL \inst|PC_Mux_16|Mux3~0_combout\ : std_logic;
SIGNAL \inst|Add0~14\ : std_logic;
SIGNAL \inst|Add0~9_sumout\ : std_logic;
SIGNAL \rx[13]~input_o\ : std_logic;
SIGNAL \ir[13]~input_o\ : std_logic;
SIGNAL \present_out[13]~input_o\ : std_logic;
SIGNAL \inst|PC_Mux_16|Mux2~0_combout\ : std_logic;
SIGNAL \inst|Add0~10\ : std_logic;
SIGNAL \inst|Add0~5_sumout\ : std_logic;
SIGNAL \rx[14]~input_o\ : std_logic;
SIGNAL \ir[14]~input_o\ : std_logic;
SIGNAL \present_out[14]~input_o\ : std_logic;
SIGNAL \inst|PC_Mux_16|Mux1~0_combout\ : std_logic;
SIGNAL \inst|Add0~6\ : std_logic;
SIGNAL \inst|Add0~1_sumout\ : std_logic;
SIGNAL \rx[15]~input_o\ : std_logic;
SIGNAL \ir[15]~input_o\ : std_logic;
SIGNAL \present_out[15]~input_o\ : std_logic;
SIGNAL \inst|PC_Mux_16|Mux0~0_combout\ : std_logic;
SIGNAL \inst3|pm_outdata\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst|PC_Reg_16|Reg_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst6|IR|Reg_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst6|AM\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst6|opcode\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst6|Rx\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst6|Rz\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst6|ALT_INV_Rz\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst6|ALT_INV_Rx\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst6|ALT_INV_opcode\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst6|ALT_INV_AM\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst6|IR|ALT_INV_Reg_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_present_out[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_rx[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_present_out[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_rx[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_present_out[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_rx[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_present_out[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_rx[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_present_out[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_rx[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_present_out[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_rx[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_present_out[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_rx[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_present_out[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_rx[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_present_out[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_rx[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_present_out[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_rx[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_present_out[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_rx[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_present_out[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_rx[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_present_out[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_rx[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_present_out[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_rx[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_present_out[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_rx[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_mux_sel[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_mux_sel[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_present_out[15]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[15]~input_o\ : std_logic;
SIGNAL \ALT_INV_rx[15]~input_o\ : std_logic;
SIGNAL \ALT_INV_clock~input_o\ : std_logic;
SIGNAL \ALT_INV_check_AM~input_o\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~61_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~57_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~53_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~49_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~45_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~41_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~37_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~29_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \inst|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \inst|PC_Reg_16|ALT_INV_Reg_out\ : std_logic_vector(15 DOWNTO 0);

BEGIN

AM <= ww_AM;
ww_ir_write <= ir_write;
ww_check_AM <= check_AM;
ww_reset <= reset;
ww_clock <= clock;
ww_pc_write <= pc_write;
ww_ir <= ir;
ww_mux_sel <= mux_sel;
ww_present_out <= present_out;
ww_rx <= rx;
op <= ww_op;
opcode <= ww_opcode;
PC_out <= ww_PC_out;
pm_outdata <= ww_pm_outdata;
Rx_out <= ww_Rx_out;
Rz_out <= ww_Rz_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\inst6|ALT_INV_Rz\(0) <= NOT \inst6|Rz\(0);
\inst6|ALT_INV_Rz\(1) <= NOT \inst6|Rz\(1);
\inst6|ALT_INV_Rz\(2) <= NOT \inst6|Rz\(2);
\inst6|ALT_INV_Rz\(3) <= NOT \inst6|Rz\(3);
\inst6|ALT_INV_Rx\(0) <= NOT \inst6|Rx\(0);
\inst6|ALT_INV_Rx\(1) <= NOT \inst6|Rx\(1);
\inst6|ALT_INV_Rx\(2) <= NOT \inst6|Rx\(2);
\inst6|ALT_INV_Rx\(3) <= NOT \inst6|Rx\(3);
\inst6|ALT_INV_opcode\(0) <= NOT \inst6|opcode\(0);
\inst6|ALT_INV_opcode\(1) <= NOT \inst6|opcode\(1);
\inst6|ALT_INV_opcode\(2) <= NOT \inst6|opcode\(2);
\inst6|ALT_INV_opcode\(3) <= NOT \inst6|opcode\(3);
\inst6|ALT_INV_opcode\(4) <= NOT \inst6|opcode\(4);
\inst6|ALT_INV_opcode\(5) <= NOT \inst6|opcode\(5);
\inst6|ALT_INV_AM\(0) <= NOT \inst6|AM\(0);
\inst6|ALT_INV_AM\(1) <= NOT \inst6|AM\(1);
\inst6|IR|ALT_INV_Reg_out\(0) <= NOT \inst6|IR|Reg_out\(0);
\ALT_INV_present_out[0]~input_o\ <= NOT \present_out[0]~input_o\;
\ALT_INV_ir[0]~input_o\ <= NOT \ir[0]~input_o\;
\ALT_INV_rx[0]~input_o\ <= NOT \rx[0]~input_o\;
\ALT_INV_present_out[1]~input_o\ <= NOT \present_out[1]~input_o\;
\ALT_INV_ir[1]~input_o\ <= NOT \ir[1]~input_o\;
\ALT_INV_rx[1]~input_o\ <= NOT \rx[1]~input_o\;
\ALT_INV_present_out[2]~input_o\ <= NOT \present_out[2]~input_o\;
\ALT_INV_ir[2]~input_o\ <= NOT \ir[2]~input_o\;
\ALT_INV_rx[2]~input_o\ <= NOT \rx[2]~input_o\;
\ALT_INV_present_out[3]~input_o\ <= NOT \present_out[3]~input_o\;
\ALT_INV_ir[3]~input_o\ <= NOT \ir[3]~input_o\;
\ALT_INV_rx[3]~input_o\ <= NOT \rx[3]~input_o\;
\ALT_INV_present_out[4]~input_o\ <= NOT \present_out[4]~input_o\;
\ALT_INV_ir[4]~input_o\ <= NOT \ir[4]~input_o\;
\ALT_INV_rx[4]~input_o\ <= NOT \rx[4]~input_o\;
\ALT_INV_present_out[5]~input_o\ <= NOT \present_out[5]~input_o\;
\ALT_INV_ir[5]~input_o\ <= NOT \ir[5]~input_o\;
\ALT_INV_rx[5]~input_o\ <= NOT \rx[5]~input_o\;
\ALT_INV_present_out[6]~input_o\ <= NOT \present_out[6]~input_o\;
\ALT_INV_ir[6]~input_o\ <= NOT \ir[6]~input_o\;
\ALT_INV_rx[6]~input_o\ <= NOT \rx[6]~input_o\;
\ALT_INV_present_out[7]~input_o\ <= NOT \present_out[7]~input_o\;
\ALT_INV_ir[7]~input_o\ <= NOT \ir[7]~input_o\;
\ALT_INV_rx[7]~input_o\ <= NOT \rx[7]~input_o\;
\ALT_INV_present_out[8]~input_o\ <= NOT \present_out[8]~input_o\;
\ALT_INV_ir[8]~input_o\ <= NOT \ir[8]~input_o\;
\ALT_INV_rx[8]~input_o\ <= NOT \rx[8]~input_o\;
\ALT_INV_present_out[9]~input_o\ <= NOT \present_out[9]~input_o\;
\ALT_INV_ir[9]~input_o\ <= NOT \ir[9]~input_o\;
\ALT_INV_rx[9]~input_o\ <= NOT \rx[9]~input_o\;
\ALT_INV_present_out[10]~input_o\ <= NOT \present_out[10]~input_o\;
\ALT_INV_ir[10]~input_o\ <= NOT \ir[10]~input_o\;
\ALT_INV_rx[10]~input_o\ <= NOT \rx[10]~input_o\;
\ALT_INV_present_out[11]~input_o\ <= NOT \present_out[11]~input_o\;
\ALT_INV_ir[11]~input_o\ <= NOT \ir[11]~input_o\;
\ALT_INV_rx[11]~input_o\ <= NOT \rx[11]~input_o\;
\ALT_INV_present_out[12]~input_o\ <= NOT \present_out[12]~input_o\;
\ALT_INV_ir[12]~input_o\ <= NOT \ir[12]~input_o\;
\ALT_INV_rx[12]~input_o\ <= NOT \rx[12]~input_o\;
\ALT_INV_present_out[13]~input_o\ <= NOT \present_out[13]~input_o\;
\ALT_INV_ir[13]~input_o\ <= NOT \ir[13]~input_o\;
\ALT_INV_rx[13]~input_o\ <= NOT \rx[13]~input_o\;
\ALT_INV_present_out[14]~input_o\ <= NOT \present_out[14]~input_o\;
\ALT_INV_ir[14]~input_o\ <= NOT \ir[14]~input_o\;
\ALT_INV_rx[14]~input_o\ <= NOT \rx[14]~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_mux_sel[1]~input_o\ <= NOT \mux_sel[1]~input_o\;
\ALT_INV_mux_sel[0]~input_o\ <= NOT \mux_sel[0]~input_o\;
\ALT_INV_present_out[15]~input_o\ <= NOT \present_out[15]~input_o\;
\ALT_INV_ir[15]~input_o\ <= NOT \ir[15]~input_o\;
\ALT_INV_rx[15]~input_o\ <= NOT \rx[15]~input_o\;
\ALT_INV_clock~input_o\ <= NOT \clock~input_o\;
\ALT_INV_check_AM~input_o\ <= NOT \check_AM~input_o\;
\inst6|IR|ALT_INV_Reg_out\(1) <= NOT \inst6|IR|Reg_out\(1);
\inst6|IR|ALT_INV_Reg_out\(2) <= NOT \inst6|IR|Reg_out\(2);
\inst6|IR|ALT_INV_Reg_out\(3) <= NOT \inst6|IR|Reg_out\(3);
\inst6|IR|ALT_INV_Reg_out\(4) <= NOT \inst6|IR|Reg_out\(4);
\inst6|IR|ALT_INV_Reg_out\(5) <= NOT \inst6|IR|Reg_out\(5);
\inst6|IR|ALT_INV_Reg_out\(6) <= NOT \inst6|IR|Reg_out\(6);
\inst6|IR|ALT_INV_Reg_out\(7) <= NOT \inst6|IR|Reg_out\(7);
\inst6|IR|ALT_INV_Reg_out\(8) <= NOT \inst6|IR|Reg_out\(8);
\inst6|IR|ALT_INV_Reg_out\(9) <= NOT \inst6|IR|Reg_out\(9);
\inst6|IR|ALT_INV_Reg_out\(10) <= NOT \inst6|IR|Reg_out\(10);
\inst6|IR|ALT_INV_Reg_out\(11) <= NOT \inst6|IR|Reg_out\(11);
\inst6|IR|ALT_INV_Reg_out\(12) <= NOT \inst6|IR|Reg_out\(12);
\inst6|IR|ALT_INV_Reg_out\(13) <= NOT \inst6|IR|Reg_out\(13);
\inst6|IR|ALT_INV_Reg_out\(14) <= NOT \inst6|IR|Reg_out\(14);
\inst6|IR|ALT_INV_Reg_out\(15) <= NOT \inst6|IR|Reg_out\(15);
\inst|ALT_INV_Add0~61_sumout\ <= NOT \inst|Add0~61_sumout\;
\inst|ALT_INV_Add0~57_sumout\ <= NOT \inst|Add0~57_sumout\;
\inst|ALT_INV_Add0~53_sumout\ <= NOT \inst|Add0~53_sumout\;
\inst|ALT_INV_Add0~49_sumout\ <= NOT \inst|Add0~49_sumout\;
\inst|ALT_INV_Add0~45_sumout\ <= NOT \inst|Add0~45_sumout\;
\inst|ALT_INV_Add0~41_sumout\ <= NOT \inst|Add0~41_sumout\;
\inst|ALT_INV_Add0~37_sumout\ <= NOT \inst|Add0~37_sumout\;
\inst|ALT_INV_Add0~33_sumout\ <= NOT \inst|Add0~33_sumout\;
\inst|ALT_INV_Add0~29_sumout\ <= NOT \inst|Add0~29_sumout\;
\inst|ALT_INV_Add0~25_sumout\ <= NOT \inst|Add0~25_sumout\;
\inst|ALT_INV_Add0~21_sumout\ <= NOT \inst|Add0~21_sumout\;
\inst|ALT_INV_Add0~17_sumout\ <= NOT \inst|Add0~17_sumout\;
\inst|ALT_INV_Add0~13_sumout\ <= NOT \inst|Add0~13_sumout\;
\inst|ALT_INV_Add0~9_sumout\ <= NOT \inst|Add0~9_sumout\;
\inst|ALT_INV_Add0~5_sumout\ <= NOT \inst|Add0~5_sumout\;
\inst|ALT_INV_Add0~1_sumout\ <= NOT \inst|Add0~1_sumout\;
\inst|PC_Reg_16|ALT_INV_Reg_out\(0) <= NOT \inst|PC_Reg_16|Reg_out\(0);
\inst|PC_Reg_16|ALT_INV_Reg_out\(1) <= NOT \inst|PC_Reg_16|Reg_out\(1);
\inst|PC_Reg_16|ALT_INV_Reg_out\(2) <= NOT \inst|PC_Reg_16|Reg_out\(2);
\inst|PC_Reg_16|ALT_INV_Reg_out\(3) <= NOT \inst|PC_Reg_16|Reg_out\(3);
\inst|PC_Reg_16|ALT_INV_Reg_out\(4) <= NOT \inst|PC_Reg_16|Reg_out\(4);
\inst|PC_Reg_16|ALT_INV_Reg_out\(5) <= NOT \inst|PC_Reg_16|Reg_out\(5);
\inst|PC_Reg_16|ALT_INV_Reg_out\(6) <= NOT \inst|PC_Reg_16|Reg_out\(6);
\inst|PC_Reg_16|ALT_INV_Reg_out\(7) <= NOT \inst|PC_Reg_16|Reg_out\(7);
\inst|PC_Reg_16|ALT_INV_Reg_out\(8) <= NOT \inst|PC_Reg_16|Reg_out\(8);
\inst|PC_Reg_16|ALT_INV_Reg_out\(9) <= NOT \inst|PC_Reg_16|Reg_out\(9);
\inst|PC_Reg_16|ALT_INV_Reg_out\(10) <= NOT \inst|PC_Reg_16|Reg_out\(10);
\inst|PC_Reg_16|ALT_INV_Reg_out\(11) <= NOT \inst|PC_Reg_16|Reg_out\(11);
\inst|PC_Reg_16|ALT_INV_Reg_out\(12) <= NOT \inst|PC_Reg_16|Reg_out\(12);
\inst|PC_Reg_16|ALT_INV_Reg_out\(13) <= NOT \inst|PC_Reg_16|Reg_out\(13);
\inst|PC_Reg_16|ALT_INV_Reg_out\(14) <= NOT \inst|PC_Reg_16|Reg_out\(14);
\inst|PC_Reg_16|ALT_INV_Reg_out\(15) <= NOT \inst|PC_Reg_16|Reg_out\(15);

\AM[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|AM\(1),
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
	i => \inst6|AM\(0),
	devoe => ww_devoe,
	o => \AM[0]~output_o\);

\op[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|op[15]~0_combout\,
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
	i => \inst6|op[14]~1_combout\,
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
	i => \inst6|op[13]~2_combout\,
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
	i => \inst6|op[12]~3_combout\,
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
	i => \inst6|op[11]~4_combout\,
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
	i => \inst6|op[10]~5_combout\,
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
	i => \inst6|op[9]~6_combout\,
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
	i => \inst6|op[8]~7_combout\,
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
	i => \inst6|op[7]~8_combout\,
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
	i => \inst6|op[6]~9_combout\,
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
	i => \inst6|op[5]~10_combout\,
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
	i => \inst6|op[4]~11_combout\,
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
	i => \inst6|op[3]~12_combout\,
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
	i => \inst6|op[2]~13_combout\,
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
	i => \inst6|op[1]~14_combout\,
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
	i => \inst6|op[0]~15_combout\,
	devoe => ww_devoe,
	o => \op[0]~output_o\);

\opcode[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|opcode\(5),
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
	i => \inst6|opcode\(4),
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
	i => \inst6|opcode\(3),
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
	i => \inst6|opcode\(2),
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
	i => \inst6|opcode\(1),
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
	i => \inst6|opcode\(0),
	devoe => ww_devoe,
	o => \opcode[0]~output_o\);

\PC_out[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|PC_Reg_16|Reg_out\(15),
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
	i => \inst|PC_Reg_16|Reg_out\(14),
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
	i => \inst|PC_Reg_16|Reg_out\(13),
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
	i => \inst|PC_Reg_16|Reg_out\(12),
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
	i => \inst|PC_Reg_16|Reg_out\(11),
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
	i => \inst|PC_Reg_16|Reg_out\(10),
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
	i => \inst|PC_Reg_16|Reg_out\(9),
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
	i => \inst|PC_Reg_16|Reg_out\(8),
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
	i => \inst|PC_Reg_16|Reg_out\(7),
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
	i => \inst|PC_Reg_16|Reg_out\(6),
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
	i => \inst|PC_Reg_16|Reg_out\(5),
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
	i => \inst|PC_Reg_16|Reg_out\(4),
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
	i => \inst|PC_Reg_16|Reg_out\(3),
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
	i => \inst|PC_Reg_16|Reg_out\(2),
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
	i => \inst|PC_Reg_16|Reg_out\(1),
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
	i => \inst|PC_Reg_16|Reg_out\(0),
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
	i => \inst3|pm_outdata\(15),
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
	i => \inst3|pm_outdata\(14),
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
	i => \inst3|pm_outdata\(13),
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
	i => \inst3|pm_outdata\(12),
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
	i => \inst3|pm_outdata\(11),
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
	i => \inst3|pm_outdata\(10),
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
	i => \inst3|pm_outdata\(9),
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
	i => \inst3|pm_outdata\(8),
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
	i => \inst3|pm_outdata\(7),
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
	i => \inst3|pm_outdata\(6),
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
	i => \inst3|pm_outdata\(5),
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
	i => \inst3|pm_outdata\(4),
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
	i => \inst3|pm_outdata\(3),
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
	i => \inst3|pm_outdata\(2),
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
	i => \inst3|pm_outdata\(1),
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
	i => \inst3|pm_outdata\(0),
	devoe => ww_devoe,
	o => \pm_outdata[0]~output_o\);

\Rx_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|Rx\(3),
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
	i => \inst6|Rx\(2),
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
	i => \inst6|Rx\(1),
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
	i => \inst6|Rx\(0),
	devoe => ww_devoe,
	o => \Rx_out[0]~output_o\);

\Rz_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst6|Rz\(3),
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
	i => \inst6|Rz\(2),
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
	i => \inst6|Rz\(1),
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
	i => \inst6|Rz\(0),
	devoe => ww_devoe,
	o => \Rz_out[0]~output_o\);

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
-- \inst|Add0~61_sumout\ = SUM(( \inst|PC_Reg_16|Reg_out\(0) ) + ( VCC ) + ( !VCC ))
-- \inst|Add0~62\ = CARRY(( \inst|PC_Reg_16|Reg_out\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(0),
	cin => GND,
	sumout => \inst|Add0~61_sumout\,
	cout => \inst|Add0~62\);

\rx[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(0),
	o => \rx[0]~input_o\);

\ir[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(0),
	o => \ir[0]~input_o\);

\present_out[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(0),
	o => \present_out[0]~input_o\);

\mux_sel[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mux_sel(0),
	o => \mux_sel[0]~input_o\);

\mux_sel[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mux_sel(1),
	o => \mux_sel[1]~input_o\);

\inst|PC_Mux_16|Mux15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|PC_Mux_16|Mux15~0_combout\ = ( \mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \present_out[0]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \ir[0]~input_o\ ) ) ) # ( \mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( 
-- \rx[0]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( \inst|Add0~61_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_Add0~61_sumout\,
	datab => \ALT_INV_rx[0]~input_o\,
	datac => \ALT_INV_ir[0]~input_o\,
	datad => \ALT_INV_present_out[0]~input_o\,
	datae => \ALT_INV_mux_sel[0]~input_o\,
	dataf => \ALT_INV_mux_sel[1]~input_o\,
	combout => \inst|PC_Mux_16|Mux15~0_combout\);

\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

\inst|PC_Reg_16|Reg_out[15]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|PC_Reg_16|Reg_out[15]~0_combout\ = (!\mux_sel[0]~input_o\ & (!\mux_sel[1]~input_o\ & \reset~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000001000000010000000100000001000000010000000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_mux_sel[0]~input_o\,
	datab => \ALT_INV_mux_sel[1]~input_o\,
	datac => \ALT_INV_reset~input_o\,
	combout => \inst|PC_Reg_16|Reg_out[15]~0_combout\);

\pc_write~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pc_write,
	o => \pc_write~input_o\);

\inst|PC_Reg_16|Reg_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|PC_Mux_16|Mux15~0_combout\,
	sclr => \inst|PC_Reg_16|Reg_out[15]~0_combout\,
	ena => \pc_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|PC_Reg_16|Reg_out\(0));

\inst|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~57_sumout\ = SUM(( \inst|PC_Reg_16|Reg_out\(1) ) + ( GND ) + ( \inst|Add0~62\ ))
-- \inst|Add0~58\ = CARRY(( \inst|PC_Reg_16|Reg_out\(1) ) + ( GND ) + ( \inst|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(1),
	cin => \inst|Add0~62\,
	sumout => \inst|Add0~57_sumout\,
	cout => \inst|Add0~58\);

\rx[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(1),
	o => \rx[1]~input_o\);

\ir[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(1),
	o => \ir[1]~input_o\);

\present_out[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(1),
	o => \present_out[1]~input_o\);

\inst|PC_Mux_16|Mux14~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|PC_Mux_16|Mux14~0_combout\ = ( \mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \present_out[1]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \ir[1]~input_o\ ) ) ) # ( \mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( 
-- \rx[1]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( \inst|Add0~57_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_Add0~57_sumout\,
	datab => \ALT_INV_rx[1]~input_o\,
	datac => \ALT_INV_ir[1]~input_o\,
	datad => \ALT_INV_present_out[1]~input_o\,
	datae => \ALT_INV_mux_sel[0]~input_o\,
	dataf => \ALT_INV_mux_sel[1]~input_o\,
	combout => \inst|PC_Mux_16|Mux14~0_combout\);

\inst|PC_Reg_16|Reg_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|PC_Mux_16|Mux14~0_combout\,
	sclr => \inst|PC_Reg_16|Reg_out[15]~0_combout\,
	ena => \pc_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|PC_Reg_16|Reg_out\(1));

\inst|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~53_sumout\ = SUM(( \inst|PC_Reg_16|Reg_out\(2) ) + ( GND ) + ( \inst|Add0~58\ ))
-- \inst|Add0~54\ = CARRY(( \inst|PC_Reg_16|Reg_out\(2) ) + ( GND ) + ( \inst|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(2),
	cin => \inst|Add0~58\,
	sumout => \inst|Add0~53_sumout\,
	cout => \inst|Add0~54\);

\rx[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(2),
	o => \rx[2]~input_o\);

\ir[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(2),
	o => \ir[2]~input_o\);

\present_out[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(2),
	o => \present_out[2]~input_o\);

\inst|PC_Mux_16|Mux13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|PC_Mux_16|Mux13~0_combout\ = ( \mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \present_out[2]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \ir[2]~input_o\ ) ) ) # ( \mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( 
-- \rx[2]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( \inst|Add0~53_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_Add0~53_sumout\,
	datab => \ALT_INV_rx[2]~input_o\,
	datac => \ALT_INV_ir[2]~input_o\,
	datad => \ALT_INV_present_out[2]~input_o\,
	datae => \ALT_INV_mux_sel[0]~input_o\,
	dataf => \ALT_INV_mux_sel[1]~input_o\,
	combout => \inst|PC_Mux_16|Mux13~0_combout\);

\inst|PC_Reg_16|Reg_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|PC_Mux_16|Mux13~0_combout\,
	sclr => \inst|PC_Reg_16|Reg_out[15]~0_combout\,
	ena => \pc_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|PC_Reg_16|Reg_out\(2));

\inst|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~49_sumout\ = SUM(( \inst|PC_Reg_16|Reg_out\(3) ) + ( GND ) + ( \inst|Add0~54\ ))
-- \inst|Add0~50\ = CARRY(( \inst|PC_Reg_16|Reg_out\(3) ) + ( GND ) + ( \inst|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(3),
	cin => \inst|Add0~54\,
	sumout => \inst|Add0~49_sumout\,
	cout => \inst|Add0~50\);

\rx[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(3),
	o => \rx[3]~input_o\);

\ir[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(3),
	o => \ir[3]~input_o\);

\present_out[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(3),
	o => \present_out[3]~input_o\);

\inst|PC_Mux_16|Mux12~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|PC_Mux_16|Mux12~0_combout\ = ( \mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \present_out[3]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \ir[3]~input_o\ ) ) ) # ( \mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( 
-- \rx[3]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( \inst|Add0~49_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_Add0~49_sumout\,
	datab => \ALT_INV_rx[3]~input_o\,
	datac => \ALT_INV_ir[3]~input_o\,
	datad => \ALT_INV_present_out[3]~input_o\,
	datae => \ALT_INV_mux_sel[0]~input_o\,
	dataf => \ALT_INV_mux_sel[1]~input_o\,
	combout => \inst|PC_Mux_16|Mux12~0_combout\);

\inst|PC_Reg_16|Reg_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|PC_Mux_16|Mux12~0_combout\,
	sclr => \inst|PC_Reg_16|Reg_out[15]~0_combout\,
	ena => \pc_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|PC_Reg_16|Reg_out\(3));

\inst|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~45_sumout\ = SUM(( \inst|PC_Reg_16|Reg_out\(4) ) + ( GND ) + ( \inst|Add0~50\ ))
-- \inst|Add0~46\ = CARRY(( \inst|PC_Reg_16|Reg_out\(4) ) + ( GND ) + ( \inst|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(4),
	cin => \inst|Add0~50\,
	sumout => \inst|Add0~45_sumout\,
	cout => \inst|Add0~46\);

\rx[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(4),
	o => \rx[4]~input_o\);

\ir[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(4),
	o => \ir[4]~input_o\);

\present_out[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(4),
	o => \present_out[4]~input_o\);

\inst|PC_Mux_16|Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|PC_Mux_16|Mux11~0_combout\ = ( \mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \present_out[4]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \ir[4]~input_o\ ) ) ) # ( \mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( 
-- \rx[4]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( \inst|Add0~45_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_Add0~45_sumout\,
	datab => \ALT_INV_rx[4]~input_o\,
	datac => \ALT_INV_ir[4]~input_o\,
	datad => \ALT_INV_present_out[4]~input_o\,
	datae => \ALT_INV_mux_sel[0]~input_o\,
	dataf => \ALT_INV_mux_sel[1]~input_o\,
	combout => \inst|PC_Mux_16|Mux11~0_combout\);

\inst|PC_Reg_16|Reg_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|PC_Mux_16|Mux11~0_combout\,
	sclr => \inst|PC_Reg_16|Reg_out[15]~0_combout\,
	ena => \pc_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|PC_Reg_16|Reg_out\(4));

\inst3|memory~534\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~534_combout\ = ( \inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(0) & (!\inst|PC_Reg_16|Reg_out\(4) & ((!\inst|PC_Reg_16|Reg_out\(1)) # (\inst|PC_Reg_16|Reg_out\(2))))) # (\inst|PC_Reg_16|Reg_out\(0) & (\inst|PC_Reg_16|Reg_out\(2) 
-- & (!\inst|PC_Reg_16|Reg_out\(1) $ (\inst|PC_Reg_16|Reg_out\(4))))) ) ) # ( !\inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(2) & ((!\inst|PC_Reg_16|Reg_out\(4) & ((!\inst|PC_Reg_16|Reg_out\(1)))) # (\inst|PC_Reg_16|Reg_out\(4) & 
-- (\inst|PC_Reg_16|Reg_out\(0))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000001010000100011100000000111000000010100001000111000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|PC_Reg_16|ALT_INV_Reg_out\(0),
	datab => \inst|PC_Reg_16|ALT_INV_Reg_out\(1),
	datac => \inst|PC_Reg_16|ALT_INV_Reg_out\(2),
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(4),
	datae => \inst|PC_Reg_16|ALT_INV_Reg_out\(3),
	combout => \inst3|memory~534_combout\);

\inst3|pm_outdata[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~534_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(15));

\ir_write~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir_write,
	o => \ir_write~input_o\);

\inst6|IR|Reg_out[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(15),
	ena => \ir_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|IR|Reg_out\(15));

\check_AM~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_check_AM,
	o => \check_AM~input_o\);

\inst6|AM[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|AM\(1) = ( \inst6|AM\(1) & ( \check_AM~input_o\ ) ) # ( \inst6|AM\(1) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(15) ) ) ) # ( !\inst6|AM\(1) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(15) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst6|IR|ALT_INV_Reg_out\(15),
	datae => \inst6|ALT_INV_AM\(1),
	dataf => \ALT_INV_check_AM~input_o\,
	combout => \inst6|AM\(1));

\inst3|memory~549\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~549_combout\ = ( \inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(4) & (((!\inst|PC_Reg_16|Reg_out\(0) & !\inst|PC_Reg_16|Reg_out\(1))) # (\inst|PC_Reg_16|Reg_out\(2)))) ) ) # ( !\inst|PC_Reg_16|Reg_out\(3) & ( 
-- (!\inst|PC_Reg_16|Reg_out\(4) & ((!\inst|PC_Reg_16|Reg_out\(0)) # (!\inst|PC_Reg_16|Reg_out\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110000000000110101010000000011111100000000001101010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|PC_Reg_16|ALT_INV_Reg_out\(2),
	datab => \inst|PC_Reg_16|ALT_INV_Reg_out\(0),
	datac => \inst|PC_Reg_16|ALT_INV_Reg_out\(1),
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(4),
	datae => \inst|PC_Reg_16|ALT_INV_Reg_out\(3),
	combout => \inst3|memory~549_combout\);

\inst3|pm_outdata[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~549_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(14));

\inst6|IR|Reg_out[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(14),
	ena => \ir_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|IR|Reg_out\(14));

\inst6|AM[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|AM\(0) = ( \inst6|AM\(0) & ( \check_AM~input_o\ ) ) # ( \inst6|AM\(0) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(14) ) ) ) # ( !\inst6|AM\(0) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(14) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst6|IR|ALT_INV_Reg_out\(14),
	datae => \inst6|ALT_INV_AM\(0),
	dataf => \ALT_INV_check_AM~input_o\,
	combout => \inst6|AM\(0));

\inst6|op[15]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|op[15]~0_combout\ = (\check_AM~input_o\ & \inst6|IR|Reg_out\(15))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_check_AM~input_o\,
	datab => \inst6|IR|ALT_INV_Reg_out\(15),
	combout => \inst6|op[15]~0_combout\);

\inst6|op[14]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|op[14]~1_combout\ = (\check_AM~input_o\ & \inst6|IR|Reg_out\(14))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_check_AM~input_o\,
	datab => \inst6|IR|ALT_INV_Reg_out\(14),
	combout => \inst6|op[14]~1_combout\);

\inst3|memory~535\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~535_combout\ = ( \inst|PC_Reg_16|Reg_out\(3) & ( !\inst|PC_Reg_16|Reg_out\(4) $ (((\inst|PC_Reg_16|Reg_out\(2) & (\inst|PC_Reg_16|Reg_out\(0) & \inst|PC_Reg_16|Reg_out\(1))))) ) ) # ( !\inst|PC_Reg_16|Reg_out\(3) & ( 
-- (!\inst|PC_Reg_16|Reg_out\(2) & (!\inst|PC_Reg_16|Reg_out\(0) & (!\inst|PC_Reg_16|Reg_out\(1) & !\inst|PC_Reg_16|Reg_out\(4)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000111111100000000110000000000000001111111000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|PC_Reg_16|ALT_INV_Reg_out\(2),
	datab => \inst|PC_Reg_16|ALT_INV_Reg_out\(0),
	datac => \inst|PC_Reg_16|ALT_INV_Reg_out\(1),
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(4),
	datae => \inst|PC_Reg_16|ALT_INV_Reg_out\(3),
	combout => \inst3|memory~535_combout\);

\inst3|pm_outdata[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~535_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(13));

\inst6|IR|Reg_out[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(13),
	ena => \ir_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|IR|Reg_out\(13));

\inst6|op[13]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|op[13]~2_combout\ = (\check_AM~input_o\ & \inst6|IR|Reg_out\(13))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_check_AM~input_o\,
	datab => \inst6|IR|ALT_INV_Reg_out\(13),
	combout => \inst6|op[13]~2_combout\);

\inst3|memory~536\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~536_combout\ = ( \inst|PC_Reg_16|Reg_out\(3) & ( !\inst|PC_Reg_16|Reg_out\(4) ) ) # ( !\inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(2) & (!\inst|PC_Reg_16|Reg_out\(1) & (!\inst|PC_Reg_16|Reg_out\(0) $ 
-- (\inst|PC_Reg_16|Reg_out\(4))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000001000000111111110000000010000000010000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|PC_Reg_16|ALT_INV_Reg_out\(0),
	datab => \inst|PC_Reg_16|ALT_INV_Reg_out\(2),
	datac => \inst|PC_Reg_16|ALT_INV_Reg_out\(1),
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(4),
	datae => \inst|PC_Reg_16|ALT_INV_Reg_out\(3),
	combout => \inst3|memory~536_combout\);

\inst3|pm_outdata[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~536_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(12));

\inst6|IR|Reg_out[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(12),
	ena => \ir_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|IR|Reg_out\(12));

\inst6|op[12]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|op[12]~3_combout\ = (\check_AM~input_o\ & \inst6|IR|Reg_out\(12))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_check_AM~input_o\,
	datab => \inst6|IR|ALT_INV_Reg_out\(12),
	combout => \inst6|op[12]~3_combout\);

\inst3|memory~537\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~537_combout\ = ( \inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(0) & (!\inst|PC_Reg_16|Reg_out\(4) & ((\inst|PC_Reg_16|Reg_out\(2)) # (\inst|PC_Reg_16|Reg_out\(1))))) # (\inst|PC_Reg_16|Reg_out\(0) & 
-- ((!\inst|PC_Reg_16|Reg_out\(2) & ((!\inst|PC_Reg_16|Reg_out\(4)))) # (\inst|PC_Reg_16|Reg_out\(2) & (\inst|PC_Reg_16|Reg_out\(1))))) ) ) # ( !\inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(2) & ((!\inst|PC_Reg_16|Reg_out\(0) & 
-- ((!\inst|PC_Reg_16|Reg_out\(4)))) # (\inst|PC_Reg_16|Reg_out\(0) & (!\inst|PC_Reg_16|Reg_out\(1))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110000001000000011110110000000111100000010000000111101100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|PC_Reg_16|ALT_INV_Reg_out\(0),
	datab => \inst|PC_Reg_16|ALT_INV_Reg_out\(1),
	datac => \inst|PC_Reg_16|ALT_INV_Reg_out\(2),
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(4),
	datae => \inst|PC_Reg_16|ALT_INV_Reg_out\(3),
	combout => \inst3|memory~537_combout\);

\inst3|pm_outdata[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~537_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(11));

\inst6|IR|Reg_out[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(11),
	ena => \ir_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|IR|Reg_out\(11));

\inst6|op[11]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|op[11]~4_combout\ = (\check_AM~input_o\ & \inst6|IR|Reg_out\(11))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_check_AM~input_o\,
	datab => \inst6|IR|ALT_INV_Reg_out\(11),
	combout => \inst6|op[11]~4_combout\);

\inst3|memory~538\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~538_combout\ = ( \inst|PC_Reg_16|Reg_out\(4) & ( (!\inst|PC_Reg_16|Reg_out\(1) & (\inst|PC_Reg_16|Reg_out\(0) & (!\inst|PC_Reg_16|Reg_out\(2) & !\inst|PC_Reg_16|Reg_out\(3)))) ) ) # ( !\inst|PC_Reg_16|Reg_out\(4) & ( 
-- (!\inst|PC_Reg_16|Reg_out\(3) & (!\inst|PC_Reg_16|Reg_out\(1) & (!\inst|PC_Reg_16|Reg_out\(0) $ (!\inst|PC_Reg_16|Reg_out\(2))))) # (\inst|PC_Reg_16|Reg_out\(3) & (((!\inst|PC_Reg_16|Reg_out\(2)) # (\inst|PC_Reg_16|Reg_out\(0))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010100011110011001000000000000000101000111100110010000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|PC_Reg_16|ALT_INV_Reg_out\(1),
	datab => \inst|PC_Reg_16|ALT_INV_Reg_out\(0),
	datac => \inst|PC_Reg_16|ALT_INV_Reg_out\(2),
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(3),
	datae => \inst|PC_Reg_16|ALT_INV_Reg_out\(4),
	combout => \inst3|memory~538_combout\);

\inst3|pm_outdata[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~538_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(10));

\inst6|IR|Reg_out[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(10),
	ena => \ir_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|IR|Reg_out\(10));

\inst6|op[10]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|op[10]~5_combout\ = (\check_AM~input_o\ & \inst6|IR|Reg_out\(10))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_check_AM~input_o\,
	datab => \inst6|IR|ALT_INV_Reg_out\(10),
	combout => \inst6|op[10]~5_combout\);

\inst3|memory~548\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~548_combout\ = ( \inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(0) & (((!\inst|PC_Reg_16|Reg_out\(4))))) # (\inst|PC_Reg_16|Reg_out\(0) & ((!\inst|PC_Reg_16|Reg_out\(1) & ((!\inst|PC_Reg_16|Reg_out\(4)))) # 
-- (\inst|PC_Reg_16|Reg_out\(1) & (\inst|PC_Reg_16|Reg_out\(2))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111011110000000100000000000000001110111100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|PC_Reg_16|ALT_INV_Reg_out\(0),
	datab => \inst|PC_Reg_16|ALT_INV_Reg_out\(1),
	datac => \inst|PC_Reg_16|ALT_INV_Reg_out\(2),
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(4),
	datae => \inst|PC_Reg_16|ALT_INV_Reg_out\(3),
	combout => \inst3|memory~548_combout\);

\inst3|pm_outdata[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~548_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(9));

\inst6|IR|Reg_out[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(9),
	ena => \ir_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|IR|Reg_out\(9));

\inst6|op[9]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|op[9]~6_combout\ = (\check_AM~input_o\ & \inst6|IR|Reg_out\(9))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_check_AM~input_o\,
	datab => \inst6|IR|ALT_INV_Reg_out\(9),
	combout => \inst6|op[9]~6_combout\);

\inst3|memory~539\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~539_combout\ = ( \inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(1) & (!\inst|PC_Reg_16|Reg_out\(4) & ((\inst|PC_Reg_16|Reg_out\(0)) # (\inst|PC_Reg_16|Reg_out\(2))))) # (\inst|PC_Reg_16|Reg_out\(1) & (\inst|PC_Reg_16|Reg_out\(2) 
-- & (\inst|PC_Reg_16|Reg_out\(0) & \inst|PC_Reg_16|Reg_out\(4)))) ) ) # ( !\inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(2) & (\inst|PC_Reg_16|Reg_out\(0) & (!\inst|PC_Reg_16|Reg_out\(1) & \inst|PC_Reg_16|Reg_out\(4)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000100000011100000000000100000000001000000111000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|PC_Reg_16|ALT_INV_Reg_out\(2),
	datab => \inst|PC_Reg_16|ALT_INV_Reg_out\(0),
	datac => \inst|PC_Reg_16|ALT_INV_Reg_out\(1),
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(4),
	datae => \inst|PC_Reg_16|ALT_INV_Reg_out\(3),
	combout => \inst3|memory~539_combout\);

\inst3|pm_outdata[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~539_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(8));

\inst6|IR|Reg_out[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(8),
	ena => \ir_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|IR|Reg_out\(8));

\inst6|op[8]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|op[8]~7_combout\ = (\check_AM~input_o\ & \inst6|IR|Reg_out\(8))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_check_AM~input_o\,
	datab => \inst6|IR|ALT_INV_Reg_out\(8),
	combout => \inst6|op[8]~7_combout\);

\inst3|memory~547\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~547_combout\ = ( \inst|PC_Reg_16|Reg_out\(0) & ( (\inst|PC_Reg_16|Reg_out\(1) & (\inst|PC_Reg_16|Reg_out\(2) & \inst|PC_Reg_16|Reg_out\(3))) ) ) # ( !\inst|PC_Reg_16|Reg_out\(0) & ( (\inst|PC_Reg_16|Reg_out\(1) & (\inst|PC_Reg_16|Reg_out\(2) 
-- & (!\inst|PC_Reg_16|Reg_out\(3) & !\inst|PC_Reg_16|Reg_out\(4)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000000000000000000010000000100010000000000000000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|PC_Reg_16|ALT_INV_Reg_out\(1),
	datab => \inst|PC_Reg_16|ALT_INV_Reg_out\(2),
	datac => \inst|PC_Reg_16|ALT_INV_Reg_out\(3),
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(4),
	datae => \inst|PC_Reg_16|ALT_INV_Reg_out\(0),
	combout => \inst3|memory~547_combout\);

\inst3|pm_outdata[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~547_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(7));

\inst6|IR|Reg_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(7),
	ena => \ir_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|IR|Reg_out\(7));

\inst6|op[7]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|op[7]~8_combout\ = (\check_AM~input_o\ & \inst6|IR|Reg_out\(7))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_check_AM~input_o\,
	datab => \inst6|IR|ALT_INV_Reg_out\(7),
	combout => \inst6|op[7]~8_combout\);

\inst3|memory~540\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~540_combout\ = ( \inst|PC_Reg_16|Reg_out\(3) & ( (\inst|PC_Reg_16|Reg_out\(2) & ((!\inst|PC_Reg_16|Reg_out\(1) & (\inst|PC_Reg_16|Reg_out\(0) & !\inst|PC_Reg_16|Reg_out\(4))) # (\inst|PC_Reg_16|Reg_out\(1) & ((!\inst|PC_Reg_16|Reg_out\(4)) # 
-- (\inst|PC_Reg_16|Reg_out\(0)))))) ) ) # ( !\inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(0) & (!\inst|PC_Reg_16|Reg_out\(4) & (!\inst|PC_Reg_16|Reg_out\(1) $ (\inst|PC_Reg_16|Reg_out\(2))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001000000000000000100110000000110010000000000000001001100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|PC_Reg_16|ALT_INV_Reg_out\(1),
	datab => \inst|PC_Reg_16|ALT_INV_Reg_out\(2),
	datac => \inst|PC_Reg_16|ALT_INV_Reg_out\(0),
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(4),
	datae => \inst|PC_Reg_16|ALT_INV_Reg_out\(3),
	combout => \inst3|memory~540_combout\);

\inst3|pm_outdata[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~540_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(6));

\inst6|IR|Reg_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(6),
	ena => \ir_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|IR|Reg_out\(6));

\inst6|op[6]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|op[6]~9_combout\ = (\check_AM~input_o\ & \inst6|IR|Reg_out\(6))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_check_AM~input_o\,
	datab => \inst6|IR|ALT_INV_Reg_out\(6),
	combout => \inst6|op[6]~9_combout\);

\inst3|memory~546\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~546_combout\ = ( \inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(0) & (!\inst|PC_Reg_16|Reg_out\(1) & !\inst|PC_Reg_16|Reg_out\(4))) ) ) # ( !\inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(4) & 
-- ((!\inst|PC_Reg_16|Reg_out\(0) & (\inst|PC_Reg_16|Reg_out\(1) & \inst|PC_Reg_16|Reg_out\(2))) # (\inst|PC_Reg_16|Reg_out\(0) & (!\inst|PC_Reg_16|Reg_out\(1) & !\inst|PC_Reg_16|Reg_out\(2))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100001000000000100010000000000001000010000000001000100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|PC_Reg_16|ALT_INV_Reg_out\(0),
	datab => \inst|PC_Reg_16|ALT_INV_Reg_out\(1),
	datac => \inst|PC_Reg_16|ALT_INV_Reg_out\(2),
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(4),
	datae => \inst|PC_Reg_16|ALT_INV_Reg_out\(3),
	combout => \inst3|memory~546_combout\);

\inst3|pm_outdata[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~546_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(5));

\inst6|IR|Reg_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(5),
	ena => \ir_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|IR|Reg_out\(5));

\inst6|op[5]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|op[5]~10_combout\ = (\check_AM~input_o\ & \inst6|IR|Reg_out\(5))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_check_AM~input_o\,
	datab => \inst6|IR|ALT_INV_Reg_out\(5),
	combout => \inst6|op[5]~10_combout\);

\inst3|memory~545\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~545_combout\ = ( \inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(0) & (!\inst|PC_Reg_16|Reg_out\(1) & !\inst|PC_Reg_16|Reg_out\(4))) ) ) # ( !\inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(0) & 
-- (!\inst|PC_Reg_16|Reg_out\(1) $ (((!\inst|PC_Reg_16|Reg_out\(2) & \inst|PC_Reg_16|Reg_out\(4)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000001001000110000000000000011000000010010001100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|PC_Reg_16|ALT_INV_Reg_out\(2),
	datab => \inst|PC_Reg_16|ALT_INV_Reg_out\(0),
	datac => \inst|PC_Reg_16|ALT_INV_Reg_out\(1),
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(4),
	datae => \inst|PC_Reg_16|ALT_INV_Reg_out\(3),
	combout => \inst3|memory~545_combout\);

\inst3|pm_outdata[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~545_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(4));

\inst6|IR|Reg_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(4),
	ena => \ir_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|IR|Reg_out\(4));

\inst6|op[4]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|op[4]~11_combout\ = (\check_AM~input_o\ & \inst6|IR|Reg_out\(4))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_check_AM~input_o\,
	datab => \inst6|IR|ALT_INV_Reg_out\(4),
	combout => \inst6|op[4]~11_combout\);

\inst3|memory~544\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~544_combout\ = ( \inst|PC_Reg_16|Reg_out\(3) & ( (\inst|PC_Reg_16|Reg_out\(1) & (\inst|PC_Reg_16|Reg_out\(0) & \inst|PC_Reg_16|Reg_out\(2))) ) ) # ( !\inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(4) & 
-- ((\inst|PC_Reg_16|Reg_out\(2)) # (\inst|PC_Reg_16|Reg_out\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100000000000000010000000100111111000000000000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|PC_Reg_16|ALT_INV_Reg_out\(1),
	datab => \inst|PC_Reg_16|ALT_INV_Reg_out\(0),
	datac => \inst|PC_Reg_16|ALT_INV_Reg_out\(2),
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(4),
	datae => \inst|PC_Reg_16|ALT_INV_Reg_out\(3),
	combout => \inst3|memory~544_combout\);

\inst3|pm_outdata[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~544_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(3));

\inst6|IR|Reg_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(3),
	ena => \ir_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|IR|Reg_out\(3));

\inst6|op[3]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|op[3]~12_combout\ = (\check_AM~input_o\ & \inst6|IR|Reg_out\(3))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_check_AM~input_o\,
	datab => \inst6|IR|ALT_INV_Reg_out\(3),
	combout => \inst6|op[3]~12_combout\);

\inst3|memory~541\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~541_combout\ = ( \inst|PC_Reg_16|Reg_out\(3) & ( (\inst|PC_Reg_16|Reg_out\(2) & ((!\inst|PC_Reg_16|Reg_out\(1) & (\inst|PC_Reg_16|Reg_out\(0) & !\inst|PC_Reg_16|Reg_out\(4))) # (\inst|PC_Reg_16|Reg_out\(1) & ((!\inst|PC_Reg_16|Reg_out\(4)) # 
-- (\inst|PC_Reg_16|Reg_out\(0)))))) ) ) # ( !\inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(0) & ((!\inst|PC_Reg_16|Reg_out\(1) & (\inst|PC_Reg_16|Reg_out\(2) & \inst|PC_Reg_16|Reg_out\(4))) # (\inst|PC_Reg_16|Reg_out\(1) & 
-- (!\inst|PC_Reg_16|Reg_out\(2) $ (!\inst|PC_Reg_16|Reg_out\(4)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000001100000000100110000000100010000011000000001001100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|PC_Reg_16|ALT_INV_Reg_out\(1),
	datab => \inst|PC_Reg_16|ALT_INV_Reg_out\(2),
	datac => \inst|PC_Reg_16|ALT_INV_Reg_out\(0),
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(4),
	datae => \inst|PC_Reg_16|ALT_INV_Reg_out\(3),
	combout => \inst3|memory~541_combout\);

\inst3|pm_outdata[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~541_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(2));

\inst6|IR|Reg_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(2),
	ena => \ir_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|IR|Reg_out\(2));

\inst6|op[2]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|op[2]~13_combout\ = (\check_AM~input_o\ & \inst6|IR|Reg_out\(2))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_check_AM~input_o\,
	datab => \inst6|IR|ALT_INV_Reg_out\(2),
	combout => \inst6|op[2]~13_combout\);

\inst3|memory~543\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~543_combout\ = ( \inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(0) & (!\inst|PC_Reg_16|Reg_out\(1) & !\inst|PC_Reg_16|Reg_out\(4))) ) ) # ( !\inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(4) & 
-- ((!\inst|PC_Reg_16|Reg_out\(0) & (!\inst|PC_Reg_16|Reg_out\(1) $ (\inst|PC_Reg_16|Reg_out\(2)))) # (\inst|PC_Reg_16|Reg_out\(0) & ((!\inst|PC_Reg_16|Reg_out\(1)) # (!\inst|PC_Reg_16|Reg_out\(2)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101011000000000100010000000000011010110000000001000100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|PC_Reg_16|ALT_INV_Reg_out\(0),
	datab => \inst|PC_Reg_16|ALT_INV_Reg_out\(1),
	datac => \inst|PC_Reg_16|ALT_INV_Reg_out\(2),
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(4),
	datae => \inst|PC_Reg_16|ALT_INV_Reg_out\(3),
	combout => \inst3|memory~543_combout\);

\inst3|pm_outdata[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~543_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(1));

\inst6|IR|Reg_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(1),
	ena => \ir_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|IR|Reg_out\(1));

\inst6|op[1]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|op[1]~14_combout\ = (\check_AM~input_o\ & \inst6|IR|Reg_out\(1))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_check_AM~input_o\,
	datab => \inst6|IR|ALT_INV_Reg_out\(1),
	combout => \inst6|op[1]~14_combout\);

\inst3|memory~542\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~542_combout\ = ( \inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(0) & (((!\inst|PC_Reg_16|Reg_out\(1) & !\inst|PC_Reg_16|Reg_out\(4))))) # (\inst|PC_Reg_16|Reg_out\(0) & (\inst|PC_Reg_16|Reg_out\(2) & (\inst|PC_Reg_16|Reg_out\(1) 
-- & \inst|PC_Reg_16|Reg_out\(4)))) ) ) # ( !\inst|PC_Reg_16|Reg_out\(3) & ( (!\inst|PC_Reg_16|Reg_out\(1) & (((!\inst|PC_Reg_16|Reg_out\(0) & \inst|PC_Reg_16|Reg_out\(4))))) # (\inst|PC_Reg_16|Reg_out\(1) & (!\inst|PC_Reg_16|Reg_out\(2) & 
-- (!\inst|PC_Reg_16|Reg_out\(0) $ (!\inst|PC_Reg_16|Reg_out\(4))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001011001000110000000000000100000010110010001100000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|PC_Reg_16|ALT_INV_Reg_out\(2),
	datab => \inst|PC_Reg_16|ALT_INV_Reg_out\(0),
	datac => \inst|PC_Reg_16|ALT_INV_Reg_out\(1),
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(4),
	datae => \inst|PC_Reg_16|ALT_INV_Reg_out\(3),
	combout => \inst3|memory~542_combout\);

\inst3|pm_outdata[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~542_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(0));

\inst6|IR|Reg_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(0),
	ena => \ir_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|IR|Reg_out\(0));

\inst6|op[0]~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|op[0]~15_combout\ = (\check_AM~input_o\ & \inst6|IR|Reg_out\(0))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_check_AM~input_o\,
	datab => \inst6|IR|ALT_INV_Reg_out\(0),
	combout => \inst6|op[0]~15_combout\);

\inst6|opcode[5]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|opcode\(5) = ( \inst6|opcode\(5) & ( \check_AM~input_o\ ) ) # ( \inst6|opcode\(5) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(13) ) ) ) # ( !\inst6|opcode\(5) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(13) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst6|IR|ALT_INV_Reg_out\(13),
	datae => \inst6|ALT_INV_opcode\(5),
	dataf => \ALT_INV_check_AM~input_o\,
	combout => \inst6|opcode\(5));

\inst6|opcode[4]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|opcode\(4) = ( \inst6|opcode\(4) & ( \check_AM~input_o\ ) ) # ( \inst6|opcode\(4) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(12) ) ) ) # ( !\inst6|opcode\(4) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(12) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst6|IR|ALT_INV_Reg_out\(12),
	datae => \inst6|ALT_INV_opcode\(4),
	dataf => \ALT_INV_check_AM~input_o\,
	combout => \inst6|opcode\(4));

\inst6|opcode[3]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|opcode\(3) = ( \inst6|opcode\(3) & ( \check_AM~input_o\ ) ) # ( \inst6|opcode\(3) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(11) ) ) ) # ( !\inst6|opcode\(3) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(11) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst6|IR|ALT_INV_Reg_out\(11),
	datae => \inst6|ALT_INV_opcode\(3),
	dataf => \ALT_INV_check_AM~input_o\,
	combout => \inst6|opcode\(3));

\inst6|opcode[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|opcode\(2) = ( \inst6|opcode\(2) & ( \check_AM~input_o\ ) ) # ( \inst6|opcode\(2) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(10) ) ) ) # ( !\inst6|opcode\(2) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(10) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst6|IR|ALT_INV_Reg_out\(10),
	datae => \inst6|ALT_INV_opcode\(2),
	dataf => \ALT_INV_check_AM~input_o\,
	combout => \inst6|opcode\(2));

\inst6|opcode[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|opcode\(1) = ( \inst6|opcode\(1) & ( \check_AM~input_o\ ) ) # ( \inst6|opcode\(1) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(9) ) ) ) # ( !\inst6|opcode\(1) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(9) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst6|IR|ALT_INV_Reg_out\(9),
	datae => \inst6|ALT_INV_opcode\(1),
	dataf => \ALT_INV_check_AM~input_o\,
	combout => \inst6|opcode\(1));

\inst6|opcode[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|opcode\(0) = ( \inst6|opcode\(0) & ( \check_AM~input_o\ ) ) # ( \inst6|opcode\(0) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(8) ) ) ) # ( !\inst6|opcode\(0) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(8) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst6|IR|ALT_INV_Reg_out\(8),
	datae => \inst6|ALT_INV_opcode\(0),
	dataf => \ALT_INV_check_AM~input_o\,
	combout => \inst6|opcode\(0));

\inst|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~41_sumout\ = SUM(( \inst|PC_Reg_16|Reg_out\(5) ) + ( GND ) + ( \inst|Add0~46\ ))
-- \inst|Add0~42\ = CARRY(( \inst|PC_Reg_16|Reg_out\(5) ) + ( GND ) + ( \inst|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(5),
	cin => \inst|Add0~46\,
	sumout => \inst|Add0~41_sumout\,
	cout => \inst|Add0~42\);

\rx[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(5),
	o => \rx[5]~input_o\);

\ir[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(5),
	o => \ir[5]~input_o\);

\present_out[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(5),
	o => \present_out[5]~input_o\);

\inst|PC_Mux_16|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|PC_Mux_16|Mux10~0_combout\ = ( \mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \present_out[5]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \ir[5]~input_o\ ) ) ) # ( \mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( 
-- \rx[5]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( \inst|Add0~41_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_Add0~41_sumout\,
	datab => \ALT_INV_rx[5]~input_o\,
	datac => \ALT_INV_ir[5]~input_o\,
	datad => \ALT_INV_present_out[5]~input_o\,
	datae => \ALT_INV_mux_sel[0]~input_o\,
	dataf => \ALT_INV_mux_sel[1]~input_o\,
	combout => \inst|PC_Mux_16|Mux10~0_combout\);

\inst|PC_Reg_16|Reg_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|PC_Mux_16|Mux10~0_combout\,
	sclr => \inst|PC_Reg_16|Reg_out[15]~0_combout\,
	ena => \pc_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|PC_Reg_16|Reg_out\(5));

\inst|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~37_sumout\ = SUM(( \inst|PC_Reg_16|Reg_out\(6) ) + ( GND ) + ( \inst|Add0~42\ ))
-- \inst|Add0~38\ = CARRY(( \inst|PC_Reg_16|Reg_out\(6) ) + ( GND ) + ( \inst|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(6),
	cin => \inst|Add0~42\,
	sumout => \inst|Add0~37_sumout\,
	cout => \inst|Add0~38\);

\rx[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(6),
	o => \rx[6]~input_o\);

\ir[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(6),
	o => \ir[6]~input_o\);

\present_out[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(6),
	o => \present_out[6]~input_o\);

\inst|PC_Mux_16|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|PC_Mux_16|Mux9~0_combout\ = ( \mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \present_out[6]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \ir[6]~input_o\ ) ) ) # ( \mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( 
-- \rx[6]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( \inst|Add0~37_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_Add0~37_sumout\,
	datab => \ALT_INV_rx[6]~input_o\,
	datac => \ALT_INV_ir[6]~input_o\,
	datad => \ALT_INV_present_out[6]~input_o\,
	datae => \ALT_INV_mux_sel[0]~input_o\,
	dataf => \ALT_INV_mux_sel[1]~input_o\,
	combout => \inst|PC_Mux_16|Mux9~0_combout\);

\inst|PC_Reg_16|Reg_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|PC_Mux_16|Mux9~0_combout\,
	sclr => \inst|PC_Reg_16|Reg_out[15]~0_combout\,
	ena => \pc_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|PC_Reg_16|Reg_out\(6));

\inst|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~33_sumout\ = SUM(( \inst|PC_Reg_16|Reg_out\(7) ) + ( GND ) + ( \inst|Add0~38\ ))
-- \inst|Add0~34\ = CARRY(( \inst|PC_Reg_16|Reg_out\(7) ) + ( GND ) + ( \inst|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(7),
	cin => \inst|Add0~38\,
	sumout => \inst|Add0~33_sumout\,
	cout => \inst|Add0~34\);

\rx[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(7),
	o => \rx[7]~input_o\);

\ir[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(7),
	o => \ir[7]~input_o\);

\present_out[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(7),
	o => \present_out[7]~input_o\);

\inst|PC_Mux_16|Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|PC_Mux_16|Mux8~0_combout\ = ( \mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \present_out[7]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \ir[7]~input_o\ ) ) ) # ( \mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( 
-- \rx[7]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( \inst|Add0~33_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_Add0~33_sumout\,
	datab => \ALT_INV_rx[7]~input_o\,
	datac => \ALT_INV_ir[7]~input_o\,
	datad => \ALT_INV_present_out[7]~input_o\,
	datae => \ALT_INV_mux_sel[0]~input_o\,
	dataf => \ALT_INV_mux_sel[1]~input_o\,
	combout => \inst|PC_Mux_16|Mux8~0_combout\);

\inst|PC_Reg_16|Reg_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|PC_Mux_16|Mux8~0_combout\,
	sclr => \inst|PC_Reg_16|Reg_out[15]~0_combout\,
	ena => \pc_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|PC_Reg_16|Reg_out\(7));

\inst|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~29_sumout\ = SUM(( \inst|PC_Reg_16|Reg_out\(8) ) + ( GND ) + ( \inst|Add0~34\ ))
-- \inst|Add0~30\ = CARRY(( \inst|PC_Reg_16|Reg_out\(8) ) + ( GND ) + ( \inst|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(8),
	cin => \inst|Add0~34\,
	sumout => \inst|Add0~29_sumout\,
	cout => \inst|Add0~30\);

\rx[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(8),
	o => \rx[8]~input_o\);

\ir[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(8),
	o => \ir[8]~input_o\);

\present_out[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(8),
	o => \present_out[8]~input_o\);

\inst|PC_Mux_16|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|PC_Mux_16|Mux7~0_combout\ = ( \mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \present_out[8]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \ir[8]~input_o\ ) ) ) # ( \mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( 
-- \rx[8]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( \inst|Add0~29_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_Add0~29_sumout\,
	datab => \ALT_INV_rx[8]~input_o\,
	datac => \ALT_INV_ir[8]~input_o\,
	datad => \ALT_INV_present_out[8]~input_o\,
	datae => \ALT_INV_mux_sel[0]~input_o\,
	dataf => \ALT_INV_mux_sel[1]~input_o\,
	combout => \inst|PC_Mux_16|Mux7~0_combout\);

\inst|PC_Reg_16|Reg_out[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|PC_Mux_16|Mux7~0_combout\,
	sclr => \inst|PC_Reg_16|Reg_out[15]~0_combout\,
	ena => \pc_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|PC_Reg_16|Reg_out\(8));

\inst|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~25_sumout\ = SUM(( \inst|PC_Reg_16|Reg_out\(9) ) + ( GND ) + ( \inst|Add0~30\ ))
-- \inst|Add0~26\ = CARRY(( \inst|PC_Reg_16|Reg_out\(9) ) + ( GND ) + ( \inst|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(9),
	cin => \inst|Add0~30\,
	sumout => \inst|Add0~25_sumout\,
	cout => \inst|Add0~26\);

\rx[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(9),
	o => \rx[9]~input_o\);

\ir[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(9),
	o => \ir[9]~input_o\);

\present_out[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(9),
	o => \present_out[9]~input_o\);

\inst|PC_Mux_16|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|PC_Mux_16|Mux6~0_combout\ = ( \mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \present_out[9]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \ir[9]~input_o\ ) ) ) # ( \mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( 
-- \rx[9]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( \inst|Add0~25_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_Add0~25_sumout\,
	datab => \ALT_INV_rx[9]~input_o\,
	datac => \ALT_INV_ir[9]~input_o\,
	datad => \ALT_INV_present_out[9]~input_o\,
	datae => \ALT_INV_mux_sel[0]~input_o\,
	dataf => \ALT_INV_mux_sel[1]~input_o\,
	combout => \inst|PC_Mux_16|Mux6~0_combout\);

\inst|PC_Reg_16|Reg_out[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|PC_Mux_16|Mux6~0_combout\,
	sclr => \inst|PC_Reg_16|Reg_out[15]~0_combout\,
	ena => \pc_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|PC_Reg_16|Reg_out\(9));

\inst|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~21_sumout\ = SUM(( \inst|PC_Reg_16|Reg_out\(10) ) + ( GND ) + ( \inst|Add0~26\ ))
-- \inst|Add0~22\ = CARRY(( \inst|PC_Reg_16|Reg_out\(10) ) + ( GND ) + ( \inst|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(10),
	cin => \inst|Add0~26\,
	sumout => \inst|Add0~21_sumout\,
	cout => \inst|Add0~22\);

\rx[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(10),
	o => \rx[10]~input_o\);

\ir[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(10),
	o => \ir[10]~input_o\);

\present_out[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(10),
	o => \present_out[10]~input_o\);

\inst|PC_Mux_16|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|PC_Mux_16|Mux5~0_combout\ = ( \mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \present_out[10]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \ir[10]~input_o\ ) ) ) # ( \mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( 
-- \rx[10]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( \inst|Add0~21_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_Add0~21_sumout\,
	datab => \ALT_INV_rx[10]~input_o\,
	datac => \ALT_INV_ir[10]~input_o\,
	datad => \ALT_INV_present_out[10]~input_o\,
	datae => \ALT_INV_mux_sel[0]~input_o\,
	dataf => \ALT_INV_mux_sel[1]~input_o\,
	combout => \inst|PC_Mux_16|Mux5~0_combout\);

\inst|PC_Reg_16|Reg_out[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|PC_Mux_16|Mux5~0_combout\,
	sclr => \inst|PC_Reg_16|Reg_out[15]~0_combout\,
	ena => \pc_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|PC_Reg_16|Reg_out\(10));

\inst|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~17_sumout\ = SUM(( \inst|PC_Reg_16|Reg_out\(11) ) + ( GND ) + ( \inst|Add0~22\ ))
-- \inst|Add0~18\ = CARRY(( \inst|PC_Reg_16|Reg_out\(11) ) + ( GND ) + ( \inst|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(11),
	cin => \inst|Add0~22\,
	sumout => \inst|Add0~17_sumout\,
	cout => \inst|Add0~18\);

\rx[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(11),
	o => \rx[11]~input_o\);

\ir[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(11),
	o => \ir[11]~input_o\);

\present_out[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(11),
	o => \present_out[11]~input_o\);

\inst|PC_Mux_16|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|PC_Mux_16|Mux4~0_combout\ = ( \mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \present_out[11]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \ir[11]~input_o\ ) ) ) # ( \mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( 
-- \rx[11]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( \inst|Add0~17_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_Add0~17_sumout\,
	datab => \ALT_INV_rx[11]~input_o\,
	datac => \ALT_INV_ir[11]~input_o\,
	datad => \ALT_INV_present_out[11]~input_o\,
	datae => \ALT_INV_mux_sel[0]~input_o\,
	dataf => \ALT_INV_mux_sel[1]~input_o\,
	combout => \inst|PC_Mux_16|Mux4~0_combout\);

\inst|PC_Reg_16|Reg_out[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|PC_Mux_16|Mux4~0_combout\,
	sclr => \inst|PC_Reg_16|Reg_out[15]~0_combout\,
	ena => \pc_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|PC_Reg_16|Reg_out\(11));

\inst|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~13_sumout\ = SUM(( \inst|PC_Reg_16|Reg_out\(12) ) + ( GND ) + ( \inst|Add0~18\ ))
-- \inst|Add0~14\ = CARRY(( \inst|PC_Reg_16|Reg_out\(12) ) + ( GND ) + ( \inst|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(12),
	cin => \inst|Add0~18\,
	sumout => \inst|Add0~13_sumout\,
	cout => \inst|Add0~14\);

\rx[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(12),
	o => \rx[12]~input_o\);

\ir[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(12),
	o => \ir[12]~input_o\);

\present_out[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(12),
	o => \present_out[12]~input_o\);

\inst|PC_Mux_16|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|PC_Mux_16|Mux3~0_combout\ = ( \mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \present_out[12]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \ir[12]~input_o\ ) ) ) # ( \mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( 
-- \rx[12]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( \inst|Add0~13_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_Add0~13_sumout\,
	datab => \ALT_INV_rx[12]~input_o\,
	datac => \ALT_INV_ir[12]~input_o\,
	datad => \ALT_INV_present_out[12]~input_o\,
	datae => \ALT_INV_mux_sel[0]~input_o\,
	dataf => \ALT_INV_mux_sel[1]~input_o\,
	combout => \inst|PC_Mux_16|Mux3~0_combout\);

\inst|PC_Reg_16|Reg_out[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|PC_Mux_16|Mux3~0_combout\,
	sclr => \inst|PC_Reg_16|Reg_out[15]~0_combout\,
	ena => \pc_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|PC_Reg_16|Reg_out\(12));

\inst|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~9_sumout\ = SUM(( \inst|PC_Reg_16|Reg_out\(13) ) + ( GND ) + ( \inst|Add0~14\ ))
-- \inst|Add0~10\ = CARRY(( \inst|PC_Reg_16|Reg_out\(13) ) + ( GND ) + ( \inst|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(13),
	cin => \inst|Add0~14\,
	sumout => \inst|Add0~9_sumout\,
	cout => \inst|Add0~10\);

\rx[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(13),
	o => \rx[13]~input_o\);

\ir[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(13),
	o => \ir[13]~input_o\);

\present_out[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(13),
	o => \present_out[13]~input_o\);

\inst|PC_Mux_16|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|PC_Mux_16|Mux2~0_combout\ = ( \mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \present_out[13]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \ir[13]~input_o\ ) ) ) # ( \mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( 
-- \rx[13]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( \inst|Add0~9_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_Add0~9_sumout\,
	datab => \ALT_INV_rx[13]~input_o\,
	datac => \ALT_INV_ir[13]~input_o\,
	datad => \ALT_INV_present_out[13]~input_o\,
	datae => \ALT_INV_mux_sel[0]~input_o\,
	dataf => \ALT_INV_mux_sel[1]~input_o\,
	combout => \inst|PC_Mux_16|Mux2~0_combout\);

\inst|PC_Reg_16|Reg_out[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|PC_Mux_16|Mux2~0_combout\,
	sclr => \inst|PC_Reg_16|Reg_out[15]~0_combout\,
	ena => \pc_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|PC_Reg_16|Reg_out\(13));

\inst|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~5_sumout\ = SUM(( \inst|PC_Reg_16|Reg_out\(14) ) + ( GND ) + ( \inst|Add0~10\ ))
-- \inst|Add0~6\ = CARRY(( \inst|PC_Reg_16|Reg_out\(14) ) + ( GND ) + ( \inst|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(14),
	cin => \inst|Add0~10\,
	sumout => \inst|Add0~5_sumout\,
	cout => \inst|Add0~6\);

\rx[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(14),
	o => \rx[14]~input_o\);

\ir[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(14),
	o => \ir[14]~input_o\);

\present_out[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(14),
	o => \present_out[14]~input_o\);

\inst|PC_Mux_16|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|PC_Mux_16|Mux1~0_combout\ = ( \mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \present_out[14]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \ir[14]~input_o\ ) ) ) # ( \mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( 
-- \rx[14]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( \inst|Add0~5_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_Add0~5_sumout\,
	datab => \ALT_INV_rx[14]~input_o\,
	datac => \ALT_INV_ir[14]~input_o\,
	datad => \ALT_INV_present_out[14]~input_o\,
	datae => \ALT_INV_mux_sel[0]~input_o\,
	dataf => \ALT_INV_mux_sel[1]~input_o\,
	combout => \inst|PC_Mux_16|Mux1~0_combout\);

\inst|PC_Reg_16|Reg_out[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|PC_Mux_16|Mux1~0_combout\,
	sclr => \inst|PC_Reg_16|Reg_out[15]~0_combout\,
	ena => \pc_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|PC_Reg_16|Reg_out\(14));

\inst|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~1_sumout\ = SUM(( \inst|PC_Reg_16|Reg_out\(15) ) + ( GND ) + ( \inst|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|PC_Reg_16|ALT_INV_Reg_out\(15),
	cin => \inst|Add0~6\,
	sumout => \inst|Add0~1_sumout\);

\rx[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(15),
	o => \rx[15]~input_o\);

\ir[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(15),
	o => \ir[15]~input_o\);

\present_out[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(15),
	o => \present_out[15]~input_o\);

\inst|PC_Mux_16|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|PC_Mux_16|Mux0~0_combout\ = ( \mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \present_out[15]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( \mux_sel[1]~input_o\ & ( \ir[15]~input_o\ ) ) ) # ( \mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( 
-- \rx[15]~input_o\ ) ) ) # ( !\mux_sel[0]~input_o\ & ( !\mux_sel[1]~input_o\ & ( \inst|Add0~1_sumout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100001111000011110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_Add0~1_sumout\,
	datab => \ALT_INV_rx[15]~input_o\,
	datac => \ALT_INV_ir[15]~input_o\,
	datad => \ALT_INV_present_out[15]~input_o\,
	datae => \ALT_INV_mux_sel[0]~input_o\,
	dataf => \ALT_INV_mux_sel[1]~input_o\,
	combout => \inst|PC_Mux_16|Mux0~0_combout\);

\inst|PC_Reg_16|Reg_out[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|PC_Mux_16|Mux0~0_combout\,
	sclr => \inst|PC_Reg_16|Reg_out[15]~0_combout\,
	ena => \pc_write~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|PC_Reg_16|Reg_out\(15));

\inst6|Rx[3]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|Rx\(3) = ( \inst6|Rx\(3) & ( \check_AM~input_o\ ) ) # ( \inst6|Rx\(3) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(3) ) ) ) # ( !\inst6|Rx\(3) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(3) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst6|IR|ALT_INV_Reg_out\(3),
	datae => \inst6|ALT_INV_Rx\(3),
	dataf => \ALT_INV_check_AM~input_o\,
	combout => \inst6|Rx\(3));

\inst6|Rx[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|Rx\(2) = ( \inst6|Rx\(2) & ( \check_AM~input_o\ ) ) # ( \inst6|Rx\(2) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(2) ) ) ) # ( !\inst6|Rx\(2) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst6|IR|ALT_INV_Reg_out\(2),
	datae => \inst6|ALT_INV_Rx\(2),
	dataf => \ALT_INV_check_AM~input_o\,
	combout => \inst6|Rx\(2));

\inst6|Rx[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|Rx\(1) = ( \inst6|Rx\(1) & ( \check_AM~input_o\ ) ) # ( \inst6|Rx\(1) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(1) ) ) ) # ( !\inst6|Rx\(1) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(1) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst6|IR|ALT_INV_Reg_out\(1),
	datae => \inst6|ALT_INV_Rx\(1),
	dataf => \ALT_INV_check_AM~input_o\,
	combout => \inst6|Rx\(1));

\inst6|Rx[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|Rx\(0) = ( \inst6|Rx\(0) & ( \check_AM~input_o\ ) ) # ( \inst6|Rx\(0) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(0) ) ) ) # ( !\inst6|Rx\(0) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst6|IR|ALT_INV_Reg_out\(0),
	datae => \inst6|ALT_INV_Rx\(0),
	dataf => \ALT_INV_check_AM~input_o\,
	combout => \inst6|Rx\(0));

\inst6|Rz[3]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|Rz\(3) = ( \inst6|Rz\(3) & ( \check_AM~input_o\ ) ) # ( \inst6|Rz\(3) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(7) ) ) ) # ( !\inst6|Rz\(3) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(7) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst6|IR|ALT_INV_Reg_out\(7),
	datae => \inst6|ALT_INV_Rz\(3),
	dataf => \ALT_INV_check_AM~input_o\,
	combout => \inst6|Rz\(3));

\inst6|Rz[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|Rz\(2) = ( \inst6|Rz\(2) & ( \check_AM~input_o\ ) ) # ( \inst6|Rz\(2) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(6) ) ) ) # ( !\inst6|Rz\(2) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(6) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst6|IR|ALT_INV_Reg_out\(6),
	datae => \inst6|ALT_INV_Rz\(2),
	dataf => \ALT_INV_check_AM~input_o\,
	combout => \inst6|Rz\(2));

\inst6|Rz[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|Rz\(1) = ( \inst6|Rz\(1) & ( \check_AM~input_o\ ) ) # ( \inst6|Rz\(1) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(5) ) ) ) # ( !\inst6|Rz\(1) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(5) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst6|IR|ALT_INV_Reg_out\(5),
	datae => \inst6|ALT_INV_Rz\(1),
	dataf => \ALT_INV_check_AM~input_o\,
	combout => \inst6|Rz\(1));

\inst6|Rz[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|Rz\(0) = ( \inst6|Rz\(0) & ( \check_AM~input_o\ ) ) # ( \inst6|Rz\(0) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(4) ) ) ) # ( !\inst6|Rz\(0) & ( !\check_AM~input_o\ & ( \inst6|IR|Reg_out\(4) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst6|IR|ALT_INV_Reg_out\(4),
	datae => \inst6|ALT_INV_Rz\(0),
	dataf => \ALT_INV_check_AM~input_o\,
	combout => \inst6|Rz\(0));

ww_AM(1) <= \AM[1]~output_o\;

ww_AM(0) <= \AM[0]~output_o\;

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

ww_opcode(5) <= \opcode[5]~output_o\;

ww_opcode(4) <= \opcode[4]~output_o\;

ww_opcode(3) <= \opcode[3]~output_o\;

ww_opcode(2) <= \opcode[2]~output_o\;

ww_opcode(1) <= \opcode[1]~output_o\;

ww_opcode(0) <= \opcode[0]~output_o\;

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

ww_Rx_out(3) <= \Rx_out[3]~output_o\;

ww_Rx_out(2) <= \Rx_out[2]~output_o\;

ww_Rx_out(1) <= \Rx_out[1]~output_o\;

ww_Rx_out(0) <= \Rx_out[0]~output_o\;

ww_Rz_out(3) <= \Rz_out[3]~output_o\;

ww_Rz_out(2) <= \Rz_out[2]~output_o\;

ww_Rz_out(1) <= \Rz_out[1]~output_o\;

ww_Rz_out(0) <= \Rz_out[0]~output_o\;
END structure;


