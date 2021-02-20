----------------------------------------------------------------------------------
-- Company: CPE
-- Engineer: Axel François 
-- 
-- Create Date:    19:04:56 16/02/2020 
-- Design Name: 
-- Module Name:    transcoder_3v8 - Behavioral 
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
    Port ( A : in  STD_LOGIC_VECTOR (2 downto 0);
           O : out  STD_LOGIC_VECTOR (7 downto 0));
end transcoder_3v8;

architecture Behavioral of transcoder_3v8 is

begin
	O <= 	"11111110" when A= "000" else
		"11111101" when A= "001" else
		"11111011" when A= "010" else
		"11110111" when A= "011" else
		"11101111" when A= "100" else
		"11011111" when A= "101" else
		"10111111" when A= "110" else
		"01111111" when A= "111" 

end Behavioral;

