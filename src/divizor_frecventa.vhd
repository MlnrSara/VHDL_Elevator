----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 12:23:02 PM
-- Design Name: 
-- Module Name: divizor_frecventa - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divizor_frecventa is
  Port (
        clk: IN std_logic;
        div_clk: OUT std_logic );
end divizor_frecventa;

architecture Behavioral of divizor_frecventa is
signal tmp: std_logic_vector(26 downto 0) := (others=>'0');

begin
process(clk)
begin
    if (rising_edge(clk)) then
        if tmp = ("101111101011110000100000000") then tmp<="000000000000000000000000000";
        elsif tmp <= "010111110101111000010000001" then 
            tmp <=  tmp+1;
            div_clk<= '0';
        else 
            div_clk<='1';
            tmp <= tmp+1;
        end if;
      end if;
      
end process;


end Behavioral;
