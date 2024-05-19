-- Zoran Salcic

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.recop_types.all;
use work.various_constants.all;
use work.opcodes.all;

entity memory is
	port (
		clk: in bit_1 := '0';
		--pm_rd: in bit_1 := '0';
		pm_address: in bit_16 := X"0000";
		pm_outdata: out bit_16 := X"0000";
		
		--dm_rd: in bit_1 := '0';
		dm_address: in bit_16 := X"0000";
		dm_outdata: out bit_16 := X"0000";
		
		dm_wr: in bit_1 := '0';
		dm_indata: in bit_16 := X"0000"
		
		);
end memory;

architecture beh of memory is
	type memory_array is array (31 downto 0) of bit_16;
	signal memory: memory_array:=(X"abcd",X"0000",X"0000",X"0000",X"0000",X"0000",X"0000",X"0000",X"0000",X"0000",X"0000",
	--X"0002",
	--am_immediate&present&X"d"&X"d",
	--X"0000",
	--am_immediate&andr&X"d"&X"d",
	--X"0002",
	--am_immediate&present&X"d"&X"d",
	--am_register&ldr&X"0"&X"9",
	--X"0006",
	--am_direct&str&X"c"&X"3",
	--am_register&ldr&X"0"&X"c",
	--am_register&str&X"c"&X"c",
	--am_register&ldr&X"0"&X"7",
	--X"aaaa",
	--am_immediate&str&X"7"&X"7",
	-- X"0002",
	-- am_immediate&sz&X"0"&X"0",
	-- am_inherent&clfz&X"0"&X"0",
	-- X"0000",
	-- am_immediate&andr&X"d"&X"d",
	-- X"0002",
	-- am_immediate&sz&X"b"&X"b",
	-- am_register&datacall&X"b"&X"b",
	-- X"1234",
	-- am_immediate&datacall&X"b"&X"b",	
--	-- X"001f",
--	am_direct&ldr&X"6"&X"7",
--	X"0015",
--	am_direct&ldr&X"0"&X"0",
--	X"0015",
--	am_direct&strpc&X"0"&X"0",
--	X"0001",
--	am_immediate&max&X"c"&X"c",
--	am_register&ssop&X"4"&X"4",
--	am_register&lsip&X"4"&X"4",
--	am_register&ssvop&X"3"&X"3",
--	am_inherent&cer&X"0"&X"0",
--	am_inherent&ceot&X"0"&X"0",
--	am_inherent&seot&X"0"&X"0",
--	am_register&ler&X"3"&X"3",
--	X"0008",
--	am_immediate&ldr&X"e"&X"e",
--	X"400a",
--	am_immediate&subr&X"1"&X"8",
--	X"000b",
--	am_immediate&andr&X"0"&X"0",
--	am_register&orr&X"2"&X"a",
	x"0000",
	x"0000",
	--am_register&jmp&x"0"&x"C", --Should jump to the 6th address in memory
	x"0000",
	--x"0006",
	x"0000",
	--am_immediate&ldr&x"C"&x"0", --store x0006 in register C
	x"0000",
	--x"001F",								-- should be x0020 - x001f
	x"0000",
	--am_immediate&subr&x"E"&x"0", --change for jump instruction testing  FIX THE STORE ASAP. IT DOESN"T DO THAT -- Fixed. 
	x"0000",
	x"0000",
	x"0000",
	x"0000",
	x"0000",
	x"0000",
	x"0000",
	--am_immediate&sz&x"0"&x"0",  --Pc count should jump to x000D
	x"0000", 
	am_register&datacall&x"D"&x"E", --z flag should be raised here
	--am_immediate&subr&x"C"&x"0", --should give a zero and store in Ctherefore raising zero flag
	x"001F",
	am_immediate&datacall&x"0"&x"D", --should change from abcd -> whatever PC is. 
	--x"000E",
	--am_register&ssop&x"0"&x"C", --Output contents in register C throguh ssop
	--am_register&lsip&x"C"&x"0", --store contents in Sip in register C
	x"5F00",
	am_immediate&ldr&x"D"&x"0", --Store number x0000 into register D.
	x"0020",								
	am_immediate&ldr&x"E"&x"0"); --load number x0020 into register E (14th index in reg file)

begin
	-- process (clk)
	-- begin
		-- if rising_edge(clk) then
			-- if pm_rd = '1' then
				-- pm_data <= memory(to_integer(unsigned(pm_address)));
			-- end if;
			-- if dm_rd = '1' then
				-- dm_data <= memory(to_integer(unsigned(dm_address)));
			-- end if;
		-- end if;
	-- end process;
	process (clk)
	begin
		if falling_edge(clk) then
			if dm_wr = '1' then
				memory(to_integer(unsigned(dm_address)))<= dm_indata;  
			end if;
		end if;
	end process;
	
	process (clk)
	begin
		if falling_edge(clk) then
			pm_outdata <= memory(to_integer(unsigned(pm_address)));
			dm_outdata <= memory(to_integer(unsigned(dm_address))); --During execution stage of store instruction, there will be an instance of 1 clock cycle where it 
		end if;																	 	--first prints the original content within this address, then in writeback it updates. 
	end process;

	
end architecture beh;
