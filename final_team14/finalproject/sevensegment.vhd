library ieee;
use ieee.std_logic_1164.all;
entity sevensegment is
    port (
		input : in std_logic_vector (3 downto 0);
		enable : in std_logic;
		hex : out std_logic_vector (0 to 6)
	);
end sevensegment;
architecture content of sevensegment is
signal enainput : std_logic_vector (4 downto 0);
begin
	enainput <= enable & input;
	with enainput select
		hex <= "0000001" when "10000",
			   "1001111" when "10001",
			   "0010010" when "10010",
			   "0000110" when "10011",
			   "1001100" when "10100",
			   "0100100" when "10101",
			   "0100000" when "10110",
			   "0001111" when "10111",
			   "0000000" when "11000",
			   "0000100" when "11001",
			   "0001000" when "11010",
			   "1100000" when "11011",
			   "0110001" when "11100",
			   "1000010" when "11101",
			   "0110000" when "11110",
			   "0111000" when "11111", 
			   "1111111" when others;
end content;