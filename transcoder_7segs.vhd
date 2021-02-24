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

entity transcoder_7segs is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           O : out  STD_LOGIC_VECTOR (6 downto 0));
end transcoder_7segs;

architecture Behavioral of transcoder_7segs is
signal O_int : STD_LOGIC_VECTOR (7 downto 0);
begin
	O_int <= 	x"40" when A= "0000" else
			x"79" when A= "0001" else
			x"24" when A= "0010" else
			x"30" when A= "0011" else
			x"19" when A= "0100" else
			x"12" when A= "0101" else
			x"02" when A= "0110" else
			x"78" when A= "0111" else
			x"00" when A= "1000" else
			x"10" when A= "1001" else
			x"08" when A= "1010" else
			x"03" when A= "1011" else
			x"46" when A= "1100" else
			x"21" when A= "1101" else
			x"06" when A= "1110" else
			x"0E" when A= "1111";

--	O <= 	"1000000" when A= "0000" else
--			"1111001" when A= "0001" else
--			"0100100" when A= "0010" else
--			"0011000" when A= "0011" else
--			"0011001" when A= "0100" else
--			"0010010" when A= "0101" else
--			"0000010" when A= "0110" else
--			"0000111" when A= "0111" else
--			"0000000" when A= "1000" else
--			"0010000" when A= "1001" else
--			"0001000" when A= "1010" else
--			"0000011" when A= "1011" else
--			"1000110" when A= "1100" else
--			"0100001" when A= "1101" else
--			"0000110" when A= "1110" else
--			"0001110" when A= "1111";

O <= O_int(6 downto 0);

end Behavioral;

