library ieee;
use ieee.std_logic_1164.all;
package pushButtonDebounce_package is
	component pushButtonDebounce
		Port (
			DATA: in std_logic;
			CLK : in std_logic;
			OP_DATA : out std_logic
		);
	end component;
end pushButtonDebounce_package;