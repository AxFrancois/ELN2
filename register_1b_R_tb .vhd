--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
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
 
ENTITY register_1b_R_tb IS
END register_1b_R_tb;
 

ARCHITECTURE behavior OF register_1b_R_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_1b_R
    Port ( clk : in  STD_LOGIC;
		   D : in  STD_LOGIC;
           R : in  STD_LOGIC;
		   Q : out  STD_LOGIC 
		  );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal D : std_logic := '0';
   signal R : std_logic := '0';
   

 	--Outputs
   signal Q : std_logic := '0';
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_1b_R PORT MAP (
		  clk => clk,
 		  D => D,
		  R => R,
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

-- [0,150ns] = cas normal, [150ns, 300ns] = cas pour le role de R
D <= "0" after 0ns, "1" after 50ns, "0" after 100ns, "1" after 150ns, "0" after 200ns, "1" after 250ns 
R <= "0" after 0ns, "1" after 175ns,"0" after 275ns


END;
