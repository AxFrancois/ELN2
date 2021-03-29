----------------------------------------------------------------------------------
-- 
-- Engineer:       Renaud DAVIOT
-- 
-- Create Date:    2016 
--
-- File Name:      squareTestFunc.vhd 
-- Module Name:    squareTestFunc - Behavioral 
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

--=============================================================
--          __    
--  __   __/--\   
-- /**\_/==\--/  
--/***/#\==/_//  
--\__/##/_/ /    
--\ \__/  /       
-- \____/  LYON   
--  ___  ____   _______
-- / __||  _ \ | |
--/ /   | |_| ||  ====
--\ \_  |  __/ | |__
-- \__| |_|    |____|
--
--=============================================================


library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.STD_LOGIC_ARITH.ALL;
    use IEEE.STD_LOGIC_UNSIGNED.ALL;

------------------------------------------------------------------------------
------------------------------------------------------------------------------

entity squareTestFunc is
    port (  clk      : in  std_logic;
            CE_1s    : in  std_logic;
            pixelNbr : in  std_logic_vector (10 downto 0);
            lineNbr  : in  std_logic_vector (9 downto 0);
            hblank   : in  std_logic;
            vblank   : in  std_logic;
            ------------------------------------------------
            Rout     : out std_logic;
            Gout     : out std_logic;
            Bout     : out std_logic);
end squareTestFunc;

------------------------------------------------------------------------------
------------------------------------------------------------------------------

architecture Behavioral of squareTestFunc is

    signal nbrFunc      : integer range 0 to 64;
    
    signal rgb_out      : std_logic_vector(2 downto 0);
    signal rgb_square   : std_logic_vector(2 downto 0);
    signal rgb_squareBW : std_logic_vector(2 downto 0);

    -- 8 pixels square size
    signal macro_line   : std_logic_vector(6 downto 0); 
    signal macro_pixel  : std_logic_vector(6 downto 0);
    signal rgb_lines    : std_logic_vector(2 downto 0);
    signal rgb_FlagF    : std_logic_vector(2 downto 0);
    signal rgb_FlagB    : std_logic_vector(2 downto 0);
    
    -- Color Definitions * Red Green Blue
    constant black   : std_logic_vector(2 downto 0) :="000";
    constant blue    : std_logic_vector(2 downto 0) :="001";
    constant green   : std_logic_vector(2 downto 0) :="010";
    constant cyan    : std_logic_vector(2 downto 0) :="011";
    constant red     : std_logic_vector(2 downto 0) :="100";
    constant magenta : std_logic_vector(2 downto 0) :="101";
    constant yellow  : std_logic_vector(2 downto 0) :="110";
    constant white   : std_logic_vector(2 downto 0) :="111";
    
