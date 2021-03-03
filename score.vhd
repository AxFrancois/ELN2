----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:54:04 03/01/2021 
-- Design Name: 
-- Module Name:    score - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity score is
    Port ( CE_1ms : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           BPL : in  STD_LOGIC;
           BPreset : in  STD_LOGIC;
           BPV : in  STD_LOGIC;
           loc_unit : out  STD_LOGIC_VECTOR (3 downto 0);
           loc_dec : out  STD_LOGIC_VECTOR (3 downto 0);
           vis_unit : out  STD_LOGIC_VECTOR (3 downto 0);
           vis_dec : out  STD_LOGIC_VECTOR (3 downto 0));
end score;

architecture Behavioral of score is

	COMPONENT register_1b_E
    Port ( clk : in  STD_LOGIC;
		     D : in  STD_LOGIC;
           CE : in  STD_LOGIC;
		     Q : out  STD_LOGIC 
		  );
	end COMPONENT;
 
    COMPONENT XOR2
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         O : OUT  std_logic
        );
    END COMPONENT;

    COMPONENT register_1b
    Port ( clk : in  STD_LOGIC;
		   D : in  STD_LOGIC;
           Q : out  STD_LOGIC 
		  );
    END COMPONENT;

    COMPONENT counterDec_4b_RE
    Port ( R : in  STD_LOGIC;
		   CE : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
		   TC : out  STD_LOGIC
		  );
    END COMPONENT;

signal bpl_r: std_logic;
signal bpl_d: std_logic;
signal bpl_f: std_logic;
signal bpl_fr: std_logic;
signal bpl_inc: std_logic;
signal CE_LOC: std_logic;
signal bpv_r: std_logic;
signal bpv_d: std_logic;
signal bpv_f: std_logic;
signal bpv_fr: std_logic;
signal bpv_inc: std_logic;
signal CE_VIS: std_logic;

begin
U0: register_1b_E PORT MAP (
		  clk => CLK,
 		  D => BPL,
		  Q => bpl_r,
		  CE => CE_1ms
        );

U1: register_1b_E PORT MAP (
		  clk => CLK,
 		  D => bpl_r,
		  Q => bpl_d,
		  CE => CE_1ms
        );
		  
U2: register_1b PORT MAP (
		  clk => CLK,
 		  D => bpl_d,
		  Q => bpl_f
        );		

U3: XOR2 PORT MAP (
		 A => bpl_f,
		 B => bpl_d,
		 O => bpl_fr
	  );
  
U5: register_1b_E PORT MAP (
		  clk => CLK,
 		  D => BPV,
		  Q => bpv_r,
		  CE => CE_1ms
        );

U6: register_1b_E PORT MAP (
		  clk => CLK,
 		  D => bpv_r,
		  Q => bpv_d,
		  CE => CE_1ms
        );

U7: register_1b PORT MAP (
		  clk => CLK,
 		  D => bpv_d,
		  Q => bpv_f
        );

U8: XOR2 PORT MAP (
		 A => bpv_f,
		 B => bpv_d,
		 O => bpv_fr
	  );
	  
U10: counterDec_4b_RE PORT MAP (
		  clk => CLK,
 		  CE => bpl_inc,
		  R => BPreset,
		  TC => CE_LOC,
		  Q => loc_unit
        );
	  
U11: counterDec_4b_RE PORT MAP (
		  clk => CLK,
 		  CE => CE_LOC,
		  R => BPreset,
		  TC => open,
		  Q => loc_dec
        );
	  
U12: counterDec_4b_RE PORT MAP (
		  clk => CLK,
 		  CE => bpv_inc,
		  R => BPreset,
		  TC => CE_VIS,
		  Q => vis_unit
        );
	  
U13: counterDec_4b_RE PORT MAP (
		  clk => CLK,
 		  CE => CE_VIS,
		  R => BPreset,
		  TC => open,
		  Q => vis_dec
        );

bpl_inc <= bpl_d AND bpl_fr;
bpv_inc <= bpv_d AND bpv_fr;	  
end Behavioral;

