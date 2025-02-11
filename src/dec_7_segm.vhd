----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2023 02:07:19 PM
-- Design Name: 
-- Module Name: dec_7_segm - Behavioral
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

entity dec_7_segm is
 Port ( hex_in: IN std_logic_vector (3 downto 0);
        a_b_c_d_e_f_g: OUT std_logic_vector (6 downto 0) );
end dec_7_segm;

architecture Behavioral of dec_7_segm is

begin
a_b_c_d_e_f_g<= "0000001" when hex_in = x"0" else
                "1001111" when hex_in = x"1" else
                "0010010" when hex_in = x"2" else
                "0000110" when hex_in = x"3" else
                "1011000" when hex_in = x"4" else
                "0100100" when hex_in = x"5" else
                "0100000" when hex_in = x"6" else
                "0001111" when hex_in = x"7" else
                "0000000" when hex_in = x"8" else
                "0000100" when hex_in = x"9" else
                "1111111";
end Behavioral;
