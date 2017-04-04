LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE WORK.components.trin;

ENTITY trin IS
	GENERIC (
		N : INTEGER := 8
	);
	PORT (
		X : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		E : IN STD_LOGIC;
		F : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
	);
END trin;

ARCHITECTURE Behavior OF trin IS
BEGIN
	PROCESS(E, X)
	BEGIN
		IF E = '1' THEN
			F <= X;
		else
			FOR i IN N-1 DOWNTO 0 LOOP
				F(i) <= 'Z';
			END LOOP;
			-- F <= "ZZZZZZZZ";
		END IF;
	END PROCESS;
END Behavior;