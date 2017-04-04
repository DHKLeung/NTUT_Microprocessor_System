LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE Adder16Bits_package IS

	COMPONENT Adder16Bits
		PORT (
        switch : IN STD_LOGIC;
        
        x : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        y : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        
        sum : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
        
        carry_in : IN STD_LOGIC;
        carry_out : OUT STD_LOGIC;
        sign : OUT STD_LOGIC
		);
	END COMPONENT;
	
END Adder16Bits_package;