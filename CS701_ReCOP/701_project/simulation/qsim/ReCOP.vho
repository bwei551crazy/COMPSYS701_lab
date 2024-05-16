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

-- DATE "05/15/2024 22:49:48"

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

ENTITY 	fetch_with_control IS
    PORT (
	ir_write : OUT std_logic;
	clock : IN std_logic;
	reset : IN std_logic;
	AM : OUT std_logic_vector(1 DOWNTO 0);
	check_AM : OUT std_logic;
	pc_write : OUT std_logic;
	op : OUT std_logic_vector(15 DOWNTO 0);
	pc_mux_sel : OUT std_logic_vector(1 DOWNTO 0);
	present_out : IN std_logic_vector(15 DOWNTO 0);
	rx : IN std_logic_vector(15 DOWNTO 0);
	opcode : OUT std_logic_vector(5 DOWNTO 0);
	PC_out : OUT std_logic_vector(15 DOWNTO 0);
	pm_outdata : OUT std_logic_vector(15 DOWNTO 0);
	Rx_out : OUT std_logic_vector(3 DOWNTO 0);
	Rz_out : OUT std_logic_vector(3 DOWNTO 0);
	state_is : OUT std_logic_vector(2 DOWNTO 0)
	);
END fetch_with_control;

ARCHITECTURE structure OF fetch_with_control IS
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
SIGNAL ww_AM : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_check_AM : std_logic;
SIGNAL ww_pc_write : std_logic;
SIGNAL ww_op : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_pc_mux_sel : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_present_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_rx : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_opcode : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_PC_out : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_pm_outdata : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Rx_out : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Rz_out : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_state_is : std_logic_vector(2 DOWNTO 0);
SIGNAL \present_out[15]~input_o\ : std_logic;
SIGNAL \present_out[14]~input_o\ : std_logic;
SIGNAL \present_out[13]~input_o\ : std_logic;
SIGNAL \present_out[12]~input_o\ : std_logic;
SIGNAL \present_out[11]~input_o\ : std_logic;
SIGNAL \present_out[10]~input_o\ : std_logic;
SIGNAL \present_out[9]~input_o\ : std_logic;
SIGNAL \present_out[8]~input_o\ : std_logic;
SIGNAL \present_out[7]~input_o\ : std_logic;
SIGNAL \present_out[6]~input_o\ : std_logic;
SIGNAL \present_out[5]~input_o\ : std_logic;
SIGNAL \present_out[4]~input_o\ : std_logic;
SIGNAL \present_out[3]~input_o\ : std_logic;
SIGNAL \present_out[2]~input_o\ : std_logic;
SIGNAL \present_out[1]~input_o\ : std_logic;
SIGNAL \present_out[0]~input_o\ : std_logic;
SIGNAL \rx[15]~input_o\ : std_logic;
SIGNAL \rx[14]~input_o\ : std_logic;
SIGNAL \rx[13]~input_o\ : std_logic;
SIGNAL \rx[12]~input_o\ : std_logic;
SIGNAL \rx[11]~input_o\ : std_logic;
SIGNAL \rx[10]~input_o\ : std_logic;
SIGNAL \rx[9]~input_o\ : std_logic;
SIGNAL \rx[8]~input_o\ : std_logic;
SIGNAL \rx[7]~input_o\ : std_logic;
SIGNAL \rx[6]~input_o\ : std_logic;
SIGNAL \rx[5]~input_o\ : std_logic;
SIGNAL \rx[4]~input_o\ : std_logic;
SIGNAL \rx[3]~input_o\ : std_logic;
SIGNAL \rx[2]~input_o\ : std_logic;
SIGNAL \rx[1]~input_o\ : std_logic;
SIGNAL \rx[0]~input_o\ : std_logic;
SIGNAL \ir_write~output_o\ : std_logic;
SIGNAL \AM[1]~output_o\ : std_logic;
SIGNAL \AM[0]~output_o\ : std_logic;
SIGNAL \check_AM~output_o\ : std_logic;
SIGNAL \pc_write~output_o\ : std_logic;
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
SIGNAL \pc_mux_sel[1]~output_o\ : std_logic;
SIGNAL \pc_mux_sel[0]~output_o\ : std_logic;
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
SIGNAL \state_is[2]~output_o\ : std_logic;
SIGNAL \state_is[1]~output_o\ : std_logic;
SIGNAL \state_is[0]~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \inst|pc_counter[0]~1_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \inst|pc_counter[15]~0_combout\ : std_logic;
SIGNAL \inst|Add0~57_sumout\ : std_logic;
SIGNAL \inst|Add0~58\ : std_logic;
SIGNAL \inst|Add0~53_sumout\ : std_logic;
SIGNAL \inst|Add0~54\ : std_logic;
SIGNAL \inst|Add0~49_sumout\ : std_logic;
SIGNAL \inst|Add0~50\ : std_logic;
SIGNAL \inst|Add0~45_sumout\ : std_logic;
SIGNAL \inst|Add0~46\ : std_logic;
SIGNAL \inst|Add0~41_sumout\ : std_logic;
SIGNAL \inst3|memory~583_combout\ : std_logic;
SIGNAL \inst3|memory~584_combout\ : std_logic;
SIGNAL \inst63|state.T2~q\ : std_logic;
SIGNAL \inst63|state.T3~q\ : std_logic;
SIGNAL \inst63|state.init~q\ : std_logic;
SIGNAL \inst63|next_state.T1~combout\ : std_logic;
SIGNAL \inst63|state.T1~q\ : std_logic;
SIGNAL \inst63|state.T1_1~q\ : std_logic;
SIGNAL \inst63|Selector2~1_combout\ : std_logic;
SIGNAL \inst63|check_AM~combout\ : std_logic;
SIGNAL \inst6|temp_AM[1]~0_combout\ : std_logic;
SIGNAL \inst63|Selector2~0_combout\ : std_logic;
SIGNAL \inst63|ir_write~combout\ : std_logic;
SIGNAL \inst6|temp_op[15]~0_combout\ : std_logic;
SIGNAL \inst3|memory~585_combout\ : std_logic;
SIGNAL \inst3|memory~586_combout\ : std_logic;
SIGNAL \inst3|memory~587_combout\ : std_logic;
SIGNAL \inst3|memory~588_combout\ : std_logic;
SIGNAL \inst3|memory~589_combout\ : std_logic;
SIGNAL \inst3|memory~590_combout\ : std_logic;
SIGNAL \inst3|memory~591_combout\ : std_logic;
SIGNAL \inst3|memory~592_combout\ : std_logic;
SIGNAL \inst3|memory~593_combout\ : std_logic;
SIGNAL \inst3|memory~594_combout\ : std_logic;
SIGNAL \inst3|memory~595_combout\ : std_logic;
SIGNAL \inst3|memory~596_combout\ : std_logic;
SIGNAL \inst3|memory~597_combout\ : std_logic;
SIGNAL \inst3|memory~598_combout\ : std_logic;
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
SIGNAL \inst|Add0~14\ : std_logic;
SIGNAL \inst|Add0~9_sumout\ : std_logic;
SIGNAL \inst|Add0~10\ : std_logic;
SIGNAL \inst|Add0~5_sumout\ : std_logic;
SIGNAL \inst|Add0~6\ : std_logic;
SIGNAL \inst|Add0~1_sumout\ : std_logic;
SIGNAL \inst63|state_is~1_combout\ : std_logic;
SIGNAL \inst6|temp_AM\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst6|temp_op\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst6|temp_opcode\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst6|temp_rz\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst|pc_counter\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst3|pm_outdata\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst6|temp_rx\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst63|state_is\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst63|ALT_INV_check_AM~combout\ : std_logic;
SIGNAL \inst63|ALT_INV_ir_write~combout\ : std_logic;
SIGNAL \inst63|ALT_INV_Selector2~1_combout\ : std_logic;
SIGNAL \inst63|ALT_INV_Selector2~0_combout\ : std_logic;
SIGNAL \inst63|ALT_INV_state.T1~q\ : std_logic;
SIGNAL \inst63|ALT_INV_state_is~1_combout\ : std_logic;
SIGNAL \inst63|ALT_INV_state.init~q\ : std_logic;
SIGNAL \inst63|ALT_INV_state.T2~q\ : std_logic;
SIGNAL \inst63|ALT_INV_state.T1_1~q\ : std_logic;
SIGNAL \inst63|ALT_INV_state.T3~q\ : std_logic;
SIGNAL \inst|ALT_INV_pc_counter\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst6|ALT_INV_temp_AM\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_clock~input_o\ : std_logic;

