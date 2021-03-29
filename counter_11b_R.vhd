----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Deschamps Le Corre
-- 
-- Create Date:    14:15:06 03/29/2021 
-- Design Name: 
-- Module Name:    counter_11b_R - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_11b_R is
    Port ( CLK : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (10 downto 0));
end counter_11b_R;

architecture Behavioral of counter_11b_R is
signal Q_int : unsigned (10 downto 0):= "00000000000";

begin

	Q <= std_logic_vector(Q_int);
	
process(CLK, reset)
begin
	if(rising_edge(CLK)) then
		if(reset = '1') then 
			Q_int <= "00000000000";
		else
			Q_int <= Q_int + 1;	
		end if;
	end if;
end process;

	
end Behavioral;	
	
	