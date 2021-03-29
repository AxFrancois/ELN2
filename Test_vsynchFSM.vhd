----------------------------------------------------------------------------------
-- Company: Groupe_C Equipe_7
-- Engineer: GARCIA, FRANCOIS
-- 
-- Create Date:    15:09:30 03/29/2021 
-- Design Name: 
-- Module Name:    Test_vsynchFSM - Behavioral 
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

entity Test_vsynchFSM is
    Port ( CE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           lineNbr : out  STD_LOGIC_VECTOR (9 downto 0);
           vblank : out  STD_LOGIC;
           vsynch : out  STD_LOGIC);
end Test_vsynchFSM;

architecture Behavioral of Test_vsynchFSM is

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

SIGNAL vreset_int :std_logic;
SIGNAL line_int :std_logic_vector(9 downto 0);

begin

	U2 : counter_10b_RE PORT MAP (
          clk => clk,
          CE => CE,
          reset => vreset_int,
          Q => line_int
        );

	U3 : vsynchFSM PORT MAP (
          line => line_int,
          reset => reset,
          clk => clk,
          vsynch => vsynch,
          vblank => vblank,
          vreset => vreset_int
        );

	lineNbr <= line_int;

end Behavioral;