BEGIN

ir_write <= ww_ir_write;
ww_clock <= clock;
ww_reset <= reset;
AM <= ww_AM;
check_AM <= ww_check_AM;
pc_write <= ww_pc_write;
op <= ww_op;
pc_mux_sel <= ww_pc_mux_sel;
ww_present_out <= present_out;
ww_rx <= rx;
opcode <= ww_opcode;
PC_out <= ww_PC_out;
pm_outdata <= ww_pm_outdata;
Rx_out <= ww_Rx_out;
Rz_out <= ww_Rz_out;
state_is <= ww_state_is;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\inst63|ALT_INV_check_AM~combout\ <= NOT \inst63|check_AM~combout\;
\inst63|ALT_INV_ir_write~combout\ <= NOT \inst63|ir_write~combout\;
\inst63|ALT_INV_Selector2~1_combout\ <= NOT \inst63|Selector2~1_combout\;
\inst63|ALT_INV_Selector2~0_combout\ <= NOT \inst63|Selector2~0_combout\;
\inst63|ALT_INV_state.T1~q\ <= NOT \inst63|state.T1~q\;
\inst63|ALT_INV_state_is~1_combout\ <= NOT \inst63|state_is~1_combout\;
\inst63|ALT_INV_state.init~q\ <= NOT \inst63|state.init~q\;
\inst63|ALT_INV_state.T2~q\ <= NOT \inst63|state.T2~q\;
\inst63|ALT_INV_state.T1_1~q\ <= NOT \inst63|state.T1_1~q\;
\inst63|ALT_INV_state.T3~q\ <= NOT \inst63|state.T3~q\;
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
\inst6|ALT_INV_temp_AM\(0) <= NOT \inst6|temp_AM\(0);
\inst6|ALT_INV_temp_AM\(1) <= NOT \inst6|temp_AM\(1);
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_clock~input_o\ <= NOT \clock~input_o\;

