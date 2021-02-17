--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:04:56 16/02/2020 
-- Design Name:   
-- Module Name:  counter_3b_E - Testbench  
-- Project Name:  
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_8x1x1b
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
 
ENTITY counter_3b_E IS
END counter_3b_E;
 
ARCHITECTURE behavior OF counter_3b_E IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter_3b_E
    Port ( clk : in  STD_LOGIC;
		   CE : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (2 downto 0)
		  );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal CE : std_logic := '0';
   

 	--Outputs
   signal Q : std_logic_vector(2 downto 0) := (others => '0');
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clk>_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter_3b_E PORT MAP (
		  CE => CE
		  Q => Q
        );

--clk <= "0" after 25ns, "1" after 75ns, "0" after 125ns, "1" after 175ns, "0" after 225ns, "1" after 275ns, "0" after 325ns, "1" after 375ns, "0" after 425ns, "1" after 475ns, "0" after 525ns, "1" after 575ns, "0" after 625ns, "1" after 675ns, "0" after 725ns, "1" after 775ns
CE <= "0" after 25ns, "1" after 75ns, "0" after 125ns, "1" after 175ns, "0" after 225ns, "1" after 275ns, "0" after 325ns, "1" after 375ns, "0" after 425ns, "1" after 475ns, "0" after 525ns, "1" after 575ns, "0" after 625ns, "1" after 675ns, "0" after 725ns, "1" after 775ns, "0" after 825ns, "1" after 875ns, "0" after 925ns, "1" after 975ns

END;
