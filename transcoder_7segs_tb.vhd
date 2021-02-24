--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:10:39 02/22/2021
-- Design Name:   
-- Module Name:   H:/Projet_Scoring/transcoder_7segs_tb.vhd
-- Project Name:  SCORING
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: transcoder_7segs
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
USE ieee.numeric_std.ALL;
 
ENTITY transcoder_7segs_tb IS
END transcoder_7segs_tb;
 
ARCHITECTURE behavior OF transcoder_7segs_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT transcoder_7segs
    PORT(
		   A : in  STD_LOGIC_VECTOR (3 downto 0);
           O : out  STD_LOGIC_VECTOR (6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal O : std_logic_vector(6 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: transcoder_7segs PORT MAP (
          O => O,
          A => A
        );
		  
   -- Stimulus
	 stim_proc : process
	 variable I : integer range 0 to 15 := 0;
	 begin
		FOR I IN 0 TO 15 LOOP
			A <= std_logic_vector(to_unsigned(I,4));
			wait for 100ns;
		END LOOP;
      wait;
	 end process;  

--A <= "0000", "0001" after 100ns, "0010" after 200ns, "0011" after 300ns, "0100" after 400ns, "0101" after 500ns, "0110" after 600ns, "0111" after 700ns, "1000" after 800ns, "1001" after 900ns, "1010" after 1000ns,"1011" after 1100ns,"1100" after 1200ns,"1101" after 1300ns,"1110" after 1400ns,"1111" after 1500ns;  

END;
