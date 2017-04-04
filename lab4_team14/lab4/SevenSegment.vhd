LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.SevenSegment_package.all;

ENTITY SevenSegment IS
	PORT (
		input	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		output : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END SevenSegment;

ARCHITECTURE func OF SevenSegment IS
BEGIN
	output(0) <= ((((NOT input(3)) AND (NOT input(2)) AND (NOT input(1)) AND input(0)) OR
	          ((NOT input(3)) AND input(2) AND (NOT input(1)) AND (NOT input(0))) OR
	          ((NOT input(3)) AND input(2) AND input(1) AND (NOT input(0))) OR
	          (input(3) AND (NOT input(2)) AND input(1) AND input(0)) OR
	          (input(3) AND input(2) AND (NOT input(1)) AND (NOT input(0))) OR
	          (input(3) AND input(2) AND (NOT input(1)) AND input(0))));
	output(1) <= ((((NOT input(3)) AND input(2) AND (NOT input(1)) AND input(0)) OR
	          ((NOT input(3)) AND input(2) AND input(1) AND (NOT input(0))) OR
	          (input(3) AND (NOT input(2)) AND input(1) AND input(0)) OR
	          (input(3) AND input(2) AND (NOT input(1)) AND (NOT input(0))) OR
	          (input(3) AND input(2) AND input(1) AND (NOT input(0))) OR
	          (input(3) AND input(2) AND input(1) AND input(0))));
	output(2) <= ((((NOT input(3)) AND (NOT input(2)) AND input(1) AND (NOT input(0))) OR
              (input(3) AND input(2) AND (NOT input(0))) OR
              (input(3) AND input(2) AND input(1))));
    output(3) <= ((((NOT input(2)) AND (NOT input(1)) AND input(0)) OR
              ((NOT input(3)) AND input(2) AND (NOT input(1)) AND (NOT input(0))) OR
              (input(2) AND input(1) AND input(0)) OR
              (input(3) AND (NOT input(2)) AND input(1) AND (NOT input(0)))));
    output(4) <= ((((NOT input(3)) AND input(0)) OR
              ((NOT input(3)) AND input(2) AND (NOT input(1))) OR
              ((NOT input(2)) AND (NOT input(1)) AND input(0))));
    output(5) <= ((((NOT input(3)) AND (NOT input(2)) AND input(0)) OR
              ((NOT input(3)) AND (NOT input(2)) AND input(1)) OR
              ((NOT input(3)) AND input(1) AND input(0)) OR
              (input(3) AND input(2) AND (NOT input(1)))));
    output(6) <= ((((NOT input(3)) AND (NOT input(2)) AND (NOT input(1))) OR
              ((NOT input(3)) AND input(2) AND input(1) AND input(0))));
END func;