\ir_write~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst63|ir_write~combout\,
	devoe => ww_devoe,
	o => \ir_write~output_o\);

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

\check_AM~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst63|check_AM~combout\,
	devoe => ww_devoe,
	o => \check_AM~output_o\);

\pc_write~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst63|ir_write~combout\,
	devoe => ww_devoe,
	o => \pc_write~output_o\);

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
	i => GND,
	devoe => ww_devoe,
	o => \pc_mux_sel[0]~output_o\);

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

\state_is[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst63|state.T3~q\,
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
	i => \inst63|state_is\(1),
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
	i => \inst63|ALT_INV_state_is~1_combout\,
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

\inst|pc_counter[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|pc_counter[0]~1_combout\ = !\inst|pc_counter\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(0),
	combout => \inst|pc_counter[0]~1_combout\);

\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

\inst|pc_counter[15]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|pc_counter[15]~0_combout\ = (\inst63|ir_write~combout\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100010001000100010001000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst63|ALT_INV_ir_write~combout\,
	datab => \ALT_INV_reset~input_o\,
	combout => \inst|pc_counter[15]~0_combout\);

\inst|pc_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|pc_counter[0]~1_combout\,
	ena => \inst|pc_counter[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(0));

\inst|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~57_sumout\ = SUM(( \inst|pc_counter\(1) ) + ( \inst|pc_counter\(0) ) + ( !VCC ))
-- \inst|Add0~58\ = CARRY(( \inst|pc_counter\(1) ) + ( \inst|pc_counter\(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111110000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_pc_counter\(1),
	dataf => \inst|ALT_INV_pc_counter\(0),
	cin => GND,
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
	ena => \inst|pc_counter[15]~0_combout\,
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
	ena => \inst|pc_counter[15]~0_combout\,
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
	ena => \inst|pc_counter[15]~0_combout\,
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
	ena => \inst|pc_counter[15]~0_combout\,
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
	ena => \inst|pc_counter[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(5));

\inst3|memory~583\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~583_combout\ = ( \inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (!\inst|pc_counter\(3) $ (((!\inst|pc_counter\(4) & \inst|pc_counter\(2)))))) ) ) ) # ( !\inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( 
-- (!\inst|pc_counter\(5) & (\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & \inst|pc_counter\(2)))) ) ) ) # ( \inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(4) & ((!\inst|pc_counter\(3) & ((!\inst|pc_counter\(2)))) # 
-- (\inst|pc_counter\(3) & (!\inst|pc_counter\(5))))) ) ) ) # ( !\inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & !\inst|pc_counter\(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000000000110010000000100000000000001000001010000000101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(5),
	datab => \inst|ALT_INV_pc_counter\(4),
	datac => \inst|ALT_INV_pc_counter\(3),
	datad => \inst|ALT_INV_pc_counter\(2),
	datae => \inst|ALT_INV_pc_counter\(1),
	dataf => \inst|ALT_INV_pc_counter\(0),
	combout => \inst3|memory~583_combout\);

\inst3|pm_outdata[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~583_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(15));

\inst3|memory~584\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~584_combout\ = ( \inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (!\inst|pc_counter\(4) & ((!\inst|pc_counter\(3)) # (\inst|pc_counter\(2))))) ) ) ) # ( !\inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( 
-- (!\inst|pc_counter\(5) & (\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & !\inst|pc_counter\(2)))) ) ) ) # ( \inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & !\inst|pc_counter\(4)) ) ) ) # ( !\inst|pc_counter\(1) & ( 
-- !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & ((!\inst|pc_counter\(4) & ((!\inst|pc_counter\(3)) # (!\inst|pc_counter\(2)))) # (\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & !\inst|pc_counter\(2))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010100010000000100010001000100000100000000000001000000010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(5),
	datab => \inst|ALT_INV_pc_counter\(4),
	datac => \inst|ALT_INV_pc_counter\(3),
	datad => \inst|ALT_INV_pc_counter\(2),
	datae => \inst|ALT_INV_pc_counter\(1),
	dataf => \inst|ALT_INV_pc_counter\(0),
	combout => \inst3|memory~584_combout\);

\inst3|pm_outdata[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~584_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(14));

\inst6|temp_AM[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(14),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_AM\(0));

\inst63|state.T2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst63|state.T1_1~q\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst63|state.T2~q\);

\inst63|state.T3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst63|state.T2~q\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst63|state.T3~q\);

\inst63|state.init\ : dffeas
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
	q => \inst63|state.init~q\);

\inst63|next_state.T1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst63|next_state.T1~combout\ = (!\inst63|state.init~q\) # (\inst63|state.T3~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101110111011101110111011101110111011101110111011101110111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst63|ALT_INV_state.T3~q\,
	datab => \inst63|ALT_INV_state.init~q\,
	combout => \inst63|next_state.T1~combout\);

