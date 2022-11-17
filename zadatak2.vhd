library ieee;
use ieee.std_logic_1164.all;
entity zadatak2 is    
port(        
	rst : in  std_logic;
        clk   : in  std_logic;
        a     : in  std_logic;
        b     : in  std_logic;
        c     : in  std_logic;
        d     : in  std_logic;
        e     : in  std_logic;
        f     : in  std_logic;
	g     : in  std_logic;
        h     : in  std_logic;
		--EN    : in std_logic;
        o1    : out std_logic;
        o2    : out std_logic        
);end zadatak2;

architecture arch of zadatak2 is    
signal sel: std_logic_vector(3 downto 0);
signal o1_reg, o1_next : std_logic;
signal o2_reg, o2_next : std_logic;
signal EN : std_logic;
signal DO_decoder1, D1_decoder1, D2_decoder1, D3_decoder1:std_logic;
signal DO_decoder2, D1_decoder2, D2_decoder2, D3_decoder2: std_logic;


component decoder is
port( E : in STD_LOGIC;
	 A0,A1: in STD_LOGIC;
	 A,B,C,D: out STD_LOGIC);
end component;

begin
	 --psl default clock is rising_edge(clk);
	 --psl P1 : assert always (o1 = o2);
	EN <= '1';

	o1_next <= (( ( not a and not b and not c and not e and not f) or (a and not b and not c and  e and not f) or
             (not a and b and not c and not e and f) or (a and b and not c and e and f) or (not a and not b and c and not g and not h) or
             (a and not b and c and  g and not h)  or (not a and b and c and not g and h) or
             (a and b and c and g and h)) and (not d)) or d;

	decoder1 : decoder PORT MAP (E => EN,
					A0 => e,
					A1 => f,
					A => DO_decoder1,
					B => D1_decoder1,
					C => D2_decoder1,
					D =>D3_decoder1); 

	decoder2 : decoder PORT MAP (E => EN,
					A0 => g,
					A1 => h,
					A => DO_decoder2,
					B => D1_decoder2,
					C => D2_decoder2,
					D=>D3_decoder2);  

	reg_proc : process(clk, rst)
	begin        
		if (rst = '1') then
			o1_reg <= '0';
			o2_reg <= '0';
		elsif rising_edge(clk) then
			o1_reg <= o1_next;
			o2_reg <= o2_next;                   
		end if; 
	end process reg_proc;

	o2 <= o2_reg;
	o1 <= o1_reg;
	sel <= d & c & b & a;	

	with sel select        
	o2_next <= DO_decoder1 when "0000",
			   D1_decoder1 when "0001",
			   D2_decoder1 when "0010",	
			   D3_decoder1 when "0011",
			   DO_decoder2 when "0100",
			   D1_decoder2 when "0101",
			   D2_decoder2 when "0110",
			   D3_decoder2 when "0111",
			   EN         when others;

end arch;
	
		 



