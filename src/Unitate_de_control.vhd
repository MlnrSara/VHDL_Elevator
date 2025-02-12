----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2023 05:14:59 PM
-- Design Name: 
-- Module Name: Unitate_de_control - Behavioral
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
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Unitate_de_control is
    Port ( clk: in STD_LOGIC;
           Reset : in STD_LOGIC;
           Greutate_maxima : in STD_LOGIC;
           Obstacol_usa : in STD_LOGIC;
           Comanda_etaj : in STD_LOGIC_VECTOR (3 downto 0);-- event
           Viteza_deplasare : in STD_LOGIC; -- va fi 0 pt 1s si 1 pt 3s
           Timp_usi_deschise : in STD_LOGIC;
           
           --Destinatie: in STD_LOGIC_VECTOR(3 downto 0);
           
           Fin_cnt_usi_deschise: in STD_LOGIC;
           Fin_cnt_urcare_un_etaj: in STD_LOGIC;
           Fin_cnt_deplasare: in STD_LOGIC;
           Fin_cnt_probare: in STD_LOGIC;
           Fin_cnt_numarator_introducere_comanda : in STD_LOGIC;
           
           Count_numarator_deplasare: in STD_LOGIC_VECTOR(3 downto 0);
           Count_numarator_probare: in STD_LOGIC_VECTOR(3 downto 0);
           Iesire_memorie: in STD_LOGIC_VECTOR(1 downto 0);
           Tip_comanda: in STD_LOGIC; -- va fi 1 daca e comanda din exterior si 0 daca e comanda din interior
           
           --Comanda_noua : in STD_LOGIC;
           --Am_ajuns_la_destinatie : in STD_LOGIC;
           --Comenzi_urmatoare: in STD_LOGIC;
           Sens_de_deplasare : in STD_LOGIC;
           Directie_de_mers : inout STD_LOGIC;
           
           
           Load_numarator_deplasare: out STD_LOGIC;
           Load_numarator_probare: out STD_LOGIC;
           Initializare_numarator_deplasare : out STD_LOGIC_VECTOR(3 downto 0);
           Initializare_numarator_probare : out STD_LOGIC_VECTOR(3 downto 0);
           Initializare_numarator_urcare_un_etaj : out STD_LOGIC_VECTOR(1 downto 0);
           Initializare_numarator_timp_usi_deschise : out STD_LOGIC_VECTOR(1 downto 0);
           
           Adresa_memorie: out STD_LOGIC_VECTOR(3 downto 0);  
           Intrare_memorie: out STD_LOGIC_VECTOR(1 downto 0);
           Write_enable : out std_logic;
           Iesire_decod : in std_logic_vector(1 downto 0);
           Intrare_decod : out std_logic;
           
           Enable_numarator_urcare_un_etaj: out STD_LOGIC;
           Enable_numarator_usi_deschise :out STD_LOGIC;
           Enable_numarator_deplasare :out STD_LOGIC;
           Enable_numarator_probare :out STD_LOGIC;
           Enable_numarator_introducere_comanda : out STD_LOGIC;
           
           Greutate_depasita : out STD_LOGIC;
           Obstacol_existent : out STD_LOGIC;
           Usa_deschisa : out STD_LOGIC;
           
           
           
           Bec_comenzi_posibile : out STD_LOGIC);
       
end Unitate_de_control;

architecture Behavioral of Unitate_de_control is

type stare_t is (Initializare, Asteptare_usi_deschise, Asteptare_introducere_etaj, Pregatire_deplasare, Verificare_piedici, Inchidere_usi, Deplasare, 
    Verificare_comenzi, Verificare_etaj, Deschidere_usi, Verificare_etaj_directie_de_mers);
signal Stare, Nx_Stare : stare_t;    
signal Etaj_curent : std_logic_vector(3 downto 0) := "0000"; 
signal Destinatie : std_logic_vector(3 downto 0);

begin

act_stare : process(clk, Reset)
begin
if Reset = '1' then
    Stare <= Initializare;
elsif clk'event and clk = '1' then
    Stare <= Nx_Stare;
end if;
end process;



tranzitii: process(Stare, Fin_cnt_usi_deschise, Fin_cnt_urcare_un_etaj, 
Fin_cnt_deplasare, Fin_cnt_probare, Fin_cnt_numarator_introducere_comanda,
            Greutate_maxima, Obstacol_usa, Comanda_etaj)
Variable  Registru_gol: INTEGER := 0;