\inst63|state.T1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst63|next_state.T1~combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst63|state.T1~q\);

\inst63|state.T1_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst63|state.T1~q\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst63|state.T1_1~q\);

\inst63|Selector2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst63|Selector2~1_combout\ = (\inst63|state.T1_1~q\ & (!\inst6|temp_AM\(1) $ (!\inst6|temp_AM\(0))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011000000110000001100000011000000110000001100000011000000110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst63|ALT_INV_state.T1_1~q\,
	combout => \inst63|Selector2~1_combout\);

\inst63|check_AM\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst63|check_AM~combout\ = ( \inst63|check_AM~combout\ & ( \inst63|state.T3~q\ ) ) # ( \inst63|check_AM~combout\ & ( !\inst63|state.T3~q\ & ( \inst63|Selector2~1_combout\ ) ) ) # ( !\inst63|check_AM~combout\ & ( !\inst63|state.T3~q\ & ( 
-- \inst63|Selector2~1_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst63|ALT_INV_Selector2~1_combout\,
	datae => \inst63|ALT_INV_check_AM~combout\,
	dataf => \inst63|ALT_INV_state.T3~q\,
	combout => \inst63|check_AM~combout\);

\inst6|temp_AM[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|temp_AM[1]~0_combout\ = (\inst63|ir_write~combout\ & !\inst63|check_AM~combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100010001000100010001000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst63|ALT_INV_ir_write~combout\,
	datab => \inst63|ALT_INV_check_AM~combout\,
	combout => \inst6|temp_AM[1]~0_combout\);

\inst6|temp_AM[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(15),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_AM\(1));

\inst63|Selector2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst63|Selector2~0_combout\ = ((\inst63|state.T1_1~q\ & (!\inst6|temp_AM\(1) $ (!\inst6|temp_AM\(0))))) # (\inst63|state.T1~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011011111111000001101111111100000110111111110000011011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|ALT_INV_temp_AM\(1),
	datab => \inst6|ALT_INV_temp_AM\(0),
	datac => \inst63|ALT_INV_state.T1_1~q\,
	datad => \inst63|ALT_INV_state.T1~q\,
	combout => \inst63|Selector2~0_combout\);

\inst63|ir_write\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst63|ir_write~combout\ = ( \inst63|ir_write~combout\ & ( \inst63|state.T3~q\ ) ) # ( \inst63|ir_write~combout\ & ( !\inst63|state.T3~q\ & ( \inst63|Selector2~0_combout\ ) ) ) # ( !\inst63|ir_write~combout\ & ( !\inst63|state.T3~q\ & ( 
-- \inst63|Selector2~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst63|ALT_INV_Selector2~0_combout\,
	datae => \inst63|ALT_INV_ir_write~combout\,
	dataf => \inst63|ALT_INV_state.T3~q\,
	combout => \inst63|ir_write~combout\);

\inst6|temp_op[15]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst6|temp_op[15]~0_combout\ = (\inst63|ir_write~combout\ & \inst63|check_AM~combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010001000100010001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst63|ALT_INV_ir_write~combout\,
	datab => \inst63|ALT_INV_check_AM~combout\,
	combout => \inst6|temp_op[15]~0_combout\);

\inst6|temp_op[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(15),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_op[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(15));

\inst6|temp_op[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(14),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_op[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(14));

\inst3|memory~585\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~585_combout\ = ( \inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (!\inst|pc_counter\(4) & \inst|pc_counter\(3))) ) ) ) # ( !\inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & 
-- (!\inst|pc_counter\(4) & (\inst|pc_counter\(3) & \inst|pc_counter\(2)))) ) ) ) # ( \inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(4) & ((!\inst|pc_counter\(3) & ((!\inst|pc_counter\(2)))) # (\inst|pc_counter\(3) & 
-- (!\inst|pc_counter\(5))))) ) ) ) # ( !\inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & ((!\inst|pc_counter\(4) & (\inst|pc_counter\(3) & \inst|pc_counter\(2))) # (\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & 
-- !\inst|pc_counter\(2))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000001000110010000000100000000000000010000000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(5),
	datab => \inst|ALT_INV_pc_counter\(4),
	datac => \inst|ALT_INV_pc_counter\(3),
	datad => \inst|ALT_INV_pc_counter\(2),
	datae => \inst|ALT_INV_pc_counter\(1),
	dataf => \inst|ALT_INV_pc_counter\(0),
	combout => \inst3|memory~585_combout\);

\inst3|pm_outdata[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~585_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(13));

