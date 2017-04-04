LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.BCDAdder_package.all;
USE work.FourBitsAdder_package.all;

ENTITY BCDAdder IS
	PORT(
        switch : IN STD_LOGIC;
        
        x : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        y : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        
        sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        
        carry_in : IN STD_LOGIC;
        carry_out : OUT STD_LOGIC;
		
        sign : OUT STD_LOGIC
	);
END BCDAdder;

ARCHITECTURE Func_BCDAdder OF BCDAdder IS
    SIGNAL sum_temp : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL sum_temp2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL sum_temp3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL carry_out_temp : STD_LOGIC;
    SIGNAL bcd_overflow : STD_LOGIC;
    SIGNAL nagative : STD_LOGIC;
	 SIGNAL sub_borrow : STD_LOGIC;
BEGIN

    add0 : FourBitsAdder PORT MAP (
        x => x,
        y => y,
        sum => sum_temp,
        carry_in => carry_in,
        carry_out => carry_out_temp,
        sign => sub_borrow,
        switch => switch
    );
    
    bcd_overflow <= (
                        NOT switch
                    ) AND (
                        carry_out_temp OR (
                            sum_temp(3) AND (sum_temp(1) OR sum_temp(2))
                        )
                    );
    carry_out <= (NOT switch) AND bcd_overflow;
    
    handle_bcd_overflow : FourBitsAdder PORT MAP (
        x => sum_temp,
        y => '0' & ('1' AND bcd_overflow) & ('1' AND bcd_overflow) & '0',
        sum => sum_temp2,
        carry_in => '0',
        switch => '0'
    );

	 
    nagative <= (switch AND sub_borrow);
    
    do_two_complement : FourBitsAdder PORT MAP (
        x => '0' & '0' & '0' & '0',
        y => sum_temp2,
        sum => sum_temp3,
        carry_in => '0',
        switch => nagative
    );
    
    sub_by_ten : FourBitsAdder PORT MAP (
        x =>('1' AND nagative) & '0' & ('1' AND nagative) & '0',
        y => sum_temp3,
        sum => sum,
        carry_in => '0',
        switch => ('1' AND nagative)
    );
    
    sign <= switch AND nagative;
END Func_BCDAdder;