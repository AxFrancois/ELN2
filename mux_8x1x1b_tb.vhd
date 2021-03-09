--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:04:56 16/02/2020 
-- Design Name:   
-- Module Name:  mux_8x1x1b_tb - Testbench  
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
 
ENTITY mux_8x1x1b_tb IS
END mux_8x1x1b_tb;
 
ARCHITECTURE behavior OF mux_8x1x1b_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_8x1x1b
    Port ( A : in  STD_LOGIC;
		   B : in  STD_LOGIC;
		   C : in  STD_LOGIC;
		   D : in  STD_LOGIC;
		   E : in  STD_LOGIC;
		   F : in  STD_LOGIC;
		   G : in  STD_LOGIC;
		   H : in  STD_LOGIC;
         sel : in  STD_LOGIC_VECTOR (2 downto 0);
         O : out  STD_LOGIC );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic_vector(2 downto 0) := (others => '0');
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal C : std_logic := '0';
   signal D : std_logic := '0';
   signal E : std_logic := '0';
   signal F : std_logic := '0';
   signal G : std_logic := '0';
   signal H : std_logic := '0';
   

 	--Outputs
   signal O : std_logic := '0';
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_8x1x1b PORT MAP (
          O => O,
			 sel => sel,
          A => A,
		    B => B,
		    C => C,
		    D => D,
		    E => E,
		    F => F,
		    G => G,
		    H => H
        );

sel <= "000", "001" after 100ns, "010" after 200ns, "011" after 300ns, "100" after 400ns, "101" after 500ns, "110" after 600ns, "111" after 700ns;
A <= '0', '1' after 50ns;
B <= '0', '1' after 150ns;
C <= '0', '1' after 250ns;
D <= '0', '1' after 350ns;
E <= '0', '1' after 450ns;
F <= '0', '1' after 550ns;
G <= '0', '1' after 650ns;
H <= '0', '1' after 750ns;


END;