\inst6|temp_op[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(13),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_op[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(13));

\inst3|memory~586\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~586_combout\ = ( \inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & ((!\inst|pc_counter\(4) & (\inst|pc_counter\(3))) # (\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & !\inst|pc_counter\(2))))) ) ) ) # ( 
-- !\inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & ((!\inst|pc_counter\(4) & (\inst|pc_counter\(3) & \inst|pc_counter\(2))) # (\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & !\inst|pc_counter\(2))))) ) ) ) # ( 
-- \inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (!\inst|pc_counter\(4) & ((!\inst|pc_counter\(2)) # (\inst|pc_counter\(3))))) ) ) ) # ( !\inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & 
-- ((!\inst|pc_counter\(4) & (\inst|pc_counter\(3) & \inst|pc_counter\(2))) # (\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & !\inst|pc_counter\(2))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000001000100010000000100000100000000010000010100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(5),
	datab => \inst|ALT_INV_pc_counter\(4),
	datac => \inst|ALT_INV_pc_counter\(3),
	datad => \inst|ALT_INV_pc_counter\(2),
	datae => \inst|ALT_INV_pc_counter\(1),
	dataf => \inst|ALT_INV_pc_counter\(0),
	combout => \inst3|memory~586_combout\);

\inst3|pm_outdata[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~586_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(12));

\inst6|temp_op[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(12),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_op[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(12));

\inst3|memory~587\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~587_combout\ = ( \inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (!\inst|pc_counter\(2) & ((!\inst|pc_counter\(4)) # (!\inst|pc_counter\(3))))) ) ) ) # ( !\inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( 
-- (!\inst|pc_counter\(5) & ((!\inst|pc_counter\(4) & (\inst|pc_counter\(3) & \inst|pc_counter\(2))) # (\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & !\inst|pc_counter\(2))))) ) ) ) # ( \inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( 
-- (!\inst|pc_counter\(4) & ((!\inst|pc_counter\(3) & ((!\inst|pc_counter\(2)))) # (\inst|pc_counter\(3) & (!\inst|pc_counter\(5) & \inst|pc_counter\(2))))) ) ) ) # ( !\inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & 
-- ((!\inst|pc_counter\(4) & ((\inst|pc_counter\(2)))) # (\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & !\inst|pc_counter\(2))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000010001000110000000000100000100000000010001010100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(5),
	datab => \inst|ALT_INV_pc_counter\(4),
	datac => \inst|ALT_INV_pc_counter\(3),
	datad => \inst|ALT_INV_pc_counter\(2),
	datae => \inst|ALT_INV_pc_counter\(1),
	dataf => \inst|ALT_INV_pc_counter\(0),
	combout => \inst3|memory~587_combout\);

\inst3|pm_outdata[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~587_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(11));

\inst6|temp_op[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(11),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_op[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(11));

\inst3|memory~588\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~588_combout\ = ( \inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & ((!\inst|pc_counter\(3) & ((!\inst|pc_counter\(2)))) # (\inst|pc_counter\(3) & (!\inst|pc_counter\(4))))) ) ) ) # ( !\inst|pc_counter\(1) & ( 
-- \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & ((!\inst|pc_counter\(4) & (\inst|pc_counter\(3) & \inst|pc_counter\(2))) # (\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & !\inst|pc_counter\(2))))) ) ) ) # ( \inst|pc_counter\(1) & ( 
-- !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (!\inst|pc_counter\(4) & (!\inst|pc_counter\(3) $ (!\inst|pc_counter\(2))))) ) ) ) # ( !\inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (!\inst|pc_counter\(4) & 
-- (\inst|pc_counter\(3) & \inst|pc_counter\(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001000000010001000000000100000000010001010100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(5),
	datab => \inst|ALT_INV_pc_counter\(4),
	datac => \inst|ALT_INV_pc_counter\(3),
	datad => \inst|ALT_INV_pc_counter\(2),
	datae => \inst|ALT_INV_pc_counter\(1),
	dataf => \inst|ALT_INV_pc_counter\(0),
	combout => \inst3|memory~588_combout\);

\inst3|pm_outdata[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~588_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(10));

\inst6|temp_op[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(10),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_op[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(10));

\inst3|memory~589\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~589_combout\ = ( \inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (!\inst|pc_counter\(4) & \inst|pc_counter\(3))) ) ) ) # ( !\inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & 
-- (\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & !\inst|pc_counter\(2)))) ) ) ) # ( \inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(4) & ((!\inst|pc_counter\(5) & (\inst|pc_counter\(3))) # (\inst|pc_counter\(5) & 
-- (!\inst|pc_counter\(3) & !\inst|pc_counter\(2))))) ) ) ) # ( !\inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & ((!\inst|pc_counter\(4) & (\inst|pc_counter\(3) & \inst|pc_counter\(2))) # (\inst|pc_counter\(4) & 
-- (!\inst|pc_counter\(3) & !\inst|pc_counter\(2))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000001000010010000000100000100000000000000000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(5),
	datab => \inst|ALT_INV_pc_counter\(4),
	datac => \inst|ALT_INV_pc_counter\(3),
	datad => \inst|ALT_INV_pc_counter\(2),
	datae => \inst|ALT_INV_pc_counter\(1),
	dataf => \inst|ALT_INV_pc_counter\(0),
	combout => \inst3|memory~589_combout\);

\inst3|pm_outdata[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~589_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(9));

\inst6|temp_op[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(9),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_op[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(9));

\inst3|memory~590\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~590_combout\ = ( \inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & ((!\inst|pc_counter\(4) & (\inst|pc_counter\(3))) # (\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & !\inst|pc_counter\(2))))) ) ) ) # ( 
-- \inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(4) & ((!\inst|pc_counter\(5) & (\inst|pc_counter\(3) & \inst|pc_counter\(2))) # (\inst|pc_counter\(5) & (!\inst|pc_counter\(3) & !\inst|pc_counter\(2))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010000000000100000000000000000000010100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(5),
	datab => \inst|ALT_INV_pc_counter\(4),
	datac => \inst|ALT_INV_pc_counter\(3),
	datad => \inst|ALT_INV_pc_counter\(2),
	datae => \inst|ALT_INV_pc_counter\(1),
	dataf => \inst|ALT_INV_pc_counter\(0),
	combout => \inst3|memory~590_combout\);

\inst3|pm_outdata[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~590_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(8));

\inst6|temp_op[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(8),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_op[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(8));

\inst3|memory~591\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~591_combout\ = ( !\inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & !\inst|pc_counter\(2)))) ) ) ) # ( \inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( 
-- (\inst|pc_counter\(5) & (!\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & !\inst|pc_counter\(2)))) ) ) ) # ( !\inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (!\inst|pc_counter\(4) & (\inst|pc_counter\(3) & 
-- !\inst|pc_counter\(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000010000000000000000100000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(5),
	datab => \inst|ALT_INV_pc_counter\(4),
	datac => \inst|ALT_INV_pc_counter\(3),
	datad => \inst|ALT_INV_pc_counter\(2),
	datae => \inst|ALT_INV_pc_counter\(1),
	dataf => \inst|ALT_INV_pc_counter\(0),
	combout => \inst3|memory~591_combout\);

