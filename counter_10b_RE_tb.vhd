--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:39:53 03/29/2021
-- Design Name:   
-- Module Name:   //fs04.cpe.fr/Bureau/chronoscore_phase3/counter_10b_RE_tb.vhd
-- Project Name:  chronoscore_phase3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter_10b_RE
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
 
ENTITY counter_10b_RE_tb IS
END counter_10b_RE_tb;
 
ARCHITECTURE behavior OF counter_10b_RE_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter_10b_RE
    PORT(
         clk : IN  std_logic;
         CE : IN  std_logic;
         reset : IN  std_logic;
         Q : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal CE : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant CE_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter_10b_RE PORT MAP (
          clk => clk,
          CE => CE,
          reset => reset,
          Q => Q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
	CE_process :process
   begin
		CE <= '0';
		wait for 90 ns;
		CE <= '1';
		wait for 10 ns;
   end process;

	reset <= '0', '1' after 800 ns, '0' after 850 ns;

END;
