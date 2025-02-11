----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2023 03:26:49 PM
-- Design Name: 
-- Module Name: mux - Behavioral
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

entity mux is
  Port (
        sel: IN std_logic_vector (2 downto 0);
        ies: OUT std_logic_vector (7 downto 0) );
end mux;

architecture Behavioral of mux is

begin
    process(sel)
    begin 
    case sel is
         when "000" => ies <= "11111110";
         when "001" => ies <= "11111101";
         when "010" => ies <= "11111011";
         when "011" => ies <= "11110111";
         when "100" => ies <= "11101111";
         when "101" => ies <= "11011111";
         when "110" => ies <= "10111111";
         when others => ies <= "01111111";
        end case;
    end process;

end Behavioral;