\inst3|pm_outdata[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~591_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(7));

\inst6|temp_op[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(7),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_op[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(7));

\inst3|memory~592\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~592_combout\ = ( \inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (\inst|pc_counter\(2) & (!\inst|pc_counter\(4) $ (!\inst|pc_counter\(3))))) ) ) ) # ( !\inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( 
-- (!\inst|pc_counter\(5) & (\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & !\inst|pc_counter\(2)))) ) ) ) # ( \inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & !\inst|pc_counter\(2))) ) ) ) # ( 
-- !\inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (!\inst|pc_counter\(2) & (!\inst|pc_counter\(4) $ (!\inst|pc_counter\(3))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010100000000000110000000000000000100000000000000000000000101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(5),
	datab => \inst|ALT_INV_pc_counter\(4),
	datac => \inst|ALT_INV_pc_counter\(3),
	datad => \inst|ALT_INV_pc_counter\(2),
	datae => \inst|ALT_INV_pc_counter\(1),
	dataf => \inst|ALT_INV_pc_counter\(0),
	combout => \inst3|memory~592_combout\);

\inst3|pm_outdata[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~592_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(6));

\inst6|temp_op[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(6),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_op[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(6));

\inst3|memory~593\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~593_combout\ = ( \inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (!\inst|pc_counter\(3) & (!\inst|pc_counter\(4) $ (\inst|pc_counter\(2))))) ) ) ) # ( \inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( 
-- (!\inst|pc_counter\(5) & (!\inst|pc_counter\(4) & \inst|pc_counter\(3))) ) ) ) # ( !\inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (!\inst|pc_counter\(4) & (\inst|pc_counter\(3) & !\inst|pc_counter\(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000000010000000100000000000000000001000000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(5),
	datab => \inst|ALT_INV_pc_counter\(4),
	datac => \inst|ALT_INV_pc_counter\(3),
	datad => \inst|ALT_INV_pc_counter\(2),
	datae => \inst|ALT_INV_pc_counter\(1),
	dataf => \inst|ALT_INV_pc_counter\(0),
	combout => \inst3|memory~593_combout\);

\inst3|pm_outdata[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~593_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(5));

\inst6|temp_op[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(5),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_op[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(5));

\inst3|memory~594\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~594_combout\ = ( \inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & ((!\inst|pc_counter\(4)) # ((!\inst|pc_counter\(3) & \inst|pc_counter\(2))))) ) ) ) # ( !\inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( 
-- (!\inst|pc_counter\(5) & (!\inst|pc_counter\(3) & (!\inst|pc_counter\(4) $ (\inst|pc_counter\(2))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000100000100010001010100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(5),
	datab => \inst|ALT_INV_pc_counter\(4),
	datac => \inst|ALT_INV_pc_counter\(3),
	datad => \inst|ALT_INV_pc_counter\(2),
	datae => \inst|ALT_INV_pc_counter\(1),
	dataf => \inst|ALT_INV_pc_counter\(0),
	combout => \inst3|memory~594_combout\);

\inst3|pm_outdata[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~594_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(4));

\inst6|temp_op[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(4),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_op[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(4));

\inst3|memory~595\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~595_combout\ = ( \inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (!\inst|pc_counter\(4) & !\inst|pc_counter\(3))) ) ) ) # ( !\inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & 
-- ((!\inst|pc_counter\(4) & (!\inst|pc_counter\(3) $ (!\inst|pc_counter\(2)))) # (\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & !\inst|pc_counter\(2))))) ) ) ) # ( \inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(4) & 
-- (!\inst|pc_counter\(3) & (!\inst|pc_counter\(5) $ (!\inst|pc_counter\(2))))) ) ) ) # ( !\inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (!\inst|pc_counter\(4) & (\inst|pc_counter\(3) & !\inst|pc_counter\(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000010000001000000000101000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(5),
	datab => \inst|ALT_INV_pc_counter\(4),
	datac => \inst|ALT_INV_pc_counter\(3),
	datad => \inst|ALT_INV_pc_counter\(2),
	datae => \inst|ALT_INV_pc_counter\(1),
	dataf => \inst|ALT_INV_pc_counter\(0),
	combout => \inst3|memory~595_combout\);

