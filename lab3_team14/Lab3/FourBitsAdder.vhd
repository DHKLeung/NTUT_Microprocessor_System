LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.FourBitsAdder_package.all;
USE work.FullAdder_package.all;

ENTITY FourBitsAdder IS
    PORT (
        switch : IN STD_LOGIC;
        
        x : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        y : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        
        sum : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        
        carry_in : IN STD_LOGIC;
        carry_out : OUT STD_LOGIC;
        sign : OUT STD_LOGIC
    );
END FourBitsAdder;

ARCHITECTURE Func OF FourBitsAdder IS
    SIGNAL carry : STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL sum4 : STD_LOGIC;
BEGIN
        
    add0 : FullAdder PORT MAP (
        x => x(0),
        y => y(0),
        sum => sum(0),
        carry_in => carry_in OR switch,
        carry_out => carry(0),
        switch => switch
    );
    
    add1 : FullAdder PORT MAP (
        x => x(1),
        y => y(1),
        sum => sum(1),
        carry_in => carry(0),
        carry_out => carry(1),
        switch => switch
    );
    
    add2 : FullAdder PORT MAP (
        x => x(2),
        y => y(2),
        sum => sum(2),
        carry_in => carry(1),
        carry_out => carry(2),
        switch => switch
    );
    
    add3 : FullAdder PORT MAP (
        x => x(3),
        y => y(3),
        sum => sum(3),
        carry_in => carry(2),
        carry_out => carry(3),
        switch => switch
    );
	 
	 add4 : FullAdder PORT MAP (
	     x => '0',
		  y => '1' AND switch,
		  sum => sum4,
		  carry_in => carry(3),
		  carry_out => carry(4),
		  switch => '0'
	 );
    
    carry_out <= carry(3) AND (NOT switch);
    sign <= sum4 AND switch;
    
END Func;