--------------------------------------------------------------------------------
-- Company: Gr_C Equipe_2
-- Engineer: GARCIA_FRANCOIS
--
-- Create Date:   14:13:58 03/01/2021
-- Design Name:   
-- Module Name:   C:/CPE_USERS/TPELEC_3ETI/GR_C/ELN2/SCORING/EQUIPE_2/XOR2_tb.vhd
-- Project Name:  chronoscore_phase2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: XOR2
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
 
ENTITY XOR2_tb IS
END XOR2_tb;
 
ARCHITECTURE behavior OF XOR2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT XOR2
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         O : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal O : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: XOR2 PORT MAP (
          A => A,
          B => B,
          O => O
        );

	A <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 300 ns;
	B <= '0', '1' after 200 ns;

END;
