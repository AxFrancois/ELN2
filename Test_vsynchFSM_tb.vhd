--------------------------------------------------------------------------------
-- Company: Groupe_C Equipe_2
-- Engineer: GARCIA, FRANCOIS
--
-- Create Date:   15:29:02 03/29/2021
-- Design Name:   
-- Module Name:   C:/CPE_users/ELN2/Groupe_C/Equipe_2/chronoscore_phase3/Test_vsynchFSM_tb.vhd
-- Project Name:  chronoscore_phase3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Test_vsynchFSM
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
 
ENTITY Test_vsynchFSM_tb IS
END Test_vsynchFSM_tb;
 
ARCHITECTURE behavior OF Test_vsynchFSM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Test_vsynchFSM
    PORT(
         CE : IN  std_logic;
         CLK : IN  std_logic;
         reset : IN  std_logic;
         lineNbr : OUT  std_logic_vector(9 downto 0);
         vblank : OUT  std_logic;
         vsynch : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CE : std_logic := '0';
   signal CLK : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal lineNbr : std_logic_vector(9 downto 0);
   signal vblank : std_logic;
   signal vsynch : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	constant CE_period : time := 20.8 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Test_vsynchFSM PORT MAP (
          CE => CE,
          CLK => CLK,
          reset => reset,
          lineNbr => lineNbr,
          vblank => vblank,
          vsynch => vsynch
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
	CE_process :process
   begin
		CE <= '0';
		wait for 20790 ns;
		CE <= '1';
		wait for 10 ns;
   end process;
	
	
	reset <= '0', '1' after 200 ns;

END;
