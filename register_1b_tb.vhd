--------------------------------------------------------------------------------
-- Company: Gr_C Equipe_2
-- Engineer: GARCIA_FRANCOIS
--
-- Create Date:   19:04:56 16/02/2020 
-- Design Name:   
-- Module Name:  register_1b - Testbench  
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
 
ENTITY register_1b_tb IS
END register_1b_tb;
 

ARCHITECTURE behavior OF register_1b_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_1b
    Port ( clk : in  STD_LOGIC;
		   D : in  STD_LOGIC;
           Q : out  STD_LOGIC 
		  );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal D : std_logic := '0';
   

 	--Outputs
   signal Q : std_logic := '0';
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_1b PORT MAP (
		  clk => clk,
 		  D => D,
		  Q => Q
        );
--Clock process definitions
clk_process:process
begin
	clk<= '0';
	wait for clk_period/2;
	clk<= '1';
	wait for clk_period/2;
end process;

--clk <= "0" after 25ns, "1" after 75ns, "0" after 125ns, "1" after 175ns, "0" after 225ns, "1" after 275ns, "0" after 325ns, "1" after 375ns, "0" after 425ns, "1" after 475ns, "0" after 525ns, "1" after 575ns, "0" after 625ns, "1" after 675ns, "0" after 725ns, "1" after 775ns
D <= '0' after 0 ns, '1' after 80 ns, '0' after 95 ns, '1' after 110 ns;

END;
