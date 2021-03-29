----------------------------------------------------------------------------------
-- 
-- Engineer:       Renaud DAVIOT
-- 
-- Create Date:    2016 
--
-- File Name:      mux_2x3b.vhd 
-- Module Name:    mux_2x3b - Behavioral 
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

------------------------------------------------------------------------------
------------------------------------------------------------------------------

entity mux_2x3b is
   port (A0, A1, A2 : in  std_logic; 
         B0, B1, B2 : in  std_logic; 
         sel        : in  std_logic; 
         O0, O1, O2 : out std_logic);
end entity mux_2x3b;


architecture arch_behav of mux_2x3b is

begin
    
   O0 <= A0 when sel ='1' else
         B0; 
         
   O1 <= A1 when sel ='1' else
         B1; 
         
   O2 <= A2 when sel ='1' else
         B2; 
   
end arch_behav;
