--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Axel FRANCOIS
--
-- Create Date:   
-- Design Name:   
-- Module Name:   
-- Project Name:  chronoscore_phase1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: display
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
 
ENTITY display_tb IS
END display_tb;
 
ARCHITECTURE behavior OF display_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT display
    Port ( CE_1ms : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           data_disp1_R0 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp1_R1 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp1_L0 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp1_L1 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp2_R0 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp2_R1 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp2_L0 : in  STD_LOGIC_VECTOR (3 downto 0);
           data_disp2_L1 : in  STD_LOGIC_VECTOR (3 downto 0);
           CE_1s : in  STD_LOGIC;
           AN : out  STD_LOGIC_VECTOR (7 downto 0);
           LEDS : out  STD_LOGIC_VECTOR (7 downto 0));
    END COMPONENT;
    

   --Inputs
	signal CE_1ms : STD_LOGIC:= '0';
   signal CLK : STD_LOGIC:= '0';
   signal data_disp1_R0 : STD_LOGIC_VECTOR(3 downto 0):= "0000";
   signal data_disp1_R1 : STD_LOGIC_VECTOR(3 downto 0):= "0000";
   signal data_disp1_L0 : STD_LOGIC_VECTOR(3 downto 0):= "0000";
   signal data_disp1_L1 : STD_LOGIC_VECTOR(3 downto 0):= "0000";
   signal data_disp2_R0 : STD_LOGIC_VECTOR(3 downto 0):= "0000";
   signal data_disp2_R1 : STD_LOGIC_VECTOR(3 downto 0):= "0000";
   signal data_disp2_L0 : STD_LOGIC_VECTOR(3 downto 0):= "0000";
   signal data_disp2_L1 : STD_LOGIC_VECTOR(3 downto 0):= "0000";
   signal CE_1s : STD_LOGIC:= '0';

 	--Outputs
   signal AN : STD_LOGIC_VECTOR(7 downto 0):= "00000000";
   signal LEDS : STD_LOGIC_VECTOR(7 downto 0):= "00000000";

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
	constant CE_1ms_period : time := 100 ns;
	constant CE_1s_period : time := 100 ns;
	
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: display PORT MAP (
          CE_1ms => CE_1ms,
          CLK => CLK,
          data_disp1_R0 => data_disp1_R0,
          data_disp1_R1 => data_disp1_R1,
          data_disp1_L0 => data_disp1_L0,
          data_disp1_L1 => data_disp1_L1,
          data_disp2_R0 => data_disp2_R0,
          data_disp2_R1 => data_disp2_R1,
          data_disp2_L0 => data_disp2_L0,
          data_disp2_L1 => data_disp2_L1,
          CE_1s => CE_1s,
          AN => AN,
          LEDS => LEDS
        );

   -- Clock process definitions
	
CLK_process :process 
begin
	CLK <= '0'; 
	wait for clk_period/2;
	CLK<= '1'; 
	wait for clk_period/2;
end process;

CE_1ms_process :process
begin
	CE_1ms <= '0';
	wait for 90ns;
	CE_1ms <= '1';
	wait for 10ns;
end process;
	
CE_1s_process :process
begin
	CE_1s <= '0';
	wait for 90 ns;
	CE_1s <= '1';
	wait for 10ns;
end process;

data_disp1_R0 <= "0000";
data_disp1_R1 <= "1111";
data_disp1_L0 <= "0001";
data_disp1_L1 <= "1110";
data_disp2_R0 <= "0010";
data_disp2_R1 <= "1101";
data_disp2_L0 <= "0011";
data_disp2_L1 <= "1100";


END;
