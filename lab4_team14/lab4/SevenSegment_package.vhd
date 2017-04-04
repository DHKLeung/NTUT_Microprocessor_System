LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE SevenSegment_package IS
	COMPONENT SevenSegment
		PORT (
			input	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			output : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
		);
	END COMPONENT;
END SevenSegment_package;