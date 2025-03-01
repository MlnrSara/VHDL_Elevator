----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2023 04:35:15 PM
-- Design Name: 
-- Module Name: tb_ram_mem - Behavioral
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

entity tb_ram_mem is
--  Port ( );
end tb_ram_mem;

architecture Behavioral of tb_ram_mem is
component ram_mem
PORT (
  		ADDR  : IN std_logic_vector (3 downto 0);
  		Write_Enable : IN std_logic;
  		INTR: IN std_logic_vector (1 downto 0);
  		CS    : IN std_logic; -- asta nu stiu de ce e aici, dar era in lab, asa ca l-am lasat
  		DATE : OUT std_logic_vector (1 downto 0);
  		clk : IN std_logic);
end component ram_mem;
signal ADDR_test  : std_logic_vector (3 downto 0);
signal Write_Enable_test :  std_logic;
signal INTR_test: std_logic_vector (1 downto 0);
signal CS_test    :  std_logic; -- asta nu stiu de ce e aici, dar era in lab, asa ca l-am lasat
signal DATE_test : std_logic_vector (1 downto 0);
signal clk_test : std_logic;
constant perioada: TIME := 20 ns;
begin
ust : ram_mem port map(addr_test, write_enable_test, intr_test, cs_test, date_test, clk_test);

process
begin
clk_test <= '1';
wait for perioada/2;
clk_test <= '0';
wait for perioada/2;
end process;

process
begin
write_enable_test <= '0';
addr_test <= "0011";
wait for perioada;
intr_test <= "11";
write_enable_test <= '1';
wait for perioada;
write_enable_test <= '0';
wait for perioada;
addr_test <= "0001";
wait for perioada;
addr_test <= "0000";
wait for perioada;

end process;
end Behavioral;
