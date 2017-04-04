LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.FullAdder_package.all;
USE work.multi_package.all;

ENTITY multi IS
	PORT (
		m, q, cin, ppin: IN STD_LOGIC;
		cout, ppout: OUT STD_LOGIC
	);
END multi;

ARCHITECTURE content OF multi IS
SIGNAL mqand : STD_LOGIC;
BEGIN
	mqand <= m AND q;
	stage0 : FullAdder PORT MAP (
		x => mqand, y => ppin, sum => ppout, 
		carry_in => cin, carry_out => cout, 
		switch => '0'
	);
END content;