begin
    Obstacol_existent <= '0';
    Enable_numarator_usi_deschise <= '0';
    Enable_numarator_urcare_un_etaj <= '0';
    Enable_numarator_deplasare <= '0';
    Enable_numarator_probare <= '0';
    Enable_numarator_introducere_comanda <= '0';
    Usa_deschisa <= '1';
    Load_numarator_deplasare <= '0';
    Load_numarator_probare <= '0';
    Directie_de_mers <= '0';
    Bec_comenzi_posibile <= '0';
    Etaj_curent <= "0000";
    
    case Stare is  
        when Initializare => 
            Intrare_decod <= Viteza_deplasare;
            Initializare_numarator_urcare_un_etaj <= Iesire_decod;
            Intrare_decod <= Timp_usi_deschise;
            Initializare_numarator_timp_usi_deschise <= Iesire_decod;
            Nx_stare <= Asteptare_usi_deschise;
            Etaj_curent <= Count_numarator_deplasare;
        when Asteptare_usi_deschise =>
               if Comanda_etaj = Etaj_curent then
                Nx_stare <= Asteptare_usi_deschise;
            else 
                Enable_numarator_introducere_comanda <= '1';
                Nx_stare <= Asteptare_introducere_etaj;
            end if;
        when Asteptare_introducere_etaj =>
            if Fin_cnt_numarator_introducere_comanda = '1' then 
                Registru_gol := Registru_gol+1;
                Destinatie <= Comanda_etaj;
                Intrare_memorie(1) <= '1';
                Adresa_memorie <= Comanda_etaj;
                Write_enable <= '1';
                if Tip_comanda = '1' then 
                    Intrare_memorie(0) <= Sens_de_deplasare;
                else if Comanda_etaj > Etaj_curent then 
                        Intrare_memorie(0) <= '0';
                        Directie_de_mers <= '0'; 
                    else 
                        Intrare_memorie(0) <= '1';
                        Directie_de_mers <= '1';
                    end if;
                end if;
                Nx_stare <= Pregatire_deplasare;    
            else 
                Nx_stare <= Asteptare_introducere_etaj;
            end if;
        when Pregatire_deplasare =>
            if Greutate_maxima = '0' then
                Nx_stare <= Verificare_piedici;
            else 
                Greutate_depasita <= '1';
                Nx_stare <= Pregatire_deplasare;
            end if;
        when Verificare_piedici =>
            if Obstacol_usa = '0' then
                Enable_numarator_usi_deschise <= '1';
                Nx_stare <= Inchidere_usi;
                if Fin_cnt_usi_deschise = '0' then 
                    Nx_stare <= Verificare_piedici;
                else 
                    Nx_stare <= Inchidere_usi;
                end if;
            else 
                Obstacol_existent <= '1';
                Nx_stare <= Pregatire_deplasare;
            end if;
        when Inchidere_usi => 
            if Fin_cnt_usi_deschise   = '1' then 
                Enable_numarator_deplasare <= '1';
                Nx_stare <= Deplasare;
                Usa_deschisa <= '0';
            else 
                Nx_stare <= Inchidere_usi;
            end if;
        when Deplasare => 
            Bec_comenzi_posibile <= '1';
            Enable_numarator_urcare_un_etaj <= '1';
            if Fin_cnt_urcare_un_etaj = '0' then
                Nx_stare <= Deplasare;
            else 
                Initializare_numarator_deplasare <= Destinatie;
                Load_numarator_deplasare <='1';
                Enable_numarator_urcare_un_etaj <= '1';
                Nx_stare <= Verificare_comenzi;
            end if;
        when Verificare_comenzi =>
            Write_enable <= '0';
            Adresa_memorie <= Comanda_etaj;
            if Iesire_memorie (1) ='0' then
                Write_enable <= '1';
                Adresa_memorie <= Comanda_etaj;
                Intrare_memorie(1) <= '1';
                Intrare_memorie(0) <= Sens_de_deplasare;
                Registru_gol := Registru_gol+1; 
            end if ;
            Nx_stare <= Verificare_etaj;
        when Verificare_etaj =>
            Enable_numarator_deplasare <= '0';
            Adresa_memorie <= Count_numarator_deplasare;
            Write_enable <= '0';
            if Iesire_memorie(1) = '1' then
                Adresa_memorie <= Count_numarator_deplasare;
                Write_enable <= '1';
                Intrare_memorie <= "00";
                Registru_gol := Registru_gol-1;
                Nx_stare <= Deschidere_usi;
            else 
                Nx_stare <= Deplasare;
            end if;
        when Deschidere_usi => 
            Usa_deschisa <= '1';
            if Registru_gol = 0 then
                Nx_stare <= Asteptare_usi_deschise;
            else 
                Nx_stare <= Verificare_etaj_directie_de_mers;
            end if;
            Etaj_curent <= Count_numarator_deplasare;
            Initializare_numarator_probare <= Etaj_curent;
            Load_numarator_probare <= '1';
        when Verificare_etaj_directie_de_mers => 
            Enable_numarator_probare <= '1';
            Write_enable <= '0';
            Adresa_memorie <= Count_numarator_probare;
            if Iesire_memorie(1) = '1' then
                Nx_stare <= Pregatire_deplasare;
            else if Fin_cnt_probare = '1' then 
                Directie_de_mers <= not Directie_de_mers;
                Nx_stare <= Pregatire_deplasare;
                else Nx_stare <= Verificare_etaj_directie_de_mers;
            end if;
            end if;
        end case;
end process;
end Behavioral;