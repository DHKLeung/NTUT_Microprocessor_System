library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity lab5 is
	generic (N : integer := 8);
	port (
		clk	: in std_logic;
		clear	: in std_logic;
		load	: in std_logic;
		lr_sel	: in std_logic;
		di		: in std_logic_vector (N-1 downto 0);
		sdi	: in std_logic;
		qo		: buffer std_logic_vector (N-1 downto 0)
	);
end lab5;
architecture content of lab5 is
begin
	process
	begin
		wait until clk'event and clk = '1';
		if (clear = '1') then
			qo <= (others => '0');
		elsif (load = '1') then
			qo <= di;
		elsif (lr_sel = '0') then
			leftshift: for i in 0 to n - 2 loop
				qo(i) <= qo(i + 1);
			end loop;
			qo(n - 1) <= sdi;
		elsif (lr_sel = '1') then
			rightshift: for i in n - 1 downto 1 loop
				qo(i) <= qo(i - 1);
			end loop;	
			qo(0) <= sdi;		
		end if;
	end process;
end content;