--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:46:05 02/22/2021
-- Design Name:   
-- Module Name:   C:/TPELEC_3ETI/GR_C/ELN2/SCORING/EQUIPE_2/chronoscore_phase1/mux_8x1x4b_tb.vhd
-- Project Name:  chronoscore_phase1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_8x1x4b
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
 
ENTITY mux_8x1x4b_tb IS
END mux_8x1x4b_tb;
 
ARCHITECTURE behavior OF mux_8x1x4b_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_8x1x4b
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         C : IN  std_logic_vector(3 downto 0);
         D : IN  std_logic_vector(3 downto 0);
         E : IN  std_logic_vector(3 downto 0);
         F : IN  std_logic_vector(3 downto 0);
         G : IN  std_logic_vector(3 downto 0);
         H : IN  std_logic_vector(3 downto 0);
         sel : IN  std_logic_vector(2 downto 0);
         O : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal C : std_logic_vector(3 downto 0) := (others => '0');
   signal D : std_logic_vector(3 downto 0) := (others => '0');
   signal E : std_logic_vector(3 downto 0) := (others => '0');
   signal F : std_logic_vector(3 downto 0) := (others => '0');
   signal G : std_logic_vector(3 downto 0) := (others => '0');
   signal H : std_logic_vector(3 downto 0) := (others => '0');
   signal sel : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal O : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
--   -- appropriate port name 
-- 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_8x1x4b PORT MAP (
          A => A,
          B => B,
          C => C,
          D => D,
          E => E,
          F => F,
          G => G,
          H => H,
          sel => sel,
          O => O
        );
		  
sel <= "000", "001" after 100ns, "010" after 200ns, "011" after 300ns, "100" after 400ns, "101" after 500ns, "110" after 600ns, "111" after 700ns;
A <= "0000", "1111" after 50ns;
B <= "0001", "1110" after 150ns;
C <= "0010", "1101" after 250ns;
D <= "0011", "1100" after 350ns;
E <= "0100", "1011" after 450ns;
F <= "0101", "1010" after 550ns;
G <= "0110", "1001" after 650ns;
H <= "0111", "1000" after 750ns;

--
--   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
-- 
--
--   -- Stimulus process
--   stim_proc: process
--   begin		
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for <clock>_period*10;
--
--      -- insert stimulus here 
--
--      wait;
--   end process;

END;
