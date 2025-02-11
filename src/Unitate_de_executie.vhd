----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2023 02:21:46 PM
-- Design Name: 
-- Module Name: Unitate_de_executie - Behavioral
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

entity Unitate_de_executie is
  Port ( 
    clk: IN std_logic;
    master_reset: IN std_logic;
    enable_numarator1: IN std_logic;
    intrare_numarator1: IN std_logic_vector(1 downto 0);
    
    enable_numarator2: IN std_logic;
    intrare_numarator2: IN std_logic_vector(3 downto 0);
    load_numarator2: IN std_logic;
    dir_numarator2: IN std_logic;
    
    enable_numarator3: IN std_logic;
    intrare_numarator3: IN std_logic_vector(1 downto 0);
    
    enable_numarator4: IN std_logic;
    intrare_numarator4: IN std_logic_vector(3 downto 0);
    load_numarator4: IN std_logic;
    dir_numarator4: IN std_logic;
    
    enable_numarator5: IN std_logic;
    
    adresa_memorie: IN std_logic_vector(3 downto 0);
    intrare_memorie: IN std_logic_vector(1 downto 0);
    write_enable_memorie: IN std_logic;
    intrare_decod: IN std_logic;
    
    fin_numarator1: OUT std_logic;
    fin_numarator2: OUT std_logic;
    fin_numarator3: OUT std_logic;
    fin_numarator4: OUT std_logic;
    fin_numarator5: OUT std_logic;
    iesire_decod: OUT std_logic_vector(1 downto 0);
    date_memorie: OUT std_logic_vector(1 downto 0);
    catode: OUT std_logic_vector (6 downto 0);
    anode: OUT std_logic_vector (7 downto 0)

  );
  
end Unitate_de_executie;

architecture Behavioral of Unitate_de_executie is
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

component ram_mem
PORT (
  		ADDR  : IN std_logic_vector (3 downto 0);
  		Write_Enable : IN std_logic;
  		INTR: IN std_logic_vector (1 downto 0);
  		CS    : IN std_logic; -- asta nu stiu de ce e aici, dar era in lab, asa ca l-am lasat
  		DATE : OUT std_logic_vector (1 downto 0);
  		clk : IN std_logic);
end component ram_mem;

component mux_dub is
 Port ( intrare: IN std_logic;
        iesire: out std_logic_vector(1 downto 0) );
end component mux_dub;

component afisor is
  Port ( clk: IN std_logic;
         intrare: IN std_logic_vector (3 downto 0);
         anode: OUT std_logic_vector (7 downto 0);
         catode: OUT std_logic_vector (6 downto 0) );
end component afisor;

component divizor_frecventa is
  Port (
        clk: IN std_logic;
        div_clk: OUT std_logic );
end component divizor_frecventa;

-- declarare semnale pt a face componentele
signal load_numarator1: std_logic :='0';
signal dir_numarator1: std_logic := '0';
signal iesire_numarator1: std_logic_vector(1 downto 0);

signal iesire_numarator2: std_logic_vector(3 downto 0);

signal load_numarator3: std_logic :='0';
signal dir_numarator3: std_logic := '0';
signal iesire_numarator3: std_logic_vector(1 downto 0);

signal load_numarator5: std_logic :='0';
signal intrare_numarator5: std_logic_vector(2 downto 0) :="101";
signal dir_numarator5: std_logic := '0';
signal iesire_numarator5: std_logic_vector(2 downto 0);

signal iesire_numarator4: std_logic_vector(3 downto 0);

signal cs: std_logic;

signal div_clk: std_logic;
signal max1: std_logic_vector(1 downto 0):="11";
signal max2: std_logic_vector(3 downto 0):="1100";
signal max3: std_logic_vector (1 downto 0) :="11";
signal max4: std_logic_vector (3 downto 0):="1100";
signal max5: std_logic_vector(2 downto 0):="101";

begin
div_frecv: divizor_frecventa port map (clk, div_clk);
numarator_timp_usi_deschise: numarator_n_biti generic map(2)
                            port map(div_clk, enable_numarator1, master_reset, load_numarator1, dir_numarator1, intrare_numarator1, max1, fin_numarator1, iesire_numarator1 );
numarator_deplasare: numarator_n_biti generic map(4)
                    port map(div_clk, enable_numarator2, master_reset, load_numarator2, dir_numarator2, intrare_numarator2,max2, fin_numarator2, iesire_numarator2);
numarator_timp_intre_etaje: numarator_n_biti generic map(2)
                            port map(div_clk, enable_numarator3, master_reset, load_numarator3, dir_numarator3, intrare_numarator3, max3, fin_numarator3, iesire_numarator3);
numarator_probare:numarator_n_biti generic map(4)
                            port map(div_clk, enable_numarator4, master_reset, load_numarator4, dir_numarator4, intrare_numarator4, max4, fin_numarator4, iesire_numarator4);
numarator_timp_introducere_comanda:numarator_n_biti generic map(3)
                            port map(div_clk, enable_numarator5, master_reset, load_numarator5, dir_numarator5, intrare_numarator5, max5, fin_numarator5, iesire_numarator5);
decodificator: mux_dub port map(intrare_decod, iesire_decod);
memorie: ram_mem port map(adresa_memorie, write_enable_memorie, intrare_memorie, cs, date_memorie, div_clk);
ssd: afisor port map (clk, iesire_numarator2, anode, catode); 
end Behavioral;
