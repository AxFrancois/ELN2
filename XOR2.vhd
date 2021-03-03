----------------------------------------------------------------------------------
-- Company: Gr_C Equipe_2
-- Engineer: GARCIA_FRANCOIS
-- 
-- Create Date:    14:09:57 03/01/2021 
-- Design Name: 
-- Module Name:    XOR2 - Behavioral 
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

entity XOR2 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           O : out  STD_LOGIC);
end XOR2;

architecture Behavioral of XOR2 is

begin

	O <= A XOR B;

end Behavioral;

