LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE FullAdder_package IS

	COMPONENT FullAdder
		PORT (
        switch : IN STD_LOGIC; -- ???????
        
        x : IN STD_LOGIC; -- ???
        y : IN STD_LOGIC; -- ??
        
        sum : OUT STD_LOGIC; -- ?
        
        carry_in : IN STD_LOGIC; -- ????
        carry_out : OUT STD_LOGIC -- ????
		);
	END COMPONENT;
	
END FullAdder_package;