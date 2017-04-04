LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE multi_package IS
	COMPONENT multi
		PORT (
			m, q, cin, ppin: IN STD_LOGIC;
			cout, ppout: OUT STD_LOGIC
		);
	END COMPONENT;
END multi_package;