begin

    -- Display test screens each second
    counter_sel : process (clk)
    begin
        if (rising_edge(clk)) then
            if (CE_1s = '1') then
                nbrFunc <= nbrFunc + 1;
					 if (nbrFunc = 15) then
						nbrFunc <= 0;
					 end if;
            end if;
        end if;
    end process;
	 
    ---------------------------------------------------------------
    -- Select which test screen will be display and Test Screen 1 to 8         
    ---------------------------------------------------------------
    with nbrFunc select
        rgb_out <= black        when 0,
                   blue         when 1,
                   green        when 2,
                   cyan         when 3,
                   red          when 4,
                   magenta      when 5,
                   yellow       when 6,
                   white        when 7,
                   rgb_square   when 8,
                   rgb_squareBW when 9,
                   rgb_lines    when 10,
                   rgb_FlagF    when 11,
                   rgb_FlagB    when 12,
                   black        when others;
                   
 
    Rout <= '0' when ((hblank ='1') or  (vblank ='1')) else 
				rgb_out(2);
    Gout <= '0' when ((hblank ='1') or  (vblank ='1')) else 
				rgb_out(1);
    Bout <= '0' when ((hblank ='1') or  (vblank ='1')) else 
				rgb_out(0);  

    ---------------------------------------------------------------    
    -- Test Screen 9     
    ---------------------------------------------------------------
    with lineNbr(9) & pixelNbr(10 downto 9) select
        rgb_square <=   black   when "000",
                        blue    when "001",
                        green   when "010",
                        cyan    when "011",
                        red     when "100",
                        magenta when "101",
                        yellow  when "110",
                        white   when "111",
                        black   when others;
        
    ---------------------------------------------------------------    
    -- Test Screen 10      
    ---------------------------------------------------------------  
    with lineNbr(9) & pixelNbr(10 downto 9) select
        rgb_squareBW <= black when "000",
                        white when "001",
                        black when "010",
                        white when "011",
                        black when "100",
                        white when "101",
                        black when "110",
                        white when "111",
                        blue  when others;  
			
    ---------------------------------------------------------------
    -- Test Screen 11 to 13  
    ---------------------------------------------------------------
    macro_pixel(6 downto 0) <= pixelNbr(10 downto 4);  -- --> 100 macro pixels
    macro_line(6 downto 0)  <= lineNbr(9 downto 3);   -- --> 75  macro lines


    ---------------------------------------------------------------
    -- Test Screen 11   
    ---------------------------------------------------------------
    lines : process (macro_line, macro_pixel)
    begin
        if (((macro_line >= 10) and (macro_line <= 15))
            and ((macro_pixel >= 20) and (macro_pixel <= 80))) 
            then
            -- First line
            rgb_lines <= blue;
            
        elsif (((macro_line >= 30) and (macro_line <= 35))
            and ((macro_pixel >= 20) and (macro_pixel <= 80))) 
            then
            -- Second line
            rgb_lines <= green;
            
        elsif (((macro_line >= 65) and (macro_line <= 70))
            and ((macro_pixel >= 20) and (macro_pixel <= 80))) 
            then
            -- Third line
            rgb_lines <= red;
            
        else -- others
            rgb_lines <= black;
        end if;
    end process;
    
    
    ---------------------------------------------------------------
    -- Test Screen 12   
    ---------------------------------------------------------------
    FFlag : process (macro_line, macro_pixel)
    begin
        if (((macro_line >= 10) and (macro_line <= 65))
            and ((macro_pixel >= 20) and (macro_pixel <= 40))) 
            then
            -- First column
            rgb_FlagF <= blue;
            
        elsif (((macro_line >= 10) and (macro_line <= 65))
            and ((macro_pixel >= 40) and (macro_pixel <= 60))) 
            then
            -- Second column
            rgb_FlagF <= white;
            
        elsif (((macro_line >= 10) and (macro_line <= 65))
            and ((macro_pixel >= 60) and (macro_pixel <= 80))) 
            then
            -- Third column
            rgb_FlagF <= red;
            
        else -- others
            rgb_FlagF <= black;
        end if;
    end process;
    
    
    ---------------------------------------------------------------
    -- Test Screen 13   
    ---------------------------------------------------------------
    BFlag : process (macro_line, macro_pixel)
    begin
        if (((macro_line >= 10) and (macro_line <= 65))
            and ((macro_pixel >= 20) and (macro_pixel <= 40))) 
            then
            -- First column
            rgb_FlagB <= black;
            
        elsif (((macro_line >= 10) and (macro_line <= 65))
            and ((macro_pixel >= 40) and (macro_pixel <= 60))) 
            then
            -- Second column
            rgb_FlagB <= yellow;
            
        elsif (((macro_line >= 10) and (macro_line <= 65))
            and ((macro_pixel >= 60) and (macro_pixel <= 80))) 
            then
            -- Third column
            rgb_FlagB <= red;
            
        else -- others
            rgb_FlagB <= white;
        end if;
    end process;
        
                        
end Behavioral;

