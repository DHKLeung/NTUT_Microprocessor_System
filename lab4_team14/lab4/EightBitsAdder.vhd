LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.EightBitsAdder_package.all;
USE work.FullAdder_package.all;

ENTITY EightBitsAdder IS
    PORT (
        switch : IN STD_LOGIC;
        
        x : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        y : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        
        sum : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        
        carry_in : IN STD_LOGIC;
        carry_out : OUT STD_LOGIC;
        sign : OUT STD_LOGIC
    );
END EightBitsAdder;

ARCHITECTURE Func OF EightBitsAdder IS
    SIGNAL carry : STD_LOGIC_VECTOR (8 DOWNTO 0);
	 SIGNAL sum8 : STD_LOGIC;
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
	     x => x(4),
        y => y(4),
        sum => sum(4),
        carry_in => carry(3),
        carry_out => carry(4),
        switch => switch
	 );
	 
	 add5 : FullAdder PORT MAP (
        x => x(5),
        y => y(5),
        sum => sum(5),
        carry_in => carry(4),
        carry_out => carry(5),
        switch => switch
    );
	 
	 add6 : FullAdder PORT MAP (
        x => x(6),
        y => y(6),
        sum => sum(6),
        carry_in => carry(5),
        carry_out => carry(6),
        switch => switch
    );
	 
	 add7 : FullAdder PORT MAP (
        x => x(7),
        y => y(7),
        sum => sum(7),
        carry_in => carry(6),
        carry_out => carry(7),
        switch => switch
    );
	 
	 add8 : FullAdder PORT MAP (
        x => '0',
		  y => '1' AND switch,
		  sum => sum8,
		  carry_in => carry(7),
		  carry_out => carry(8),
		  switch => '0'
    );
    
    carry_out <= carry(7) AND (NOT switch);
    sign <= sum8 AND switch;
    
END Func;