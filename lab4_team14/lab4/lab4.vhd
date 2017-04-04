LIBRARY ieee;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
USE work.multi_package.all;
USE work.BinToBCD_package.all;
USE work.SevenSegment_package.all;
USE work.Adder16Bits_package.all;

ENTITY lab4 IS
    PORT (
        m : IN STD_LOGIC_VECTOR (7 downto 0);
		  q : IN STD_LOGIC_VECTOR (7 downto 0);
		  m_sign : IN STD_LOGIC;
		  q_sign : IN STD_LOGIC;
		  
		  hex_ones : OUT STD_LOGIC_VECTOR (6 downto 0);
		  hex_tens : OUT STD_LOGIC_VECTOR (6 downto 0);
		  hex_hundreds : OUT STD_LOGIC_VECTOR (6 downto 0);
		  hex_thousands : OUT STD_LOGIC_VECTOR (6 downto 0);
		  hex_ten_thousands : OUT STD_LOGIC_VECTOR (6 downto 0);
		  
		  led : OUT STD_LOGIC_VECTOR (16 DOWNTO 0);
		  
		  sign : OUT STD_LOGIC
    );
END lab4;
ARCHITECTURE content OF lab4 IS
SIGNAL pp : STD_LOGIC_VECTOR(63 downto 0);
SIGNAL cc : STD_LOGIC_VECTOR(63 downto 0);
SIGNAL output : STD_LOGIC_VECTOR(15 downto 0);
SIGNAL total : INTEGER;

SIGNAL ten_thousands : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL thousands : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL hundreds : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL tens : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL ones : STD_LOGIC_VECTOR(3 downto 0);

SIGNAL sign_bits : STD_LOGIC;
SIGNAL carry_out_bits : STD_LOGIC;

BEGIN	
	PPscol0row0:multi PORT MAP(		-- Element of Row0Column0
		m => m(0), q => q(0), cin => '0',
		ppin => '0', cout => cc(0),
		ppout => pp(0)
	);
	X01:FOR w IN 1 TO 7 GENERATE	-- First Column
		PP01:multi PORT MAP(
			m => m(0), q => q(w), cin => '0',
			ppin => pp(w * 8 - 7), cout => cc(w * 8),
			ppout => pp(w * 8)
	);
	END GENERATE X01;
	X00:FOR k IN 1 TO 7 GENERATE	-- First Row
		PPs0:multi PORT MAP(	
			m => m(k), q => q(0), cin => cc(k - 1),
			ppin => '0', cout => cc(k),
			ppout => pp(k)
	);
	END GENERATE X00;
	XXX:FOR i IN 1 TO 7 GENERATE	-- All except First Row and First Column
		YYY:FOR j IN 1 TO 6 GENERATE
			PPs:multi PORT MAP(
				m => m(j), q => q(i), cin => cc(i * 8 + (j - 1)),
				ppin => pp(((i - 1) * 8) + j + 1), cout => cc((i * 8) + j),
				ppout => pp(i * 8 + j)
			);
		END GENERATE YYY;
	END GENERATE XXX;
	LASTCOL:FOR i IN 1 TO 7 GENERATE	--The last column
		PPlastCol:multi PORT MAP(
			m => m(7), q => q(i), cin => cc(6 + i * 8),
			ppin => cc(7 + (i - 1) * 8), cout => cc(7 + i * 8),
			ppout => pp(7 + i * 8)
		);
	END GENERATE LASTCOL;
	CONNECTCOL:FOR i IN 0 TO 7 GENERATE	--connectCOL
		output(i) <= pp(i * 8);
	END GENERATE CONNECTCOL;
	CONNECTROW:FOR i IN 0 TO 6 GENERATE -- connectROW
		output(8 + i) <= pp(57 + i);
	END GENERATE CONNECTROW;
	output(15) <= cc(63);	--final bit

			
	Convert16BitsToBcd : BinToBCD PORT MAP(
		number => output,
      ten_thousands => ten_thousands,
      thousands => thousands,
      hundreds => hundreds,
      tens => tens,
      ones => ones
	);
	
	output_ones : SevenSegment PORT MAP(
		input => ones,
		output => hex_ones
	);
	
	output_tens : SevenSegment PORT MAP(
		input => tens,
		output => hex_tens
	);
	
	output_hundreds : SevenSegment PORT MAP(
		input => hundreds,
		output => hex_hundreds
	);
	
	output_thousands : SevenSegment PORT MAP(
		input => thousands,
		output => hex_thousands
	);
	
	output_ten_thousands : SevenSegment PORT MAP(
		input => ten_thousands,
		output => hex_ten_thousands
	);
	
	
	output_bits : Adder16Bits PORT MAP (
		switch => m_sign XOR q_sign,
		x => (15 DOWNTO 0 => '0'),
		y => output(15 DOWNTO 0),
		sum => led(15 DOWNTO 0),
		carry_in => '0',
		carry_out => carry_out_bits,
		sign => sign_bits
	);
	
	
	sign <= NOT (m_sign XOR q_sign);
	led(16) <= m_sign XOR q_sign;
	

END content;