\inst3|pm_outdata[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~595_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(3));

\inst6|temp_op[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(3),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_op[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(3));

\inst3|memory~596\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~596_combout\ = ( \inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (\inst|pc_counter\(2) & (!\inst|pc_counter\(4) $ (!\inst|pc_counter\(3))))) ) ) ) # ( !\inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( 
-- (!\inst|pc_counter\(5) & (!\inst|pc_counter\(3) & !\inst|pc_counter\(2))) ) ) ) # ( \inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(3) & ((!\inst|pc_counter\(5) & (\inst|pc_counter\(4) & \inst|pc_counter\(2))) # 
-- (\inst|pc_counter\(5) & (!\inst|pc_counter\(4) & !\inst|pc_counter\(2))))) ) ) ) # ( !\inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & ((!\inst|pc_counter\(4) & (\inst|pc_counter\(3) & !\inst|pc_counter\(2))) # 
-- (\inst|pc_counter\(4) & (!\inst|pc_counter\(3))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010100000100000010000000010000010100000000000000000000000101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(5),
	datab => \inst|ALT_INV_pc_counter\(4),
	datac => \inst|ALT_INV_pc_counter\(3),
	datad => \inst|ALT_INV_pc_counter\(2),
	datae => \inst|ALT_INV_pc_counter\(1),
	dataf => \inst|ALT_INV_pc_counter\(0),
	combout => \inst3|memory~596_combout\);

\inst3|pm_outdata[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~596_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(2));

\inst6|temp_op[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(2),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_op[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(2));

\inst3|memory~597\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~597_combout\ = ( \inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (!\inst|pc_counter\(3) & ((!\inst|pc_counter\(4)) # (\inst|pc_counter\(2))))) ) ) ) # ( !\inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( 
-- (!\inst|pc_counter\(5) & (!\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & \inst|pc_counter\(2)))) ) ) ) # ( \inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (!\inst|pc_counter\(4) & ((!\inst|pc_counter\(2)) # 
-- (\inst|pc_counter\(3))))) ) ) ) # ( !\inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (!\inst|pc_counter\(4) & (\inst|pc_counter\(3) & !\inst|pc_counter\(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000000000100010000000100000000000100000001000000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(5),
	datab => \inst|ALT_INV_pc_counter\(4),
	datac => \inst|ALT_INV_pc_counter\(3),
	datad => \inst|ALT_INV_pc_counter\(2),
	datae => \inst|ALT_INV_pc_counter\(1),
	dataf => \inst|ALT_INV_pc_counter\(0),
	combout => \inst3|memory~597_combout\);

\inst3|pm_outdata[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~597_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(1));

\inst6|temp_op[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(1),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_op[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(1));

\inst3|memory~598\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst3|memory~598_combout\ = ( \inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & \inst|pc_counter\(2)))) ) ) ) # ( !\inst|pc_counter\(1) & ( \inst|pc_counter\(0) & ( 
-- (!\inst|pc_counter\(5) & (!\inst|pc_counter\(4) & !\inst|pc_counter\(3))) ) ) ) # ( \inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (!\inst|pc_counter\(4) $ ((!\inst|pc_counter\(3))))) # (\inst|pc_counter\(5) & 
-- (!\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & !\inst|pc_counter\(2)))) ) ) ) # ( !\inst|pc_counter\(1) & ( !\inst|pc_counter\(0) & ( (!\inst|pc_counter\(5) & (\inst|pc_counter\(4) & (!\inst|pc_counter\(3) & \inst|pc_counter\(2)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000100000011010000010100010000000100000000000000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_pc_counter\(5),
	datab => \inst|ALT_INV_pc_counter\(4),
	datac => \inst|ALT_INV_pc_counter\(3),
	datad => \inst|ALT_INV_pc_counter\(2),
	datae => \inst|ALT_INV_pc_counter\(1),
	dataf => \inst|ALT_INV_pc_counter\(0),
	combout => \inst3|memory~598_combout\);

\inst3|pm_outdata[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clock~input_o\,
	d => \inst3|memory~598_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|pm_outdata\(0));

