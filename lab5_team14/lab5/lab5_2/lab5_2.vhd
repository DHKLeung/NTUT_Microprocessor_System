library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity lab5_2 is
	generic (N : integer := 8);
	port (
		clk	: in std_logic;
		clear	: in std_logic;
		qo		: buffer std_logic_vector (N-1 downto 0)
	);
end lab5_2;
architecture content of lab5_2 is
begin
	process
	begin
		wait until clk'event and clk = '1';
		if (clear = '1') then
			qo <= (others => '0');
		else
			qo(n - 1) <= not qo(0);
			shift: for i in 0 to n - 2 loop
				qo(i) <= qo(i + 1);
			end loop;		
		end if;
	end process;
end content;