--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:20:48 03/29/2021
-- Design Name:   
-- Module Name:   C:/CPE_USERS/TPELEC_3ETI/GR_C/Equipe_2/chronoscore_phase3/Test_hsynchFSM_tb.vhd
-- Project Name:  chronoscore_phase3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Test_hsynchFSM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Test_hsynchFSM_tb IS
END Test_hsynchFSM_tb;
 
ARCHITECTURE behavior OF Test_hsynchFSM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Test_hsynchFSM
    PORT(
         CLK : IN  std_logic;
         reset : IN  std_logic;
         hblank : OUT  std_logic;
         hsynch : OUT  std_logic;
         venable : OUT  std_logic;
         pixelNbr : OUT  std_logic_vector(10 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal hblank : std_logic;
   signal hsynch : std_logic;
   signal venable : std_logic;
   signal pixelNbr : std_logic_vector(10 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Test_hsynchFSM PORT MAP (
          CLK => CLK,
          reset => reset,
          hblank => hblank,
          hsynch => hsynch,
          venable => venable,
          pixelNbr => pixelNbr
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
reset <= '0', '1' after 100 ns;
	

END;
