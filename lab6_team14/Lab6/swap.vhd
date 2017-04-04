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
		StateD			: OUT STD_LOGIC
	);
END Lab6;

ARCHITECTURE Behavior OF Lab6 IS
	SIGNAL Rin, Rout, Q	: STD_LOGIC_VECTOR(1 TO 3);
	SIGNAL R1, R2, R3		: STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
	Rin(1) <= RinExt(1);
	Rin(2) <= RinExt(2) AND (NOT Rin(1));
	Rin(3) <= RinExt(3) AND (NOT Rin(1)) AND (NOT Rin(2));
	
	
	tri_ext : trin PORT MAP(Data, Extern, BusWires);
	
END Behavior;