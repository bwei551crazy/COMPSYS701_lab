library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library work;
use work.TdmaMinTypes.all;

entity DP_ASP is
	port (
		clock : in  std_logic;
		send  : out tdma_min_port;
		recv  : in  tdma_min_port
	);
end entity;

architecture rtl of DP_ASP is
	begin
		process(clock)
		variable audio_val : integer(15 downto 0) := x"0000";
		begin	
			if rising_edge(clock) then 
				if recv.data(31 downto 28) == "1000" then
					
					audio_val = recv.data(15 downto 0) * 2;
					if (audio_val<=4096) and (audio_val >= -4096) then
						send.data <= "1000000000000000" & audio_val;
						sned.addr <= "0000" & "0001";
					elsif (audio_val > 4096)then
						audio_val = 4096;
						send.data <= "1000000000000000" & audio_val;
						sned.addr <= "0000" & "0001";
					elsif (audio_val < 4096) then
						audio_val = -4096;
						send.data <= "1000000000000000" & audio_val;
						sned.addr <= "0000" & "0001";
					else 
						send.data <= "1000000000000000" & (others => 0);
						sned.addr <= "0000" & "0001";
					end if;
				end if;
			end if;
		end process;
end architecture;
					
				
		
		