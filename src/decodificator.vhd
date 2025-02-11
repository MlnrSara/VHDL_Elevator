----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2023 04:26:19 PM
-- Design Name: 
-- Module Name: decodificator - Behavioral
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

entity decodificator is
 Port ( intrare: IN std_logic_vector (3 downto 0);
        iesire1: OUT std_logic_vector (3 downto 0); -- 0 pe mux -- cel mai important digit (zecile)
        iesire2: OUT std_logic_vector(3 downto 0) ); --1 pe mux -- cel mai nesemnificativ digit (unitatile)
end decodificator;

architecture Behavioral of decodificator is

begin
    process (intrare)
        begin
            case intrare is
                when "1010"|"1011"|"1100" => iesire1 <= "0001";
                when others => iesire1 <= "0000";
            end case;
    end process;
    process (intrare)
        begin
            case intrare is
                when "0000"|"1010" => iesire2 <= "0000";
                when "0001"|"1011" => iesire2 <= "0001";
                when "0010"|"1100" => iesire2 <= "0010";
                when "0011" => iesire2 <= "0011";
                when "0100" => iesire2 <= "0100";
                when "0101" => iesire2 <= "0101";
                when "0110" => iesire2 <= "0110";
                when "0111" => iesire2 <= "0111";
                when "1000" => iesire2 <= "1000";
                when "1001" => iesire2 <= "1001";
                when others => iesire2 <= "0000";
            end case;
    end process;

end Behavioral;
