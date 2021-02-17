----------------------------------------------------------------------------------
-- Company: CPE
-- Engineer: Axel François 
-- 
-- Create Date:    19:04:56 16/02/2020 
-- Design Name: 
-- Module Name:    transcoder_7segs - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity transcoder_3v8 is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           O : out  STD_LOGIC_VECTOR (6 downto 0));
end transcoder_3v8;

architecture Behavioral of transcoder_3v8 is

begin
	O <= 	x"40" when A= x"0000" else
			x"79" when A= x"0001" else
			x"24" when A= x"0010" else
			x"30" when A= x"0011" else
			x"19" when A= x"0100" else
			x"12" when A= x"0101" else
			x"02" when A= x"0110" else
			x"78" when A= x"0111" else
			x"7F" when A= x"1000" else
			x"10" when A= x"1001" else
			x"08" when A= x"1010" else
			x"03" when A= x"1011" else
			x"46" when A= x"1100" else
			x"21" when A= x"1101" else
			x"06" when A= x"1110" else
			x"0E" when A= x"1111"	

end Behavioral;

