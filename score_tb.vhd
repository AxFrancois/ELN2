--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:30:40 03/01/2021
-- Design Name:   
-- Module Name:   C:/CPE_USERS/TPELEC_3ETI/GR_C/ELN2/SCORING/EQUIPE_2/score_tb.vhd
-- Project Name:  chronoscore_phase2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: score
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
 
ENTITY score_tb IS
END score_tb;
 
ARCHITECTURE behavior OF score_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT score
    PORT(
         CE_1ms : IN  std_logic;
         CLK : IN  std_logic;
         BPL : IN  std_logic;
         BPreset : IN  std_logic;
         BPV : IN  std_logic;
         loc_unit : OUT  std_logic_vector(3 downto 0);
         loc_dec : OUT  std_logic_vector(3 downto 0);
         vis_unit : OUT  std_logic_vector(3 downto 0);
         vis_dec : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CE_1ms : std_logic := '0';
   signal CLK : std_logic := '0';
   signal BPL : std_logic := '0';
   signal BPreset : std_logic := '0';
   signal BPV : std_logic := '0';

 	--Outputs
   signal loc_unit : std_logic_vector(3 downto 0);
   signal loc_dec : std_logic_vector(3 downto 0);
   signal vis_unit : std_logic_vector(3 downto 0);
   signal vis_dec : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	constant CE_1ms_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: score PORT MAP (
          CE_1ms => CE_1ms,
          CLK => CLK,
          BPL => BPL,
          BPreset => BPreset,
          BPV => BPV,
          loc_unit => loc_unit,
          loc_dec => loc_dec,
          vis_unit => vis_unit,
          vis_dec => vis_dec
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
	
	CE_process:process
	begin
		CE_1ms <= '0';
		wait for 90 ns;
		CE_1ms <= '1';
		wait for 10 ns;
	end process;
	


BPV <= '0', '1' after 1000 ns,
		'0' after 1100 ns, '1' after 2000 ns,
		'0' after 2100 ns, '1' after 3000 ns,
		'0' after 3100 ns, '1' after 4000 ns,
		'0' after 4100 ns, '1' after 5000 ns,
		'0' after 5100 ns, '1' after 6000 ns,
		'0' after 6100 ns, '1' after 7000 ns,
		'0' after 7100 ns, '1' after 8000 ns,
		'0' after 8100 ns, '1' after 9000 ns,
		'0' after 9100 ns, '1' after 10000 ns,
		'0' after 10100 ns, '1' after 11000 ns,
		'0' after 11100 ns, '1' after 12000 ns,
		'0' after 12100 ns, '1' after 13000 ns,
		'0' after 13100 ns, '1' after 14000 ns,
		'0' after 14100 ns, '1' after 15000 ns,
		'0' after 15100 ns, '1' after 16000 ns,
		'0' after 16100 ns, '1' after 17000 ns,
		'0' after 17100 ns, '1' after 18000 ns,
		'0' after 18100 ns, '1' after 19000 ns;


BPreset <= '0', '1' after 15000ns, '0' after 15100ns;

	
END;
