----------------------------------------------------------------------------------
-- 
-- Engineer:       Abdelbassat MASSOURI - Evelyne STEFFEN
-- 
-- Create Date:    2020 
--
-- Module Name:    chronoscore_phase1 - Behavioral 
-- Project Name:   chronoscore_phase1
--
-- Target Devices: XC7A100T-csg324 (Artix 7)
-- 
-- Description: 
--
--
-- Revision 0.01 - File Created
--
----------------------------------------------------------------------------------

library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;

entity chronoscore_phase1 is
    port (  GCLK      : in  std_logic;
            TEST_HSLS : in  std_logic;
            START     : in  std_logic;
            WAIT_t    : in  std_logic;
            RESET     : in  std_logic;
            BPL      : in  std_logic;
            BPV       : in  std_logic;
            BPreset   : in  std_logic;
            TEST      : in  std_logic;
            TESTVGA   : in  std_logic;
            VGAONOFF  : in  std_logic;
            ----------------------------------------------
            RED       : out std_logic;  
            GREEN     : out std_logic;   
            BLUE      : out std_logic;  
            HSYNCH    : out std_logic;   
            VSYNCH    : out std_logic;          
            AN        : out std_logic_vector (7 downto 0);
            LEDS      : out std_logic_vector (7 downto 0));
end chronoscore_phase1;

architecture Behavioral of chronoscore_phase1 is

    component timeGenerator
        Port ( GCLK       : in  std_logic;
               TEST_HSLS  : in  std_logic;
               ----------------------- 
               CE_1ms     : out std_logic;
               CE_1s      : out std_logic;
               CLK        : out std_logic);
    end component timeGenerator;

    component chronometer
        Port (  CLK       : in  std_logic;
                CE_1s     : in  std_logic;
                START     : in  std_logic;
                WAIT_t    : in  std_logic;
                RESET     : in  std_logic;
                ----------------------------------------------
                sec_unit  : out std_logic_vector (3 downto 0);
                sec_dec   : out std_logic_vector (3 downto 0);
                min_unit  : out std_logic_vector (3 downto 0);
                min_dec   : out std_logic_vector (3 downto 0));
    end component chronometer;

    component score
        Port ( CLK        : in  std_logic;
               CE_1ms     : in  std_logic;
               BPL       : in  std_logic;
               BPV        : in  std_logic;
               BPreset    : in  std_logic;
               -----------------------------------------------
               vis_unit   : out std_logic_vector (3 downto 0);
               vis_dec    : out std_logic_vector (3 downto 0);
               loc_unit    : out std_logic_vector (3 downto 0);
               loc_dec     : out std_logic_vector (3 downto 0));
    end component score;
   
    component display
        Port (  CLK       		: in  std_logic;
                CE_1ms    		: in  std_logic;
                CE_1s     		: in  std_logic;
				    data_disp1_R0 : in  STD_LOGIC_VECTOR (3 downto 0);
				    data_disp1_R1 : in  STD_LOGIC_VECTOR (3 downto 0);
				    data_disp1_L0 : in  STD_LOGIC_VECTOR (3 downto 0);
				    data_disp1_L1 : in  STD_LOGIC_VECTOR (3 downto 0);
				    data_disp2_R0 : in  STD_LOGIC_VECTOR (3 downto 0);
				    data_disp2_R1 : in  STD_LOGIC_VECTOR (3 downto 0);
				    data_disp2_L0 : in  STD_LOGIC_VECTOR (3 downto 0);
				    data_disp2_L1 : in  STD_LOGIC_VECTOR (3 downto 0);	
                ----------------------------------------------
                AN        		: out std_logic_vector (7 downto 0);
                LEDS     		: out std_logic_vector (7 downto 0));
    end component display;
    
    component vgaDisplay  
        port (  CLK       : in  std_logic;
                VGAONOFF  : in  std_logic;
                TESTVGA   : in  std_logic;
                CE_1s     : in  std_logic;
                sec_unit  : in  std_logic_vector(3 downto 0);
                sec_dec   : in  std_logic_vector(3 downto 0);
                min_unit  : in  std_logic_vector(3 downto 0);
                min_dec   : in  std_logic_vector(3 downto 0);
                vis_unit  : in  std_logic_vector(3 downto 0);
                vis_dec   : in  std_logic_vector(3 downto 0);
                loc_unit   : in  std_logic_vector(3 downto 0);
                loc_dec    : in  std_logic_vector(3 downto 0);
                ---------------------------------------------
                HSYNCH    : out std_logic;
                VSYNCH    : out std_logic;
                RED       : out std_logic;
                BLUE      : out std_logic;
                GREEN     : out std_logic            
                );
    end component vgaDisplay;        
    
-----------------------------------------------
-- signaux internes
-----------------------------------------------

    signal CE_1ms_int  : std_logic;
    signal CE_1s_int   : std_logic;	
    signal CLK_int     : std_logic;
    	
    signal SU  : std_logic_vector (3 downto 0);
    signal SD  : std_logic_vector (3 downto 0);
    signal MU  : std_logic_vector (3 downto 0);
    signal MD  : std_logic_vector (3 downto 0);
    
    signal VU  : std_logic_vector (3 downto 0);
    signal VD  : std_logic_vector (3 downto 0);
    signal OU  : std_logic_vector (3 downto 0);
    signal OD  : std_logic_vector (3 downto 0);
    
    signal DR0 : std_logic_vector (3 downto 0);
    signal DR1 : std_logic_vector (3 downto 0);
    signal DL0 : std_logic_vector (3 downto 0);
    signal DL1 : std_logic_vector (3 downto 0);
    
-----------------------------------------------

begin

  U0 : timeGenerator 
        port map (  GCLK      => GCLK,
                    TEST_HSLS => TEST_HSLS,    
                    -------------------------
                    CE_1ms    => CE_1ms_int,
                    CE_1s     => CE_1s_int,
                    CLK       => CLK_int);                
				
-- Initialisation des valeurs à afficher (à compléter)

-- Equipe : format EN - N numéro d'équipe
    SU <= "1110";
    SD <= "0010";
-- Groupe : format 0X	 - X groupe de TP
    MU <= "0000";
    MD <= "1100";
-- Année : format AAAA
    VU <= "0010";
    VD <= "0000";
    OU <= "0010";
    OD <= "0000";

	 
  U4 : display 
        port map (  CLK     => CLK_int,
                    CE_1ms  => CE_1ms_int,
                    CE_1s   => CE_1s_int,
                    data_disp1_R0 => SU,
                    data_disp1_R1 => SD,
                    data_disp1_L0 => MU,
                    data_disp1_L1 => MD,
                    data_disp2_R0 => VU,
                    data_disp2_R1 => VD,
                    data_disp2_L0 => OU,
                    data_disp2_L1 => OD,
                    -------------------------
                    AN      => AN,
                    LEDS    => LEDS);	

-- Initialisation des valeurs pour vgaDisplay
						  
	RED     <= '0'; 
	GREEN   <= '0';  
	BLUE    <= '0';  
	HSYNCH  <= '1';    
	VSYNCH  <= '1';              
                                
end Behavioral;

