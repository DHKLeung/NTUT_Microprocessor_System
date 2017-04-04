LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.BinToBCD_package.all;

entity BinToBCD is
   Port ( 
      number   : in  STD_LOGIC_VECTOR (7 DOWNTO 0);
      hundreds : out STD_LOGIC_VECTOR (3 DOWNTO 0);
      tens     : out STD_LOGIC_VECTOR (3 DOWNTO 0);
      ones     : out STD_LOGIC_VECTOR (3 DOWNTO 0)
   );
end BinToBCD;

architecture Behavioral of BinToBCD is

begin

   bin_to_bcd : process (number)
      -- Internal variable for storing bits
      variable shift : unsigned(19 DOWNTO 0);
      
      -- ALIAS for parts of shift register
      ALIAS s_number is shift(7 DOWNTO 0);
      ALIAS s_ones is shift(11 DOWNTO 8);
      ALIAS s_tens is shift(15 DOWNTO 12);
      ALIAS s_hundreds is shift(19 DOWNTO 16);
   begin
      -- Clear previous number and store new number in shift register
      s_number := unsigned(number);
      s_ones := X"0";
      s_tens := X"0";
      s_hundreds := X"0";
      
      -- Loop eight times
      for i in 1 to s_number'Length loop
         -- Check if any digit is greater than or equal to 5
         if s_ones >= 5 then
            s_ones := s_ones + 3;
         end if;
         
         if s_tens >= 5 then
            s_tens := s_tens + 3;
         end if;
         
         if s_hundreds >= 5 then
            s_hundreds := s_hundreds + 3;
         end if;
         
         -- Shift entire register left once
         shift := shift_left(shift, 1);
      end loop;
      
      -- Push decimal numbers to output
      hundreds <= STD_LOGIC_VECTOR(s_hundreds);
      tens     <= STD_LOGIC_VECTOR(s_tens);
      ones     <= STD_LOGIC_VECTOR(s_ones);
   end process;

end Behavioral;