--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:03:24 03/29/2021
-- Design Name:   
-- Module Name:   C:/CPE_USERS/TPELEC_3ETI/GR_C/Equipe_2/chronoscore_phase3/hsynchFSM_tb.vhd
-- Project Name:  chronoscore_phase3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: hsynchFSM
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
 
ENTITY hsynchFSM_tb IS
END hsynchFSM_tb;
 
ARCHITECTURE behavior OF hsynchFSM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
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
    

   --Inputs
   signal pixel : std_logic_vector(10 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal hsynch : std_logic;
   signal hblank : std_logic;
   signal venable : std_logic;
   signal hreset : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: hsynchFSM PORT MAP (
          pixel => pixel,
          reset => reset,
          clk => clk,
          hsynch => hsynch,
          hblank => hblank,
          venable => venable,
          hreset => hreset
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
