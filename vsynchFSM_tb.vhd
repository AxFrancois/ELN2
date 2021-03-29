--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:12:48 03/29/2021
-- Design Name:   
-- Module Name:   C:/CPE_users/ELN2/Groupe_C/Equipe_2/chronoscore_phase3/vsynchFSM_tb.vhd
-- Project Name:  chronoscore_phase3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: vsynchFSM
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
 
ENTITY vsynchFSM_tb IS
END vsynchFSM_tb;
 
ARCHITECTURE behavior OF vsynchFSM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
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
    

   --Inputs
   signal line : std_logic_vector(9 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal vsynch : std_logic;
   signal vblank : std_logic;
   signal vreset : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: vsynchFSM PORT MAP (
          line => line,
          reset => reset,
          clk => clk,
          vsynch => vsynch,
          vblank => vblank,
          vreset => vreset
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
