--GROUP_14--
--104360098--104590048
--9/23/2016 (MM/DD/YYYY)--

LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY vhdl1_1 IS
	PORT (x1, x2, x3, x4 : IN BIT;
			f, g			: OUT BIT);
END vhdl1_1;

ARCHITECTURE LogicFunc OF vhdl1_1 IS
BEGIN
	f <= (x1 AND x3) OR (NOT x3 AND x2);
	g <= (NOT x3 OR x1) AND (NOT x3 OR x4);
END LogicFunc;