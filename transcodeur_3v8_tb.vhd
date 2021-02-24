--------------------------------------------------------------------------------
-- Company: 
-- Engineer:Deschamp Le Corre
--
-- Create Date:   15:09:19 02/22/2021
-- Design Name:   
-- Module Name:   H:/CPE_USERS/TPELEC_3ETI/GR_C/ELN2/SCORING/EQUIPE_2/chronoscore_phase1/transcodeur_3v8_tb.vhd
-- Project Name:  Projet Scoring 2.0
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: transcoder_3v8
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
 
ENTITY transcodeur_3v8_tb IS
END transcodeur_3v8_tb;
 
ARCHITECTURE behavior OF transcodeur_3v8_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT transcoder_3v8
    PORT(
         A : IN  std_logic_vector(2 downto 0);
         O : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal O : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
-- 
--   constant <clock>_period : time := 10 ns;
-- 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: transcoder_3v8 PORT MAP (
          A => A,
          O => O
        );
A <= "000", "001" after 100 ns, "010" after 200 ns, "011" after 300 ns, "100" after 400 ns, "101" after 500 ns, "110" after 600 ns, "111" after 700 ns;

END;

--   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
-- 

--   -- Stimulus process
--   stim_proc: process
--   begin		
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for <clock>_period*10;

      -- insert stimulus here 
--
--      wait;
--   end process;
--
--END;
