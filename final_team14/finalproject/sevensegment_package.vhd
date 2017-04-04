library ieee;
use ieee.std_logic_1164.all;
package sevensegment_package is
	component sevensegment
		port (
			input : in std_logic_vector (3 downto 0);
			enable : in std_logic;
			hex : out std_logic_vector (0 to 6)
		);
	end component;
end sevensegment_package;