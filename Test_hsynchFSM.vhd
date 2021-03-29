----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:26:05 03/29/2021 
-- Design Name: 
-- Module Name:    Test_hsynchFSM - Behavioral 
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

entity Test_hsynchFSM is
    Port ( CLK : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           hblank : out  STD_LOGIC;
           hsynch : out  STD_LOGIC;
           venable : out  STD_LOGIC;
           pixelNbr : out  STD_LOGIC_VECTOR (10 downto 0));
end Test_hsynchFSM;

architecture Behavioral of Test_hsynchFSM is


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

signal hreset_int: std_logic;
signal pixel_int: std_logic_vector(10 downto 0);

begin

	U0: counter_11b_R PORT MAP (
          CLK => CLK,
          reset => hreset_int,
          Q => pixel_int
			 
        );
	
	
	U1 : hsynchFSM PORT MAP (
          pixel => pixel_int,
          reset => reset,
          clk => clk,
          hsynch => hsynch,
          hblank => hblank,
          venable => venable,
          hreset => hreset_int
        );
		
	pixelNbr <= pixel_int;
	
	
end Behavioral;

