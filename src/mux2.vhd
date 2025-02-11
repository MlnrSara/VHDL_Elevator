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

entity mux2 is
  Port (intr1: IN std_logic_vector (3 downto 0);
        intr2: IN std_logic_vector (3 downto 0);
        sel: IN std_logic_vector (2 downto 0);
        ies: OUT std_logic_vector (3 downto 0) );
end mux2;

architecture Behavioral of mux2 is
--if(sel = "001") then
  --          ies<=intr2;
begin
    process(sel)
    begin 
    case sel is
        when "000" => ies <= intr1;
        when "001" => ies <= intr2;
        when others => ies<= "1111";
        end case;
    end process;

end Behavioral;
