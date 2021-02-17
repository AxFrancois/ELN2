--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:04:56 16/02/2020 
-- Design Name:   
-- Module Name:  transcoder_7segs_tb - Testbench  
-- Project Name:  
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
--USE ieee.numeric_std.ALL;
 
ENTITY transcoder_7segs_tb IS
END transcoder_7segs_tb;
 
ARCHITECTURE behavior OF transcoder_7segs_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT gray_bin_4bit
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

A <= "0000", "0001" after 100ns, "0010" after 200ns, "0011" after 300ns, "0100" after 400ns, "0101" after 500ns, "0110" after 600ns, "0111" after 700ns, "1000" after 800ns, "1001" after 900ns, "1010" after 1000ns,"1011" after 1100ns,"1100" after 1200ns,"1101" after 1300ns,"1110" after 1400ns,"1111" after 1500ns;  

END;
