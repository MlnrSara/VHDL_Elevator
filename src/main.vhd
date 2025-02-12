----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/01/2023 04:20:21 PM
-- Design Name: 
-- Module Name: main - Behavioral
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

entity main is
    Port (  Clk : in STD_LOGIC;
            Reset : in STD_LOGIC;
            Greutate_maxima : in STD_LOGIC;
            Obstacol_usa : in STD_LOGIC;
            Vitsza_deplasare : in STD_LOGIC;
            Destinatie : in STD_LOGIC_VECTOR(0 to 3);
            Greutate_depasita : out STD_LOGIC;
            Obstacol_existent : out STD_LOGIC;
            Usa_deschisa : out STD_LOGIC;
            Timp_usi_deschise: in STD_LOGIC_VECTOR(0 to 2));
end main;

architecture Behavioral of main is
component Unitate_de_Executie is
    Port (  Clk : in STD_LOGIC;
            
    ); 
begin


end Behavioral;
