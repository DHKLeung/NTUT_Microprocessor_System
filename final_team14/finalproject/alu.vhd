library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
entity alu is
    port (
		opcode : in std_logic_vector (5 downto 0);
		reg1content : in std_logic_vector (7 downto 0);
		reg2content : in std_logic_vector (7 downto 0);
		returnvalue : out std_logic_vector (7 downto 0)
	);
end alu;
architecture angela of alu is
signal multiresult : std_logic_vector (15 downto 0);
begin
	process (opcode, reg1content, reg2content)
	begin
		case opcode is
			when "100001" =>
				returnvalue <= reg2content;
			when "100010" =>
				returnvalue <= std_logic_vector(unsigned(reg1content) + unsigned(reg2content));
			when "100011" =>
				returnvalue <= std_logic_vector(unsigned(reg1content) - unsigned(reg2content));
			when "100110" =>
				returnvalue <= std_logic_vector(unsigned(reg1content) / unsigned(reg2content));
			when "101011" =>
				returnvalue <= std_logic_vector(unsigned(reg1content) and unsigned(reg2content));
			when "101100" =>
				returnvalue <= std_logic_vector(unsigned(reg1content) or unsigned(reg2content));
			when "101110" =>
				returnvalue <= std_logic_vector(unsigned(reg1content) nor unsigned(reg2content));
			when "110000" =>
				if (unsigned(reg1content) > unsigned(reg2content)) then
					returnvalue <= "00000000";
				else
					returnvalue <= "00000001";
				end if;
			when "100100" =>
				multiresult <= std_logic_vector(unsigned(reg1content) * unsigned(reg2content));
				returnvalue <= multiresult(7 downto 0);
			when others =>
				returnvalue <= "00000000";
		end case;
	end process;
end angela;