\inst6|temp_op[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(0),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_op[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_op\(0));

\inst6|temp_opcode[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(13),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_opcode\(5));

\inst6|temp_opcode[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(12),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_opcode\(4));

\inst6|temp_opcode[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(11),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_opcode\(3));

\inst6|temp_opcode[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(10),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_opcode\(2));

\inst6|temp_opcode[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(9),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_opcode\(1));

\inst6|temp_opcode[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(8),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_opcode\(0));

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
	ena => \inst|pc_counter[15]~0_combout\,
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
	ena => \inst|pc_counter[15]~0_combout\,
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
	ena => \inst|pc_counter[15]~0_combout\,
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
	ena => \inst|pc_counter[15]~0_combout\,
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
	ena => \inst|pc_counter[15]~0_combout\,
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
	ena => \inst|pc_counter[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(11));

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

\inst|pc_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~13_sumout\,
	ena => \inst|pc_counter[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(12));

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

\inst|pc_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~9_sumout\,
	ena => \inst|pc_counter[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(13));

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

\inst|pc_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst|Add0~5_sumout\,
	ena => \inst|pc_counter[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(14));

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
	ena => \inst|pc_counter[15]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|pc_counter\(15));

\inst6|temp_rx[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(3),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_rx\(3));

\inst6|temp_rx[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(2),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_rx\(2));

\inst6|temp_rx[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(1),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_rx\(1));

\inst6|temp_rx[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(0),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_rx\(0));

\inst6|temp_rz[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(7),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_rz\(3));

\inst6|temp_rz[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(6),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_rz\(2));

\inst6|temp_rz[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(5),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_rz\(1));

\inst6|temp_rz[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \inst3|pm_outdata\(4),
	clrn => \ALT_INV_reset~input_o\,
	ena => \inst6|temp_AM[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|temp_rz\(0));

\inst63|state_is[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst63|state_is\(1) = (\inst63|state.T2~q\) # (\inst63|state.T1_1~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111011101110111011101110111011101110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst63|ALT_INV_state.T1_1~q\,
	datab => \inst63|ALT_INV_state.T2~q\,
	combout => \inst63|state_is\(1));

\inst63|state_is~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst63|state_is~1_combout\ = (!\inst63|state.init~q\) # (\inst63|state.T1_1~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101110111011101110111011101110111011101110111011101110111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst63|ALT_INV_state.T1_1~q\,
	datab => \inst63|ALT_INV_state.init~q\,
	combout => \inst63|state_is~1_combout\);

\present_out[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(15),
	o => \present_out[15]~input_o\);

\present_out[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(14),
	o => \present_out[14]~input_o\);

\present_out[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(13),
	o => \present_out[13]~input_o\);

\present_out[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(12),
	o => \present_out[12]~input_o\);

\present_out[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(11),
	o => \present_out[11]~input_o\);

\present_out[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(10),
	o => \present_out[10]~input_o\);

\present_out[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(9),
	o => \present_out[9]~input_o\);

\present_out[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(8),
	o => \present_out[8]~input_o\);

\present_out[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(7),
	o => \present_out[7]~input_o\);

\present_out[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(6),
	o => \present_out[6]~input_o\);

\present_out[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(5),
	o => \present_out[5]~input_o\);

\present_out[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(4),
	o => \present_out[4]~input_o\);

\present_out[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(3),
	o => \present_out[3]~input_o\);

\present_out[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(2),
	o => \present_out[2]~input_o\);

\present_out[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(1),
	o => \present_out[1]~input_o\);

\present_out[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_present_out(0),
	o => \present_out[0]~input_o\);

\rx[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(15),
	o => \rx[15]~input_o\);

\rx[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(14),
	o => \rx[14]~input_o\);

\rx[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(13),
	o => \rx[13]~input_o\);

\rx[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(12),
	o => \rx[12]~input_o\);

\rx[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(11),
	o => \rx[11]~input_o\);

\rx[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(10),
	o => \rx[10]~input_o\);

\rx[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(9),
	o => \rx[9]~input_o\);

\rx[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(8),
	o => \rx[8]~input_o\);

\rx[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(7),
	o => \rx[7]~input_o\);

\rx[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(6),
	o => \rx[6]~input_o\);

\rx[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(5),
	o => \rx[5]~input_o\);

\rx[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(4),
	o => \rx[4]~input_o\);

\rx[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(3),
	o => \rx[3]~input_o\);

\rx[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(2),
	o => \rx[2]~input_o\);

\rx[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(1),
	o => \rx[1]~input_o\);

\rx[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx(0),
	o => \rx[0]~input_o\);

ww_ir_write <= \ir_write~output_o\;

ww_AM(1) <= \AM[1]~output_o\;

ww_AM(0) <= \AM[0]~output_o\;

ww_check_AM <= \check_AM~output_o\;

ww_pc_write <= \pc_write~output_o\;

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

ww_pc_mux_sel(1) <= \pc_mux_sel[1]~output_o\;

ww_pc_mux_sel(0) <= \pc_mux_sel[0]~output_o\;

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

ww_state_is(2) <= \state_is[2]~output_o\;

ww_state_is(1) <= \state_is[1]~output_o\;

ww_state_is(0) <= \state_is[0]~output_o\;
END structure;


