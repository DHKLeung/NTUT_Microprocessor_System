LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE FourBitsAdder_package IS

	COMPONENT FourBitsAdder
		PORT (
        switch : IN STD_LOGIC; -- ???????
        
        x : IN STD_LOGIC_VECTOR (3 DOWNTO 0); -- 4?????
        y : IN STD_LOGIC_VECTOR (3 DOWNTO 0); -- 4????
        
        sum : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); -- 4???
        
        carry_in : IN STD_LOGIC; -- ????
        carry_out : OUT STD_LOGIC; -- ????
        sign : OUT STD_LOGIC -- ????
		);
	END COMPONENT;
	
END FourBitsAdder_package;