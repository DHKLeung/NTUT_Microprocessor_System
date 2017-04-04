LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.Adder16Bits_package.all;
USE work.FullAdder_package.all;

ENTITY Adder16Bits IS
    PORT (
        switch : IN STD_LOGIC;
        
        x : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        y : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        
        sum : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
        
        carry_in : IN STD_LOGIC;
        carry_out : OUT STD_LOGIC;
        sign : OUT STD_LOGIC
    );
END Adder16Bits;

ARCHITECTURE Func OF Adder16Bits IS
    SIGNAL carry : STD_LOGIC_VECTOR (16 DOWNTO 0);
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
        x => x(8),
        y => y(8),
        sum => sum(8),
        carry_in => carry(7),
        carry_out => carry(8),
        switch => switch
    );
	 
	 add9 : FullAdder PORT MAP (
        x => x(9),
        y => y(9),
        sum => sum(9),
        carry_in => carry(8),
        carry_out => carry(9),
        switch => switch
    );
	 
	 add10 : FullAdder PORT MAP (
        x => x(10),
        y => y(10),
        sum => sum(10),
        carry_in => carry(9),
        carry_out => carry(10),
        switch => switch
    );
	 
	 add11 : FullAdder PORT MAP (
        x => x(11),
        y => y(11),
        sum => sum(11),
        carry_in => carry(10),
        carry_out => carry(11),
        switch => switch
    );
	 
	 add12 : FullAdder PORT MAP (
        x => x(12),
        y => y(12),
        sum => sum(12),
        carry_in => carry(11),
        carry_out => carry(12),
        switch => switch
    );
	 
	 add13 : FullAdder PORT MAP (
        x => x(13),
        y => y(13),
        sum => sum(13),
        carry_in => carry(12),
        carry_out => carry(13),
        switch => switch
    );
	 
	 add14 : FullAdder PORT MAP (
        x => x(14),
        y => y(14),
        sum => sum(14),
        carry_in => carry(13),
        carry_out => carry(14),
        switch => switch
    );
	 
	 add15 : FullAdder PORT MAP (
        x => x(15),
        y => y(15),
        sum => sum(15),
        carry_in => carry(14),
        carry_out => carry(15),
        switch => switch
    );
	 
	 add16 : FullAdder PORT MAP (
        x => '0',
		  y => '1' AND switch,
		  sum => sum8,
		  carry_in => carry(15),
		  carry_out => carry(16),
		  switch => '0'
    );
    
    carry_out <= carry(15) AND (NOT switch);
    sign <= sum8 AND switch;
    
END Func;