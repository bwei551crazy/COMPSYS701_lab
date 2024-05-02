	component nios_II_q4 is
		port (
			addr_external_connection_export : out std_logic_vector(7 downto 0);                     -- export
			clk_clk                         : in  std_logic                     := 'X';             -- clk
			hex0_external_connection_export : out std_logic_vector(6 downto 0);                     -- export
			hex1_external_connection_export : out std_logic_vector(6 downto 0);                     -- export
			hex2_external_connection_export : out std_logic_vector(6 downto 0);                     -- export
			hex3_external_connection_export : out std_logic_vector(6 downto 0);                     -- export
			hex4_external_connection_export : out std_logic_vector(6 downto 0);                     -- export
			hex5_external_connection_export : out std_logic_vector(6 downto 0);                     -- export
			key_external_connection_export  : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			recv_external_connection_export : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			reset_reset_n                   : in  std_logic                     := 'X';             -- reset_n
			send_external_connection_export : out std_logic_vector(31 downto 0)                     -- export
		);
	end component nios_II_q4;

	u0 : component nios_II_q4
		port map (
			addr_external_connection_export => CONNECTED_TO_addr_external_connection_export, -- addr_external_connection.export
			clk_clk                         => CONNECTED_TO_clk_clk,                         --                      clk.clk
			hex0_external_connection_export => CONNECTED_TO_hex0_external_connection_export, -- hex0_external_connection.export
			hex1_external_connection_export => CONNECTED_TO_hex1_external_connection_export, -- hex1_external_connection.export
			hex2_external_connection_export => CONNECTED_TO_hex2_external_connection_export, -- hex2_external_connection.export
			hex3_external_connection_export => CONNECTED_TO_hex3_external_connection_export, -- hex3_external_connection.export
			hex4_external_connection_export => CONNECTED_TO_hex4_external_connection_export, -- hex4_external_connection.export
			hex5_external_connection_export => CONNECTED_TO_hex5_external_connection_export, -- hex5_external_connection.export
			key_external_connection_export  => CONNECTED_TO_key_external_connection_export,  --  key_external_connection.export
			recv_external_connection_export => CONNECTED_TO_recv_external_connection_export, -- recv_external_connection.export
			reset_reset_n                   => CONNECTED_TO_reset_reset_n,                   --                    reset.reset_n
			send_external_connection_export => CONNECTED_TO_send_external_connection_export  -- send_external_connection.export
		);

