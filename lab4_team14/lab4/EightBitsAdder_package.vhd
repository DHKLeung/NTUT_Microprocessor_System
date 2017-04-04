LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE EightBitsAdder_package IS

	COMPONENT EightBitsAdder
		PORT (
        switch : IN STD_LOGIC;
        
        x : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        y : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        
        sum : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        
        carry_in : IN STD_LOGIC;
        carry_out : OUT STD_LOGIC;
        sign : OUT STD_LOGIC
		);
	END COMPONENT;
	
END EightBitsAdder_package;