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
	O <= 	x"11111110" when A= x"000" else
			x"11111101" when A= x"001" else
			x"11111011" when A= x"010" else
			x"11110111" when A= x"011" else
			x"11101111" when A= x"100" else
			x"11011111" when A= x"101" else
			x"10111111" when A= x"110" else
			x"01111111" when A= x"111" 

end Behavioral;

