----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2023 08:59:12 AM
-- Design Name: 
-- Module Name: tb_main - Behavioral
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

entity tb_main is
--  Port ( );
end tb_main;

architecture Behavioral of tb_main is

component main is 
      Port ( Clk : in STD_LOGIC;
            Reset : in STD_LOGIC;
            Greutate_maxima : in STD_LOGIC;
            Obstacol_usa : in STD_LOGIC;
            Viteza_deplasare : in STD_LOGIC;
            Tip_comanda : in STD_LOGIC;
            Comanda_etaj : in STD_LOGIC_VECTOR(3 downto 0);
            Timp_usi_deschise : in STD_LOGIC;
            Greutate_depasita : out STD_LOGIC;
            Obstacol_existent : out STD_LOGIC;
            Usa_deschisa : out STD_LOGIC;
            Sens_de_deplasare: in Std_logic;
            --Directie_de_mers : inout STD_LOGIC;
            Bec_comenzi_posibile : out STD_LOGIC;
            anode: out STD_LOGIC_VECTOR(7 downto 0);
            catode: out STD_LOGIC_VECTOR(6 downto 0)
            );
 end component;
 
 signal Clk_test : std_logic;
 signal Reset_test : std_logic;
 signal Greutate_maxima_test : std_logic;
 signal Obstacol_usa_test : std_logic;
 signal Viteza_deplasare_test : std_logic;
 signal Comanda_etaj_test : std_logic_vector ( 3 downto 0 );
 signal Timp_usi_deschise_test : std_logic;
 signal Etaj_curent_test : std_logic_vector (3 downto 0);
 signal Greutate_depasita_test : std_logic;
 signal Obstacol_existent_test : std_logic;
 signal Usa_deschisa_test : std_logic;
 signal Directie_de_mers_test : std_logic;
 signal Bec_comenzi_posibile_test : std_logic; 
 signal Tip_comanda_test : std_logic;
 signal Anode_test : std_logic_vector(7 downto 0);
 signal Catode_test : std_logic_vector(6 downto 0);
 signal Sens_de_deplasare_test : std_logic;

begin

clock_process :process
begin
     Clk_test <= '0';
     wait for 1 ns;
     Clk_test <= '1';
     wait for 1 ns;
end process;

Clock: main port map ( Clk_test, 
                       Reset_test, 
                       Greutate_maxima_test,
                       Obstacol_usa_test,
                       Viteza_deplasare_test,
                       Tip_comanda_test,
                       Comanda_etaj_test,
                       Timp_usi_deschise_test,
                       Greutate_depasita_test,
                       Obstacol_existent_test,
                       Usa_deschisa_test,
                       Sens_de_deplasare_test,
                       Bec_comenzi_posibile_test,
                       Anode_test, 
                       Catode_test);

process 
begin 

-- Reset
--Reset_test <= '1';
--wait for 20 ns;
Etaj_curent_test <=(others=> '0');
Reset_test <= '0';
Viteza_deplasare_test <= '1';
Timp_usi_deschise_test <= '0';
wait for 20 ns;

Greutate_maxima_test <= '0';
Obstacol_usa_test <='0';
Tip_comanda_test <= '0';
Comanda_etaj_test <= "0101";
wait for 20 ns ;

Tip_comanda_test <= '1';
Sens_de_deplasare_test <= '0';
Comanda_etaj_test <= "0011";
wait for 20 ns;

Tip_comanda_test <= '1';
Sens_de_deplasare_test <= '1';
Comanda_etaj_test <= "0111";
wait for 20 ns;

Tip_comanda_test <= '1';
Sens_de_deplasare_test <= '0';
Comanda_etaj_test <= "1001";
wait for 70 ns; --3*4+5


Greutate_maxima_test <= '1';
wait for 20 ns;


Greutate_maxima_test <= '0';
Obstacol_usa_test <= '0';
wait for 20 ns;


end process;
end Behavioral;
