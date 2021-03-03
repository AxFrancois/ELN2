--------------------------------------------------------------------------------
-- Company: Gr_C Equipe_2
-- Engineer: GARCIA_FRANCOIS
--
-- Create Date:   19:04:56 16/02/2020 
-- Design Name:   
-- Module Name:  counterDec_4b_RE - Testbench  
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
 
ENTITY counterDec_4b_RE_tb IS
END counterDec_4b_RE_tb;
 

ARCHITECTURE behavior OF counterDec_4b_RE_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counterDec_4b_RE
    Port ( R : in  STD_LOGIC;
		   CE : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
		   TC : out  STD_LOGIC
		  );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal CE : std_logic := '0';
   signal R : std_logic := '0';
   

 	--Outputs
   signal TC : std_logic := '0';
   signal Q : std_logic_vector(3 downto 0) := (others => '0');
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counterDec_4b_RE PORT MAP (
		  clk => clk,
 		  CE => CE,
		  R => R,
		  TC => TC,
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

CE_process:process
begin
	CE <= '0';
	wait for 90 ns;
	CE <= '1';
	wait for 10 ns;
end process;

-- [0,150ns] = cas normal, [150ns, 300ns] = cas pour le role de CE
R <= '1' after 0ns, '0' after 15ns, '1' after 210ns, '0' after 230ns;
--CE <= "0" after 0ns, "1" after 10ns, "0" after 20ns, "1" after 30ns, "0" after 40ns, "1" after 50ns, "0" after 60ns, "1" after 70ns, "0" after 80ns, "1" after 90ns, "0" after 100ns, "1" after 110ns, "0" after 120ns, "1" after 130ns, "0" after 140ns, "1" after 150ns, "0" after 160ns, "1" after 170ns, "0" after 180ns, "1" after 190ns, "0" after 200ns, "1" after 210ns, "0" after 220ns, "1" after 230ns, "0" after 240ns, "1" after 250ns, "0" after 260ns, "1" after 270ns, "0" after 280ns, "1" after 290ns

END;
