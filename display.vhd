----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:42:06 03/09/2021 
-- Design Name: 
-- Module Name:    display - Behavioral 
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

entity display is
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
end display;

architecture Behavioral of display is

    COMPONENT counter_3b_E
    Port ( clk : in  STD_LOGIC;
		     CE : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (2 downto 0)
		  );
    END COMPONENT;
	 
	 COMPONENT transcoder_3v8
    PORT(
		   A : in  STD_LOGIC_VECTOR (2 downto 0);
         O : out  STD_LOGIC_VECTOR (7 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT register_8b
    Port ( clk : in  STD_LOGIC;
		     D : in  STD_LOGIC_VECTOR (7 downto 0);
           Q : out  STD_LOGIC_VECTOR (7 downto 0) 
		  );
    END COMPONENT;
	 
	 COMPONENT mux_8x1x4b
    PORT( A : IN  std_logic_vector(3 downto 0);
          B : IN  std_logic_vector(3 downto 0);
          C : IN  std_logic_vector(3 downto 0);
          D : IN  std_logic_vector(3 downto 0);
          E : IN  std_logic_vector(3 downto 0);
          F : IN  std_logic_vector(3 downto 0);
          G : IN  std_logic_vector(3 downto 0);
          H : IN  std_logic_vector(3 downto 0);
          sel : IN  std_logic_vector(2 downto 0);
          O : OUT  std_logic_vector(3 downto 0)
         );
    END COMPONENT;
	 
	 COMPONENT transcoder_7segs
    PORT( A : in  STD_LOGIC_VECTOR (3 downto 0);
          O : out  STD_LOGIC_VECTOR (6 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT Tregister_1b
    Port ( clk : in  STD_LOGIC;
		     T : in  STD_LOGIC;
           Q : out  STD_LOGIC 
		  );
    END COMPONENT;
	 
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
	
signal AN_sel: std_logic_vector(2 downto 0);
signal AN_T3v8: std_logic_vector(7 downto 0);
signal T1s: std_logic;
signal DP: std_logic;
signal segs_data : std_logic_vector(3 downto 0);
signal sseg_7 : std_logic_vector(6 downto 0);
signal sseg : std_logic_vector(7 downto 0);

begin

	U0: counter_3b_E PORT MAP(
		 clk => CLK,
		 CE => CE_1ms,
		 Q => AN_sel
		 );
		 
	U1: transcoder_3v8 PORT MAP(
		 A => AN_sel,
		 O => AN_T3v8
		 );
	
	U2: register_8b PORT MAP(
		 clk => CLK,
		 D => AN_T3v8,
		 Q => AN
		 );
	
	U3: Tregister_1b PORT MAP(
		 clk => CLK,
		 T => CE_1s,
		 Q => T1s
		 );
	
	U4: mux_8x1x1b PORT MAP(
		 A => '1',
		 B => '1',
		 C => T1s,
		 D => '1',
		 E => '1',
		 F => '1',
		 G => '1',
		 H => '1',
       sel => AN_sel,
       O => DP
		 );

	U5: mux_8x1x4b PORT MAP(
		 A => data_disp1_R0,
		 B => data_disp1_R1,
		 C => data_disp1_L0,
		 D => data_disp1_L1,
		 E => data_disp2_R0,
		 F => data_disp2_R1,
		 G => data_disp2_L0,
		 H => data_disp2_L1,
       sel => AN_sel,
       O => segs_data
		 );
	
	U6: transcoder_7segs PORT MAP(
		 A => segs_data,
       O => sseg_7
		 );
	
	U7: register_8b PORT MAP(
		 clk => CLK,
		 D => sseg,
		 Q => LEDS
		 );
		
sseg(7 downto 0) <= DP & sseg_7(6 downto 0);

end Behavioral;

