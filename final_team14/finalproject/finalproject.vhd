library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.sevensegment_package.all;
use work.alu_package.all;
use work.BinToBCD_package.all;
use work.pushButtonDebounce_package.all;
entity finalproject is
	port (
		input : in std_logic_vector (7 downto 0);
		clockInput , reset: in std_logic;
		opcodeOutputTens : out std_logic_vector (0 to 6);
		opcodeOutputOnes : out std_logic_vector (0 to 6);
		reg1OutputTens : out std_logic_vector (0 to 6);
		reg1OutputOnes : out std_logic_vector (0 to 6);
		reg1valueOutputHundreds : out std_logic_vector(0 to 6);
		reg1valueOutputTens : out std_logic_vector(0 to 6);
		reg1valueOutputOnes : out std_logic_vector(0 to 6);	
		clockForDebounce : in std_logic
	);
end finalproject;
architecture angela of finalproject is		--angela was the girl who i firstly fell in love with
	type theRegisters is array (0 to 63) of std_logic_vector (7 downto 0);	--define the amount of 64 registers of 8 bits
	signal registers : theRegisters;	
	type theState is (A, B, Bhalf, C, Chalf, D, E);	--define the state machine's state
	signal state : theState := A;
	signal opcode : std_logic_vector(5 downto 0);	--inputted opcode
	signal reg1code : std_logic_vector (5 downto 0);	--inputted register1's code
	signal reg2code : std_logic_vector (5 downto 0);	--inputted register2's code
	signal data : std_logic_vector (7 downto 0);	--inputted data if the opcode is "load"
	signal returnvalue : std_logic_vector (7 downto 0);	--the return value from ALU
	signal reg1index : integer := 0;	--the index of the first register
	signal reg2index : integer := 0;	--the index of the second register
	signal reg1value : std_logic_vector (7 downto 0);	--temp to store the reg1's value
	signal reg2value : std_logic_vector (7 downto 0);	--temp to store the reg2's value
	signal opcodeOutputTensBCD : std_logic_vector (3 downto 0);
	signal opcodeOutputOnesBCD : std_logic_vector (3 downto 0);
	signal reg1OutputTensBCD : std_logic_vector (3 downto 0);
	signal reg1OutputOnesBCD : std_logic_vector (3 downto 0);
	signal reg1valueOutputHundredsBCD : std_logic_vector(3 downto 0);
	signal reg1valueOutputTensBCD : std_logic_vector (3 downto 0);
	signal reg1valueOutputOnesBCD : std_logic_vector (3 downto 0);
	signal garbage1 : std_logic_vector(3 downto 0);
	signal garbage2 : std_logic_vector(3 downto 0);
	signal clock : std_logic;
begin 
	debounce : pushButtonDebounce port map (
		DATA => (not clockInput),
		CLK => clockForDebounce,
		OP_DATA => clock
	);
	aalu:alu port map (
		opcode, reg1value, reg2value, returnvalue
	);
	process (reset, clock, input, reg1code, reg2code, data, returnvalue)
	begin
		if (reset = '1') then
			state <= A;
			opcode <= "000000";
			reg1code <= "000000";
		elsif (clock'event and clock = '1') then
			case state is
				when A =>	--receive opcode
					opcode <= input(5 downto 0);
					state <= B;
				when B =>	--receive the first register's code
					reg1code <= input(5 downto 0);		
					state <= Bhalf;
				when Bhalf =>
					reg1index <= to_integer(unsigned(reg1code));
					state <= C;
				when C =>	--receive the second register's code / receive the data to be inserted to the first register
					if (opcode = "100000") then
						registers(reg1index) <= input;	--load data to the register(reg1index)		
						state <= A;
					else					
						reg2code <= input(5 downto 0);
						state <= Chalf;
					end if;
				when Chalf =>
					reg2index <= to_integer(unsigned(reg2code));
					state <= D;
				when D =>	--ALU process
					reg1value <= registers(reg1index);
					reg2value <= registers(reg2index);
					state <= E;
				when E =>	--return the value to the register
					registers(reg1index) <= returnvalue;
					state <= A;
			end case;
		end if;
	end process;
	-- opcode
	comOpcodeOutputBCD : BinToBCD port map (
		number => "00" & opcode,
		hundreds => garbage1,
		tens => opcodeOutputTensBCD,
		ones => opcodeOutputOnesBCD
	);
	comOpcodeOutputOnes : sevensegment port map (
		input => opcodeOutputOnesBCD,
		enable => '1',
		hex => opcodeOutputOnes
	);	
	comOpcodeOutputTens : sevensegment port map (
		input => opcodeOutputTensBCD,
		enable => '1',
		hex => opcodeOutputTens
	);	
	-- reg1 code
	comReg1OutputBCD : BinToBCD port map (
		number => "00" & reg1code,
		hundreds => garbage2,
		tens => reg1OutputTensBCD,
		ones => reg1OutputOnesBCD
	);
	comReg1OutputOnes : sevensegment port map (
		input => reg1OutputOnesBCD,
		enable => '1',
		hex => reg1OutputOnes
	);
	comReg1OutputTens : sevensegment port map (
		input => reg1OutputTensBCD,
		enable => '1',
		hex => reg1OutputTens
	);	
	-- reg1 output to hex
	comReg1valueOutputBCD : BinToBCD port map (
		number => registers(reg1index),
		hundreds => reg1valueOutputHundredsBCD,
		tens => reg1valueOutputTensBCD,
		ones => reg1valueOutputOnesBCD
	);
	comReg1valueOutputOnes : sevensegment port map (
		input => reg1valueOutputOnesBCD,
		enable => '1',
		hex => reg1valueOutputOnes
	);
	comReg1valueOutputTens : sevensegment port map (
		input => reg1valueOutputTensBCD,
		enable => '1',
		hex => reg1valueOutputTens
	);	
	comReg1valueOutputHundreds : sevensegment port map (
		input => reg1valueOutputHundredsBCD,
		enable => '1',
		hex => reg1valueOutputHundreds
	);	
end angela;