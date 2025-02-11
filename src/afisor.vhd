----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2023 02:42:34 PM
-- Design Name: 
-- Module Name: afisor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity afisor is
  Port ( clk: IN std_logic;
         intrare: IN std_logic_vector (3 downto 0);
         anode: OUT std_logic_vector (7 downto 0);
         catode: OUT std_logic_vector (6 downto 0) );
end afisor;

architecture Behavioral of afisor is
component mux is
  Port (
        sel: IN std_logic_vector (2 downto 0);
        ies: OUT std_logic_vector (7 downto 0) );
end component mux;

component numarator_n_biti is
 generic (nr_biti : integer :=4);
 Port ( 
        clk: IN std_logic;
  		enable : IN std_logic;
  		reset : IN std_logic;
  		load : IN std_logic;
  		direction : IN std_logic;
  		init_nr : IN std_logic_vector (nr_biti-1 downto 0);
  		max: IN std_logic_vector(nr_biti-1 downto 0);
  		
  		flag : OUT std_logic;
  		count_nr : OUT std_logic_vector (nr_biti-1 downto 0));
end component numarator_n_biti;

component decodificator is
 Port ( intrare: IN std_logic_vector (3 downto 0);
        iesire1: OUT std_logic_vector (3 downto 0); -- 0 pe mux -- cel mai important digit (zecile)
        iesire2: OUT std_logic_vector(3 downto 0) ); --1 pe mux -- cel mai nesemnificativ digit (unitatile)
end component decodificator;

component dec_7_segm is
 Port ( hex_in: IN std_logic_vector (3 downto 0);
        a_b_c_d_e_f_g: OUT std_logic_vector (6 downto 0) );
end component dec_7_segm;

component mux2 is
  Port (intr1: IN std_logic_vector (3 downto 0);
        intr2: IN std_logic_vector (3 downto 0);
        sel: IN std_logic_vector (2 downto 0);
        ies: OUT std_logic_vector (3 downto 0) );
end component mux2;

--declarare semnale
signal enable_numarator: std_logic := '1';
signal reset_numarator: std_logic;
signal load_numarator: std_logic := '0';
signal direction_numarator: std_logic := '0';
signal init_nr_numarator: std_logic_vector(16 downto 0);
signal count_nr_numarator: std_logic_vector(16 downto 0);
signal flag_numarator: std_logic;
signal iesire1_trad: std_logic_vector (3 downto 0);
signal iesire2_trad: std_logic_vector (3 downto 0);
signal info_ssd: std_logic_vector(3 downto 0);
signal max: std_logic_vector(16 downto 0):="11111111111111111";
begin
divizor: numarator_n_biti generic map (17)
                           port map(clk, enable_numarator, reset_numarator, load_numarator, direction_numarator, init_nr_numarator, max, flag_numarator, count_nr_numarator ) ;
mux_anode: mux port map(count_nr_numarator(16 downto 14), anode);
traducator: decodificator port map (intrare, iesire1_trad, iesire2_trad);
mux_catode: mux2 port map(iesire1_trad, iesire2_trad, count_nr_numarator(16 downto 14),info_ssd); 
ssd: dec_7_segm port map(info_ssd, catode);
end Behavioral;
