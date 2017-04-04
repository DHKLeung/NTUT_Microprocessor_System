library ieee;
use ieee.std_logic_1164.all;
package alu_package is
	component alu
		 port (
			opcode : in std_logic_vector (5 downto 0);
			reg1content : in std_logic_vector (7 downto 0);
			reg2content : in std_logic_vector (7 downto 0);
			returnvalue : out std_logic_vector (7 downto 0)
		);
	end component;
end alu_package;