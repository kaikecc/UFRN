-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "01/28/2021 12:55:26"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	mux4x1 IS
    PORT (
	Ea : IN std_logic;
	Eb : IN std_logic;
	Ec : IN std_logic;
	Ed : IN std_logic;
	SELEC : IN std_logic_vector(1 DOWNTO 0);
	M_Saida : BUFFER std_logic
	);
END mux4x1;

-- Design Ports Information
-- Eb	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Ec	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Ed	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SELEC[0]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SELEC[1]	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- M_Saida	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Ea	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF mux4x1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Ea : std_logic;
SIGNAL ww_Eb : std_logic;
SIGNAL ww_Ec : std_logic;
SIGNAL ww_Ed : std_logic;
SIGNAL ww_SELEC : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_M_Saida : std_logic;
SIGNAL \Eb~input_o\ : std_logic;
SIGNAL \Ec~input_o\ : std_logic;
SIGNAL \Ed~input_o\ : std_logic;
SIGNAL \SELEC[0]~input_o\ : std_logic;
SIGNAL \SELEC[1]~input_o\ : std_logic;
SIGNAL \M_Saida~output_o\ : std_logic;
SIGNAL \Ea~input_o\ : std_logic;

BEGIN

ww_Ea <= Ea;
ww_Eb <= Eb;
ww_Ec <= Ec;
ww_Ed <= Ed;
ww_SELEC <= SELEC;
M_Saida <= ww_M_Saida;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X14_Y31_N9
\M_Saida~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Ea~input_o\,
	devoe => ww_devoe,
	o => \M_Saida~output_o\);

-- Location: IOIBUF_X14_Y31_N1
\Ea~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Ea,
	o => \Ea~input_o\);

-- Location: IOIBUF_X22_Y0_N1
\Eb~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Eb,
	o => \Eb~input_o\);

-- Location: IOIBUF_X8_Y0_N8
\Ec~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Ec,
	o => \Ec~input_o\);

-- Location: IOIBUF_X33_Y14_N8
\Ed~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Ed,
	o => \Ed~input_o\);

-- Location: IOIBUF_X33_Y27_N1
\SELEC[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SELEC(0),
	o => \SELEC[0]~input_o\);

-- Location: IOIBUF_X26_Y0_N1
\SELEC[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SELEC(1),
	o => \SELEC[1]~input_o\);

ww_M_Saida <= \M_Saida~output_o\;
END structure;


