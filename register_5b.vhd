----------------------------------------------------------------------------------
-- 
-- Engineer:       Renaud DAVIOT
-- 
-- Create Date:    2016 
--
-- File Name:      register_5b.vhd 
-- Module Name:    register_5b - Behavioral 
-- Project Name:   Chronoscore_VGA
--
-- Target Devices: XC3S200 (Spartan 3 - 200K)
-- 
-- Description: 
--
--
-- Revision 0.01 - File Created
--
----------------------------------------------------------------------------------

library IEEE;
   use IEEE.STD_LOGIC_1164.ALL;
   
entity register_5b is 
   port (   clk    : in  std_logic;
            D0     : in  std_logic;
            D1     : in  std_logic;
            D2     : in  std_logic;
            D3     : in  std_logic;
            D4     : in  std_logic;
            -----------------------------
            Q0     : out std_logic;
            Q1     : out std_logic;
            Q2     : out std_logic;
            Q3     : out std_logic;
            Q4     : out std_logic
            );
end register_5b;

architecture behavioral of register_5b is
 
	signal Q0_int  : std_logic := '0';
	signal Q1_int  : std_logic := '0';
	signal Q2_int  : std_logic := '0';
	signal Q3_int  : std_logic := '0';
	signal Q4_int  : std_logic := '0';

begin

	pipeline : process (clk)    
	begin
	  if (rising_edge(clk)) then
			Q0_int <= D0;
			Q1_int <= D1;
			Q2_int <= D2;
			Q3_int <= D3;
			Q4_int <= D4;
	  end if;
	end process;

	Q0 <= Q0_int;
	Q1 <= Q1_int;
	Q2 <= Q2_int;
	Q3 <= Q3_int;
	Q4 <= Q4_int;

end behavioral;
