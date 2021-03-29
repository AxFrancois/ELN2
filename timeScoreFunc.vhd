----------------------------------------------------------------------------------
-- 
-- Engineer:       Renaud DAVIOT
-- 
-- Create Date:    2016 
--
-- File Name:      timeScoreFunc.vhd 
-- Module Name:    timeScoreFunc - Behavioral 
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
    use IEEE.STD_LOGIC_1164.all;
    use IEEE.STD_LOGIC_ARITH.all;
    use IEEE.STD_LOGIC_UNSIGNED.all;

------------------------------------------------------------------------------
------------------------------------------------------------------------------

entity timeScoreFunc is 
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
            Bout     : out std_logic);
end timeScoreFunc;

------------------------------------------------------------------------------
------------------------------------------------------------------------------

architecture static_display of timeScoreFunc is

    component dataROM  
        port (  	address : in  std_logic_vector(6 downto 0);
						bitnbr  : in  std_logic_vector(1 downto 0);
						data    : out std_logic);
    end component;
    
    -----------------------------------------------------------

	signal address : std_logic_vector(6 downto 0);
	signal bitnbr  : std_logic_vector(1 downto 0);
	signal data    : std_logic;
	
	
    signal rgb_out      : std_logic_vector(2 downto 0);
	
    -- 8 pixels square size
    signal macro_line   : std_logic_vector(6 downto 0); 
    signal macro_pixel  : std_logic_vector(6 downto 0);
	 
	 
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


    ---------------------------------------------------------------
    -- Reduced screen 
    ---------------------------------------------------------------
    macro_pixel(6 downto 0) <= pixelNbr(10 downto 4);  -- --> 100 macro pixels; 1 macro pixel = 8 pixels
    macro_line(6 downto 0)  <= lineNbr(9 downto 3);   -- --> 75  macro lines; 1 macro line = 8 lines
	 
	 ----------------------------------------------------------------------------------------
	 
    display_ScoreTime : process (macro_line, macro_pixel, min_dec, min_unit, sec_dec, sec_unit, loc_dec, loc_unit, vis_dec, vis_unit, data)
    begin
	 	  -- Minute Decimal
        if (((macro_pixel >= 32) and (macro_pixel <= 35))
            and ((macro_line >= 16) and (macro_line <= 23))) 
            then
				
            address(6 downto 0) <= min_dec(3 downto 0) & macro_line(2 downto 0);
				bitnbr(1 downto 0)  <= macro_pixel(1 downto 0);
				
				-- Display data	
				if (data ='1')	then 
					rgb_out <= white;
				else
					rgb_out <= black;
				end if;
				
		  -- Minute Unit    
		  elsif (((macro_pixel >= 40) and (macro_pixel <= 43))
            and ((macro_line >= 16) and (macro_line <= 23))) 
            then
				
            address(6 downto 0) <= min_unit(3 downto 0) & macro_line(2 downto 0);
				bitnbr(1 downto 0)  <= macro_pixel(1 downto 0);
				
				-- Display data	
				if (data ='1')	then 
					rgb_out <= white;
				else
					rgb_out <= black;
				end if;
			
		  -- Dots 	
		  elsif ((macro_pixel = 48) and ((macro_line = 18) or (macro_line = 21))) then

				
				rgb_out <= white;
				
				
		  -- Seconds Decimal
		  elsif (((macro_pixel >= 52) and (macro_pixel <= 55))
            and ((macro_line >= 16) and (macro_line <= 23))) 
            then
				
            address(6 downto 0) <= sec_dec(3 downto 0) & macro_line(2 downto 0);
				bitnbr(1 downto 0)  <= macro_pixel(1 downto 0);
				
				-- Display data	
				if (data ='1')	then 
					rgb_out <= white;
				else
					rgb_out <= black;
				end if;
				
	     -- Seconds Unit		  
		  elsif (((macro_pixel >= 60) and (macro_pixel <= 63))
            and ((macro_line >= 16) and (macro_line <= 23))) 
            then
				
            address(6 downto 0) <= sec_unit(3 downto 0) & macro_line(2 downto 0);
				bitnbr(1 downto 0)  <= macro_pixel(1 downto 0);
				
				-- Display data	
				if (data ='1')	then 
					rgb_out <= white;
				else
					rgb_out <= black;
				end if;
							
				
    ----------------------------------------------------------------------------------------
	 	  
	 	  -- Local Decimal
		 elsif (((macro_pixel >= 32) and (macro_pixel <= 35))
            and ((macro_line >= 48) and (macro_line <= 55))) 
            then
				
            address(6 downto 0) <= loc_dec(3 downto 0) & macro_line(2 downto 0);
				bitnbr(1 downto 0)  <= macro_pixel(1 downto 0);
				
				-- Display data	
				if (data ='1')	then 
					rgb_out <= cyan;
				else
					rgb_out <= black;
				end if;
				
		  -- Local Unit    
		  elsif (((macro_pixel >= 40) and (macro_pixel <= 43))
            and ((macro_line >= 48) and (macro_line <= 55))) 
            then
				
            address(6 downto 0) <= loc_unit(3 downto 0) & macro_line(2 downto 0);
				bitnbr(1 downto 0)  <= macro_pixel(1 downto 0);
				
				-- Display data	
				if (data ='1')	then 
					rgb_out <= cyan;
				else
					rgb_out <= black;
				end if;
			
		  -- Dots 	
		  elsif (((macro_pixel >= 46) and (macro_pixel <= 49)) and ((macro_line = 51) or (macro_line = 52))) then

				
				rgb_out <= cyan;
				
				
		  -- Visitor Decimal
		  elsif (((macro_pixel >= 52) and (macro_pixel <= 55))
            and ((macro_line >= 48) and (macro_line <= 55))) 
            then
				
            address(6 downto 0) <= vis_dec(3 downto 0) & macro_line(2 downto 0);
				bitnbr(1 downto 0)  <= macro_pixel(1 downto 0);
				
				-- Display data	
				if (data ='1')	then 
					rgb_out <= cyan;
				else
					rgb_out <= black;
				end if;
				
	     -- Visitor Unit		  
		  elsif (((macro_pixel >= 60) and (macro_pixel <= 63))
            and ((macro_line >= 48) and (macro_line <= 55))) 
            then
				
            address(6 downto 0) <= vis_unit(3 downto 0) & macro_line(2 downto 0);
				bitnbr(1 downto 0)  <= macro_pixel(1 downto 0);
				
				-- Display data	
				if (data ='1')	then 
					rgb_out <= cyan;
				else
					rgb_out <= black;
				end if;
				
		  -- Default		
		  else
				rgb_out <= black ;
        end if;
    end process display_ScoreTime;
	 
	 
    ----------------------------------------------------------------------------------------


    -- Character generator memory instantiation
    U0 : dataROM 
				  port map (  address => address,
								  bitnbr  => bitnbr,
								  data    => data);	
	
	 -- Color enable in Active Video only  
    Rout <= '0' when ((hblank ='1') or  (vblank ='1')) else 
				rgb_out(2);
    Gout <= '0' when ((hblank ='1') or  (vblank ='1')) else 
				rgb_out(1);
    Bout <= '0' when ((hblank ='1') or  (vblank ='1')) else 
				rgb_out(0);  

    ----------------------------------------------------------------------------------------

end static_display;