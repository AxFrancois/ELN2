----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:07:19 03/25/2016 
-- Design Name: 
-- Module Name:    hsynchFSM - Behavioral 
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

entity hsynchFSM is
    Port ( pixel : in  STD_LOGIC_VECTOR (10 downto 0);
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           hsynch : out  STD_LOGIC;
           hblank : out  STD_LOGIC;
           venable : out  STD_LOGIC;
           hreset : out  STD_LOGIC);
end hsynchFSM;

architecture Behavioral of hsynchFSM is

type state_machine_h is (FP_h, SP_h, BP_h, AV_h);
signal current_state_h, next_state_h : state_machine_h;

begin

process (clk, reset)
begin 
	if (rising_edge(clk)) then
		if (reset = '0') then		-- Ecran VGA OFF pour reset = '0'
		current_state_h <= FP_h;
		else
		current_state_h <= next_state_h;
		end if;
	end if;
end process;

-- Machine d'état

process (current_state_h, pixel)

begin
	case current_state_h is
	 
		when FP_h =>			if (UNSIGNED(pixel (10 downto 0)) = 106) then
									next_state_h <= SP_h;
									hreset <= '1';
									venable <= '0';
									else
									next_state_h <= FP_h;
									hreset <= '0';
									venable <= '0';
									end if;									

		when SP_h =>			if (UNSIGNED(pixel (10 downto 0)) = 239) then
									next_state_h <= BP_h;
									hreset <= '1';
									venable <= '0';
									else
									next_state_h <= SP_h;
									hreset <= '0';
									venable <= '0';
									end if;
									
		when BP_h =>			if (UNSIGNED(pixel (10 downto 0)) = 121) then
									next_state_h <= AV_h;
									hreset <= '1';
									venable <= '0';
									else
									next_state_h <= BP_h;
									hreset <= '0';
									venable <= '0';
									end if;
									 
		when AV_h =>			if (UNSIGNED(pixel (10 downto 0)) = 1611) then
									next_state_h <= FP_h;
									hreset <= '1';
									venable <= '1';
									else
									next_state_h <= AV_h;	
									hreset <= '0';
									venable <= '0';
									end if;
									
		when others => 		next_state_h <= FP_h;
	end case;
end process;


-- Définition des sorties

hsynch <=	'0' when (current_state_h = SP_h) else
				'1';

hblank <=	'0' when (current_state_h = AV_h) else
				'1';


end Behavioral;

