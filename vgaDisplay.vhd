----------------------------------------------------------------------------------
-- 
-- Engineer:       Renaud DAVIOT
-- 
-- Create Date:    2016 
--
-- File Name:      vgaDisplay.vhd 
-- Module Name:    vgaDisplay - Behavioral 
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
	
entity vgaDisplay is 
   port (       CLK       : in  std_logic;
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
                ----------------------------------------------
                HSYNCH    : out std_logic;
                VSYNCH    : out std_logic;
                RED       : out std_logic;
                BLUE      : out std_logic;
                GREEN     : out std_logic            
                );
end vgaDisplay;


architecture behavioral of vgaDisplay is

    component vgaCore  
        port (  clk         : in std_logic;
                reset       : in std_logic;
                --------------------------
                hsynch      : out std_logic;
                vsynch      : out std_logic;
                hblank      : out std_logic; 
                vblank      : out std_logic;
                pixelNbr    : out std_logic_vector(10 downto 0);
                lineNbr     : out std_logic_vector(9 downto 0)
                );
    end component vgaCore ;
    
    
    component squareTestFunc
        port (  clk      : in  std_logic;
                CE_1s    : in  std_logic;
                pixelNbr : in  std_logic_vector (10 downto 0);
                lineNbr  : in  std_logic_vector (9 downto 0);
                hblank   : in  std_logic;
                vblank   : in  std_logic;
                ------------------------------------------------
                Rout     : out std_logic;
                Gout     : out std_logic;
                Bout     : out std_logic
                );
    end component squareTestFunc;
    
    component timeScoreFunc 
        port (  clk      : in  std_logic;
                CE_1s    : in  std_logic;
                pixelNbr : in  std_logic_vector (10 downto 0);
                lineNbr  : in  std_logic_vector (9 downto 0);
                hblank   : in  std_logic;
                vblank   : in  std_logic;
                sec_unit : in  std_logic_vector(3 downto 0);
                sec_dec  : in  std_logic_vector(3 downto 0);
                min_unit : in  std_logic_vector(3 downto 0);
                min_dec  : in  std_logic_vector(3 downto 0);
                vis_unit : in  std_logic_vector(3 downto 0);
                vis_dec  : in  std_logic_vector(3 downto 0);
                loc_unit  : in  std_logic_vector(3 downto 0);
                loc_dec   : in  std_logic_vector(3 downto 0);
                ------------------------------------------------
                Rout     : out std_logic;
                Gout     : out std_logic;
                Bout     : out std_logic
                );
    end component timeScoreFunc;

    component mux_2x3b 
        port (A0, A1, A2 : in  std_logic; 
              B0, B1, B2 : in  std_logic; 
              sel        : in  std_logic; 
              O0, O1, O2 : out std_logic);
    end component mux_2x3b;
    
   
    component register_5b  
        port (  clk    : in  std_logic;
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
    end component register_5b;

    ------------------------------------    

    SIGNAL CLKint    : std_logic;

    SIGNAL hsynch_int : std_logic;
    SIGNAL vsynch_int : std_logic;

    SIGNAL pixel      : std_logic_vector (10 downto 0); 
    SIGNAL line       : std_logic_vector (9 downto 0);

    SIGNAL hblank     :  std_logic; 
    SIGNAL vblank     :  std_logic; 

    SIGNAL squareR    : std_logic;
    SIGNAL squareB    : std_logic;
    SIGNAL squareG    : std_logic;

    SIGNAL timeR      : std_logic;
    SIGNAL timeG      : std_logic;
    SIGNAL timeB      : std_logic;

    SIGNAL Rint       : std_logic;
    SIGNAL Bint       : std_logic;  
    SIGNAL Gint       : std_logic;
  
begin
    
    CLKint <= CLK;

    U0 : vgaCore 
            port map (  clk      => CLKint,
                        reset    => VGAONOFF,
                        --------------------------------
                        hsynch   => hsynch_int,
                        vsynch   => vsynch_int,
                        hblank   => hblank,
                        vblank   => vblank,
                        pixelNbr => pixel,
                        lineNbr  => line);  

    U1 : squareTestFunc 
            port map (  clk      => CLKint,
                        CE_1s    => CE_1s,
                        pixelNbr => pixel,
                        lineNbr  => line,
                        hblank   => hblank,
                        vblank   => vblank,
                        --------------------------------
                        Rout     => squareR,
                        Gout     => squareG,
                        Bout     => squareB);  

    U2 : timeScoreFunc 
            port map (  clk      => CLKint,
                        CE_1s    => CE_1s,
                        pixelNbr => pixel,
                        lineNbr  => line,
                        hblank   => hblank,
                        vblank   => vblank,
                        sec_unit => sec_unit,
                        sec_dec  => sec_dec,
                        min_unit => min_unit,
                        min_dec  => min_dec,
                        vis_unit => vis_unit,
                        vis_dec  => vis_dec,
                        loc_unit  => loc_unit,
                        loc_dec   => loc_dec,
                        --------------------------------
                        Rout     => timeR,
                        Gout     => timeG,
                        Bout     => timeB);  

    U3 : mux_2x3b 
            port map (  A0      => squareR,
                        A1      => squareB,
                        A2      => squareG,
                        B0      => timeR,
                        B1      => timeB,
                        B2      => timeG,
                        sel     => TESTVGA,
                        --------------------------------
                        O0      => Rint,
                        O1      => Bint,
                        O2      => Gint);  

    U4 : register_5b 
            port map (  clk     => CLKint,
                        D0      => hsynch_int,
                        D1      => vsynch_int,
                        D2      => Rint,
                        D3      => Bint,
                        D4      => Gint,
                        --------------------------------
                        Q0      => HSYNCH,
                        Q1      => VSYNCH,
                        Q2      => RED,
                        Q3      => BLUE,
                        Q4      => GREEN);  


end behavioral;
