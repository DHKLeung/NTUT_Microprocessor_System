LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.BCDAdder_package.all;
USE work.SevenSegment_package.all;

ENTITY vhdl_3 IS
    PORT (
        display_sum0, display_sum1, display_sum2 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
        display_x0, display_x1 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
        display_y0, display_y1 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
        
        x, y : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        switch : IN STD_LOGIC
    );
END vhdl_3;

ARCHITECTURE Func OF vhdl_3 IS
    SIGNAL bcd0_sum : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL bcd0_carry : STD_LOGIC;
    SIGNAL bcd0_borrow : STD_LOGIC;
    SIGNAL bcd1_sum_buffer : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL bcd1_sum : STD_LOGIC_VECTOR (3 DOWNTO 0);
    SIGNAL bcd1_carry : STD_LOGIC;
BEGIN
    add_bcd0 : BCDAdder PORT MAP (
        x => x(3 DOWNTO 0),
        y => y(3 DOWNTO 0),
        sum => bcd0_sum,
        carry_in => '0',
        carry_out => bcd0_carry,
        sign => bcd0_borrow,
		  switch => switch
    );
    
    add_bcd1 : BCDAdder PORT MAP (
        x => x(7 DOWNTO 4),
        y => y(7 DOWNTO 4),
        sum => bcd1_sum_buffer,
        carry_in => bcd0_carry,
        carry_out => bcd1_carry,
		  switch => switch
    );
    
    sub_borrow_bcd : BCDAdder PORT MAP (
        x => bcd1_sum_buffer,
        y => ('0' & '0' & '0' & ('1' AND bcd0_borrow)),
        sum => bcd1_sum,
        carry_in => '0',
        switch => ('1' AND bcd0_borrow)
    );
    
    show_sum0 : SevenSegment PORT MAP (
        input => bcd0_sum,
        output => display_sum0
    );
    
    show_sum1 : SevenSegment PORT MAP (
        input => bcd1_sum,
        output => display_sum1
    );
    
    show_sum2 : SevenSegment PORT MAP (
        input => '0' & '0' & '0' & bcd1_carry,
        output => display_sum2
    );
    
    show_x0 : SevenSegment PORT MAP (
        input => x(3 DOWNTO 0),
        output => display_x0
    );
    
    show_x1 : SevenSegment PORT MAP (
        input => x(7 DOWNTO 4),
        output => display_x1
    );
    
    show_y0 : SevenSegment PORT MAP (
        input => y(3 DOWNTO 0),
        output => display_y0
    );
    
    show_y1 : SevenSegment PORT MAP (
        input => y(7 DOWNTO 4),
        output => display_y1
    );
END func;