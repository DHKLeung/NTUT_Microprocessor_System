LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.FullAdder_package.all;

ENTITY FullAdder IS
    PORT (
        switch : IN STD_LOGIC;
        
        x : IN STD_LOGIC;
        y : IN STD_LOGIC;
        
        sum : OUT STD_LOGIC;
        
        carry_in : IN STD_LOGIC;
        carry_out : OUT STD_LOGIC
    );
END FullAdder;

ARCHITECTURE Func OF FullAdder IS
BEGIN
    
    sum <= x XOR (y XOR switch) XOR carry_in;
	 carry_out <= (x AND (y XOR switch)) OR (x AND carry_in) OR ((y XOR switch) AND carry_in);
    
END Func;