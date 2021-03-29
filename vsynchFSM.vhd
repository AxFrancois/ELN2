----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:41:23 03/25/2016 
-- Design Name: 
-- Module Name:    vsynchFSM - Behavioral 
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
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vsynchFSM is
    Port ( line : in  STD_LOGIC_VECTOR (9 downto 0);
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           vsynch : out  STD_LOGIC;
           vblank : out  STD_LOGIC;
           vreset : out  STD_LOGIC);
end vsynchFSM;

architecture Behavioral of vsynchFSM is

type state_machine_v is (FP_v, SP_v, BP_v, AV_v);
signal current_state_v, next_state_v : state_machine_v;


begin

process (clk, reset)
begin 
	if (rising_edge(clk)) then
		if (reset = '0') then				-- Ecran VGA OFF pour reset = '0'
		current_state_v <= FP_v;
		else
		current_state_v <= next_state_v;
		end if;
	end if;
end process;

-- Machine d'état

process (current_state_v, line)

begin
	case current_state_v is
		  
		when FP_v =>			if (UNSIGNED(line (9 downto 0)) = 35) then
									next_state_v <= SP_v;
									vreset <= '1';
									else
									next_state_v <= FP_v;
									vreset <= '0';
									end if;				
				
		when SP_v =>			if (UNSIGNED(line (9 downto 0)) = 6) then
									next_state_v <= BP_v;
									vreset <= '1';
									else
									next_state_v <= SP_v;
									vreset <= '0';
									end if;							
		
		when BP_v =>			if (UNSIGNED(line (9 downto 0)) = 21) then
									next_state_v <= AV_v;
									vreset <= '1';
									else
									next_state_v <= BP_v;
									vreset <= '0';
									end if;							
					 
		when AV_v =>			if (UNSIGNED(line (9 downto 0)) = 604) then
									next_state_v <= FP_v;
									vreset <= '1';
									else
									next_state_v <= AV_v;
									vreset <= '0';
									end if;								
											
		when others => 		next_state_v <= FP_v;
	end case;
end process;


-- Définition des sorties

vsynch <=	'0' when (current_state_v = SP_v) else
				'1';

vblank <=	'0' when (current_state_v = AV_v) else
				'1';
	

end Behavioral;

