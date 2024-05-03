
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
end DP_ASP;

architecture rtl of DP_ASP is
signal addr_0   : std_logic_vector(3 downto 0) := "0010";
signal addr_1   : std_logic_vector(3 downto 0) := "0010";
signal address: std_logic_vector(7 downto 0);
begin
	process(clock, recv)
		variable readPacket : std_logic_vector(15 downto 0);
		variable casted : std_logic_vector(15 downto 0);
		variable recvdata: signed(15 downto 0);
		begin
		if rising_edge(clock) then

			if recv.data(31 downto 28) = "1001" then
				if recv.data(16) = '0' then
					send.addr <= x"0" & recv.data(23 downto 20); --configure to whatever this address is. 
				end if;
			elsif recv.data(31 downto 28) = "1000" then
				if recv.data(16) = '0' then
					recvdata := signed(recv.data(15 downto 0));
						if (recvdata > to_signed(2048,16)) then
							recvdata := to_signed(4096,16);
						elsif (recvdata < to_signed(-2048,16)) then
							recvdata := to_signed(-4096,16);
						else
							recvdata := shift_left(signed(recv.data(15 downto 0)),1);
						end if;

						if recv.data(16) = '0' then
							send.data<= x"8000" & std_logic_vector(recvdata);
						
						else
								send.data <= x"8001" & std_logic_vector(recvdata);
						end if;
					send.addr <= x"01"; --send to daca
				end if;
			end if;

	  end if;
    end process;

end architecture;
					
				
		
		