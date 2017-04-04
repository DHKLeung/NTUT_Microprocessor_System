LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE BinToBCD_package IS

	COMPONENT BinToBCD
		Port ( 
			number   : in  STD_LOGIC_VECTOR (15 DOWNTO 0);
			ten_thousands : out STD_LOGIC_VECTOR(3 DOWNTO 0);
			thousands : out STD_LOGIC_VECTOR(3 DOWNTO 0);
			hundreds : out STD_LOGIC_VECTOR (3 DOWNTO 0);
			tens     : out STD_LOGIC_VECTOR (3 DOWNTO 0);
			ones     : out STD_LOGIC_VECTOR (3 DOWNTO 0)
		);
	END COMPONENT;
	
END BinToBCD_package;