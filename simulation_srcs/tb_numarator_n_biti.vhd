----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2023 10:44:31 PM
-- Design Name: 
-- Module Name: tb_numarator_n_biti - Behavioral
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

entity tb_numarator_n_biti is
--  Port ( );
end tb_numarator_n_biti;

architecture Behavioral of tb_numarator_n_biti is
component numarator_n_biti is
 generic (nr_biti : integer :=4);
 Port ( 
        clk: IN std_logic;
  		enable : IN std_logic;
  		reset : IN std_logic;
  		load : IN std_logic;
  		direction : IN std_logic;
  		init_nr : IN std_logic_vector (nr_biti-1 downto 0);
  		
  		flag : OUT std_logic;
  		count_nr : OUT std_logic_vector (nr_biti-1 downto 0));
end component;

signal clk_test: std_logic;
signal enable_test : std_logic;
signal reset_test : std_logic;
signal load_test : std_logic;
signal direction_test : std_logic;
signal init_nr_test : std_logic_vector (3 downto 0);
  		
signal flag_test : std_logic;
signal count_nr_test : std_logic_vector (3 downto 0);
constant perioada: TIME := 20ns; 
begin
ust: numarator_n_biti generic map (4)
        port map (clk_test, enable_test, reset_test, load_test, direction_test, init_nr_test, flag_test, count_nr_test);

process
begin
clk_test <= '1';
wait for perioada/2;
clk_test <= '0';
wait for perioada/2;
end process;

process
begin
enable_test <= '1';
direction_test<= '0';
wait for perioada;
init_nr_test <= "0010";
load_test<='1';
wait for perioada;
load_test<='0';
wait for perioada;
reset_test<='1';
wait for perioada;
reset_test<='0';

enable_test <= '1';
direction_test <= '1';
wait for perioada;
init_nr_test <= "0010";
load_test<='1';
wait for perioada;
load_test<='0';
wait for perioada;
reset_test<='1';
wait for perioada;
reset_test<='0';
end process;
end Behavioral;
