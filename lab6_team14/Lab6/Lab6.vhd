LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE WORK.components.ALL;

ENTITY Lab6 IS
	PORT (
		Data				: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		Resetn, w		: IN STD_LOGIC;
		Clock, Extern	: IN STD_LOGIC;
		RinExt			: IN STD_LOGIC_VECTOR(1 TO 3);
		BusWires			: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		StateA			: OUT STD_LOGIC;
		StateB			: OUT STD_LOGIC;
		StateC			: OUT STD_LOGIC;
		StateD			: OUT STD_LOGIC;
		Show_R1			: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		Show_R2			: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		Show_R3			: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END Lab6;

ARCHITECTURE Behavior OF Lab6 IS
	TYPE state_type IS (A, B, C, D);
	SIGNAL state : state_type := A;

	SIGNAL Rin, Rout, Q	: STD_LOGIC_VECTOR(1 TO 3);
	SIGNAL R1, R2, R3		: STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
	PROCESS
	BEGIN
		WAIT UNTIL Clock'EVENT AND Clock = '0';
		IF Resetn = '1' THEN
			state <= A;
		ELSE
			CASE state IS
				WHEN A => 
					IF w='1' THEN 
						state <= B;
					END IF;
				WHEN B =>
					state <= C;
				WHEN C =>
					state <= D;
				WHEN D =>
					state <= A;
				WHEN OTHERS =>
					state <= A;
			END CASE;
		END IF;
	END PROCESS;
	
	StateA <= '1' WHEN state = A ELSE '0';
	StateB <= '1' WHEN state = B ELSE '0';
	StateC <= '1' WHEN state = C ELSE '0';
	StateD <= '1' WHEN state = D ELSE '0';
	
	
	Rin(1) <=	RinExt(1) WHEN state = A ELSE
					'1' WHEN state = D ELSE '0';
	Rin(2) <=	RinExt(2) AND (NOT Rin(1)) WHEN state = A ELSE
					'1' WHEN state = C ELSE '0';
	Rin(3) <=	RinExt(3) AND (NOT Rin(1)) AND (NOT Rin(2)) WHEN state = A ELSE
					'1' WHEN state = B ELSE '0';
	Rout(1) <=	'1' WHEN state = C ELSE '0';
	Rout(2) <=	'1' WHEN state = B ELSE '0';
	Rout(3) <=	'1' WHEN state = D ELSE '0';
	
--	Rin(1) <= RinExt(1);
--	Rin(2) <= RinExt(2) AND (NOT Rin(1));
--	Rin(3) <= RinExt(3) AND (NOT Rin(1)) AND (NOT Rin(2));
--	Rout(1) <= '0';
--	Rout(2) <= '0';
--	Rout(3) <= '0';
	
	tri_ext : trin PORT MAP(Data, Extern, BusWires);
	reg1 : regn PORT MAP(BusWires, Rin(1), Clock, R1);
	reg2 : regn PORT MAP(BusWires, Rin(2), Clock, R2);
	reg3 : regn PORT MAP(BusWires, Rin(3), Clock, R3);
	tri1 : trin PORT MAP(R1, Rout(1), BusWires);
	tri2 : trin PORT MAP(R2, Rout(2), BusWires);
	tri3 : trin PORT MAP(R3, Rout(3), BusWires);
	
	Show_R1 <= R1;
	Show_R2 <= R2;
	Show_R3 <= R3;
END Behavior;