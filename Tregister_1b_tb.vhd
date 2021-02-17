--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:04:56 16/02/2020 
-- Design Name:   
-- Module Name:  Tregister_1b - Testbench  
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
 
ENTITY Tregister_1b IS
END Tregister_1b;
 
ARCHITECTURE behavior OF Tregister_1b IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Tregister_1b
    Port ( clk : in  STD_LOGIC;
		   T : in  STD_LOGIC;
           Q : out  STD_LOGIC 
		  );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal T : std_logic := '0';
   

 	--Outputs
   signal Q : std_logic := '0';
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clk>_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Tregister_1b PORT MAP (
		  T => D
		  Q => Q
        );

--clk <= "0" after 25ns, "1" after 75ns, "0" after 125ns, "1" after 175ns, "0" after 225ns, "1" after 275ns, "0" after 325ns, "1" after 375ns, "0" after 425ns, "1" after 475ns, "0" after 525ns, "1" after 575ns, "0" after 625ns, "1" after 675ns, "0" after 725ns, "1" after 775ns
T <= "0" after 25ns, "1" after 75ns, "0" after 125ns, "1" after 175ns, "0" after 225ns, "1" after 275ns, "0" after 325ns, "1" after 375ns, "0" after 425ns, "1" after 475ns, "0" after 525ns

END;
