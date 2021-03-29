----------------------------------------------------------------------------------
-- Company: Groupe_C Equipe_2
-- Engineer: GARCIA, FRANCOIS
-- 
-- Create Date:    16:27:11 03/29/2021 
-- Design Name: 
-- Module Name:    vgaCore - Behavioral 
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

entity vgaCore is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           hblank : out  STD_LOGIC;
           hsynch : out  STD_LOGIC;
           pixelNbr : out  STD_LOGIC_VECTOR (10 downto 0);
           vblank : out  STD_LOGIC;
           vsynch : out  STD_LOGIC;
           lineNbr : out  STD_LOGIC_VECTOR (9 downto 0));
end vgaCore;

architecture Behavioral of vgaCore is

    COMPONENT counter_10b_RE
    PORT(
         clk : IN  std_logic;
         CE : IN  std_logic;
         reset : IN  std_logic;
         Q : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    
	     COMPONENT vsynchFSM
    PORT(
         line : IN  std_logic_vector(9 downto 0);
         reset : IN  std_logic;
         clk : IN  std_logic;
         vsynch : OUT  std_logic;
         vblank : OUT  std_logic;
         vreset : OUT  std_logic
        );
    END COMPONENT;
	 
		COMPONENT counter_11b_R
    PORT(
         CLK : IN  std_logic;
         reset : IN  std_logic;
         Q : OUT  std_logic_vector(10 downto 0)
        );
    END COMPONENT;
	 
		COMPONENT hsynchFSM
    PORT(
         pixel : IN  std_logic_vector(10 downto 0);
         reset : IN  std_logic;
         clk : IN  std_logic;
         hsynch : OUT  std_logic;
         hblank : OUT  std_logic;
         venable : OUT  std_logic;
         hreset : OUT  std_logic
        );
    END COMPONENT;


SIGNAL clk_int :std_logic;
SIGNAL reset_int :std_logic;
SIGNAL venable_int :std_logic;
SIGNAL hreset_int :std_logic;
SIGNAL pixel_int :std_logic_vector(10 downto 0);
SIGNAL vreset_int :std_logic;
SIGNAL line_int :std_logic_vector(9 downto 0);

begin
	
	u0: counter_11b_R PORT MAP (
          CLK => clk_int,
          reset => hreset_int,
          Q => pixel_int
			 
        );
	
	
	u1 : hsynchFSM PORT MAP (
          pixel => pixel_int,
          reset => reset_int,
          clk => clk_int,
          hsynch => hsynch,
          hblank => hblank,
          venable => venable_int,
          hreset => hreset_int
        );
		
	
	u2 : counter_10b_RE PORT MAP (
          clk => clk_int,
          CE => venable_int,
          reset => vreset_int,
          Q => line_int
        );

	u3 : vsynchFSM PORT MAP (
          line => line_int,
          reset => reset_int,
          clk => clk_int,
          vsynch => vsynch,
          vblank => vblank,
          vreset => vreset_int
        );

	pixelNbr <= pixel_int;
	lineNbr <= line_int;
	
	clk_int <= clk;
	reset_int <= reset;


end Behavioral;

