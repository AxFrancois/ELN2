--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:04:56 16/02/2020 
-- Design Name:   
-- Module Name:  register_8b - Testbench  
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
 
ENTITY register_8b IS
END register_8b;
 
ARCHITECTURE behavior OF register_8b IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_8b
    Port ( clk : in  STD_LOGIC;
		   D : in  STD_LOGIC_VECTOR (7 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0) 
		  );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal D : std_logic_vector(7 downto 0) := (others => '0');
   

 	--Outputs
   signal Q : std_logic_vector(7 downto 0) := (others => '0');
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clk>_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_8b PORT MAP (
		  D => D
		  Q => Q
        );

--clk <= "0" after 25ns, "1" after 75ns, "0" after 125ns, "1" after 175ns, "0" after 225ns, "1" after 275ns, "0" after 325ns, "1" after 375ns, "0" after 425ns, "1" after 475ns, "0" after 525ns, "1" after 575ns, "0" after 625ns, "1" after 675ns, "0" after 725ns, "1" after 775ns
D <= "00000000" after 0ns, "11111111" after 50ns, "00010001" after 100ns, "11101110" after 150ns, "00100010" after 200ns, "11011101" after 250ns, "00110011" after 300ns, "11001100" after 350ns, "01000100" after 400ns, "10111011" after 450ns, "01010101" after 500ns, "10101010" after 550ns, "01100110" after 600ns, "10011001" after 650ns, "01110111" after 700ns, "10001000" after 750ns

END;
