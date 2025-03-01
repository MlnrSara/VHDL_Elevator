----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2023 06:33:48 PM
-- Design Name: 
-- Module Name: tb_mux_dub - Behavioral
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

entity tb_mux_dub is
--  Port ( );
end tb_mux_dub;

architecture Behavioral of tb_mux_dub is
component mux_dub is
 Port ( intrare: IN std_logic;
        iesire: out std_logic_vector(1 downto 0) );
end component mux_dub;
signal intrare_test: std_logic;
signal iesire_test: std_logic_vector(1 downto 0);

begin
ust : mux_dub port map (intrare_test, iesire_test);
process
begin
intrare_test<='0';
wait for 20 ns;
intrare_test<='1';
wait for 20 ns;
end process;

end Behavioral;
