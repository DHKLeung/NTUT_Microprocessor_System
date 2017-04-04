LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY Lab2 IS
	PORT(
		x0, x1, x2, x3 : IN STD_LOGIC;
		y0, y1, y2, y3 : IN STD_LOGIC;
		S0, S1, S2, S3 : OUT STD_LOGIC;
		SW : IN STD_LOGIC
	);
END Lab2;

ARCHITECTURE Lab2_content OF Lab2 IS
SIGNAL
	C0, C1, C2, C3 : STD_LOGIC;
BEGIN
	C0 <= SW;
	
	S0 <= x0 XOR (y0 XOR SW) XOR C0;
	C1 <= (x0 AND (y0 XOR SW)) OR (x0 AND C0) OR ((y0 XOR SW) AND C0);
	
	S1 <= x1 XOR (y1 XOR SW) XOR C1;
	C2 <= (x1 AND (y1 XOR SW)) OR (x1 AND C1) OR ((y1 XOR SW) AND C1);
	
	S2 <= x2 XOR (y2 XOR SW) XOR C2;
	C3 <= (x2 AND (y2 XOR SW)) OR (x2 AND C2) OR ((y2 XOR SW) AND C2);
	
	S3 <= x3 XOR (y3 XOR SW) XOR C3;
	
END Lab2_content;