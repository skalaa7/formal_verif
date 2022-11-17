library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity zad10 is
	port(
		clk: in std_logic;
		--zad1
		rt1: out std_logic;
		rdy1: out std_logic;
		start1: out std_logic;
		endd1: out std_logic;
		--zad2
		er2: out std_logic;
		--zad3
		er3: out std_logic;
		rdy3: out std_logic;
		--zad4
		rdy4: out std_logic;
		start4: out std_logic;
		--zad5
		endd5: out std_logic;
		stop5: out std_logic;
		er5: out std_logic;
		rdy5: out std_logic;
		start5: out std_logic;
		--zad6
		endd6: out std_logic;
		stop6: out std_logic;
		er6: out std_logic;
		rdy6: out std_logic;
		--zad7
		endd7: out std_logic;
		start7: out std_logic;
		status_valid7: out std_logic;
		instartsv7: out std_logic;
		--zad8
		rt8: out std_logic;
		enable8: out std_logic;
		--zad9
		rdy9: out std_logic;
		start9: out std_logic;
		interrupt9: out std_logic;
		--zad10
		ack10: out std_logic;
		req10: out std_logic;
		--zad11
		p11: out std_logic;
		p12: out std_logic;
		p21: out std_logic;
		p22: out std_logic;
		p31: out std_logic;
		p41: out std_logic;
		p51: out std_logic;
		p52: out std_logic
	);
end zad10;
architecture rtl of zad10 is
	signal cnt: unsigned(3 downto 0):=X"0";
begin
	process(clk)
	begin
		if(rising_edge(clk) then
			cnt<=cnt+X"1";
		end if;
	end process;
	--zad1
	with cnt select
		rt1<='1' when x"0"|x"1"|x"2"|x"3"|x"8",
		     '0' when others;
	with cnt select
		rdy1<='1' when x"5",
			  '0' when others;
	with cnt select
		start1<='1' when x"8",
		        '0' when others;		 
    with cnt select
		end1<='1' when x"6",
		      '0' when others;
			  
	--zad2
	with cnt select
		er2<='1' when x"1"|x"2"|x"6"|x"7"|x"8"|x"9",
		     '0' when others;
	
	--zad3
	with cnt select
		er3<='1' when x"1"|x"5"|x"6"|x"9",
		     '0' when others;
	with cnt select
		rdy3<='1' when x"1"|x"2"|x"5"|x"9",
			  '0' when others;
			  
	
end rtl;