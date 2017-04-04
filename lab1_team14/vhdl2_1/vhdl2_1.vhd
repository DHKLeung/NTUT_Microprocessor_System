LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY vhdl2_1 IS
PORT ( 
	W, X, Y, Z, sw4, sw5 : IN STD_LOGIC;
	HEX, HEX1, HEX2: OUT STD_LOGIC_VECTOR(0 TO 6)
);
END vhdl2_1;

ARCHITECTURE content OF vhdl2_1 IS
BEGIN
	HEX(0) <= ((((NOT W) AND (NOT X) AND (NOT Y) AND Z) OR
	          ((NOT W) AND X AND (NOT Y) AND (NOT Z)) OR
	          ((NOT W) AND X AND Y AND (NOT Z)) OR
	          (W AND (NOT X) AND Y AND Z) OR
	          (W AND X AND (NOT Y) AND (NOT Z)) OR
	          (W AND X AND (NOT Y) AND Z)) AND sw4);
	HEX(1) <= ((((NOT W) AND X AND (NOT Y) AND Z) OR
	          ((NOT W) AND X AND Y AND (NOT Z)) OR
	          (W AND (NOT X) AND Y AND Z) OR
	          (W AND X AND (NOT Y) AND (NOT Z)) OR
	          (W AND X AND Y AND (NOT Z)) OR
	          (W AND X AND Y AND Z)) AND sw4);
    HEX(2) <= ((((NOT W) AND (NOT X) AND Y AND (NOT Z)) OR
              (W AND X AND (NOT Z)) OR
              (W AND X AND Y)) AND sw4);
    HEX(3) <= ((((NOT X) AND (NOT Y) AND Z) OR
              ((NOT W) AND X AND (NOT Y) AND (NOT Z)) OR
              (X AND Y AND Z) OR
              (W AND (NOT X) AND Y AND (NOT Z))) AND sw4);
    HEX(4) <= ((((NOT W) AND Z) OR
              ((NOT W) AND X AND (NOT Y)) OR
              ((NOT X) AND (NOT Y) AND Z)) AND sw4);
    HEX(5) <= ((((NOT W) AND (NOT X) AND Z) OR
              ((NOT W) AND (NOT X) AND Y) OR
              ((NOT W) AND Y AND Z) OR
              (W AND X AND (NOT Y))) AND sw4);
    HEX(6) <= ((((NOT W) AND (NOT X) AND (NOT Y)) OR
              ((NOT W) AND X AND Y AND Z)) AND sw4);
              
    HEX1(0) <= sw5;
    HEX1(1) <= sw5;
	HEX1(2) <= sw5;
	HEX1(3) <= sw5;
	HEX1(4) <= sw5;
	HEX1(5) <= sw5;
	HEX1(6) <= sw5;
	
	HEX2(0) <= sw5;
    HEX2(1) <= sw5;
	HEX2(2) <= sw5;
	HEX2(5) <= sw5;
	HEX2(6) <= sw5;
END content;
