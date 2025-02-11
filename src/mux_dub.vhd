----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2023 06:18:25 PM
-- Design Name: 
-- Module Name: mux_dub - Behavioral
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

entity mux_dub is
 Port ( intrare: IN std_logic;
        iesire: out std_logic_vector(1 downto 0) );
end mux_dub;

architecture Behavioral of mux_dub is

begin
process(intrare)
begin
if (intrare = '0') then
    iesire <= "01";
else
    iesire <= "11";
end if;
end process;

end Behavioral;
