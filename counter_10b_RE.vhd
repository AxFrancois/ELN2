----------------------------------------------------------------------------------
-- Company: Groupe_C, Equipe 2
-- Engineer: GARCIA, FRANCOIS
-- 
-- Create Date:    14:16:01 03/29/2021 
-- Design Name: 
-- Module Name:    counter_10b_RE - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_10b_RE is
    Port ( clk : in  STD_LOGIC;
           CE : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (9 downto 0));
end counter_10b_RE;

architecture Behavioral of counter_10b_RE is
signal Q_int : unsigned(9 downto 0) := "0000000000";

begin
	Q <= std_logic_vector(Q_int);

process(clk,CE,reset)
begin
	if(rising_edge(clk)) then
		if(reset = '1') then 
			Q_int <= "0000000000";
		elsif(CE = '1') then
			Q_int <= Q_int + 1;
		end if;
	end if;
end process;

end Behavioral;

