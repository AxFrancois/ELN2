----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:18:37 02/22/2021 
-- Design Name: 
-- Module Name:    counterSen_4b_RE - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counterSen_4b_RE is
    Port ( R : in  STD_LOGIC;
		   CE : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
		   TC : out  STD_LOGIC;
		 );
end counterSen_4b_RE;

architecture Behavioral of counterSen_4b_RE is
signal Q_int : STD_LOGIC_VECTOR (3 downto 0);
signal TC_int : STD_LOGIC;
begin
	Q <= Q_int;
	TC <= TC_int
	
	process(clk,CE,R)
		if R = '1' then 
			Q_int <= "0000"
		elsif(rising_edge(clk) and CE = '1' and Q_int = "0101") then
			Q_int <= "0000"
			TC_int <= '1'
		elsif((rising_edge(clk) and Q_int = "0000") or CE = '0') then
			TC_int <= '0'
		elsif(rising_edge(clk) and CE = '1') then 
			Q_int <= Q_int + 1;
		end if;
	end process;
end Behavioral;