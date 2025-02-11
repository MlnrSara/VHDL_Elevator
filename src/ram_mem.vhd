----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2023 04:11:00 PM
-- Design Name: 
-- Module Name: ram_mem - Behavioral
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
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ram_mem is
PORT (
  		ADDR  : IN std_logic_vector (3 downto 0);
  		Write_Enable : IN std_logic;
  		INTR: IN std_logic_vector (1 downto 0);
  		CS    : IN std_logic; -- asta nu stiu de ce e aici, dar era in lab, asa ca l-am lasat
  		DATE : OUT std_logic_vector (1 downto 0);
  		clk : IN std_logic);
end ram_mem;

architecture Behavioral of ram_mem is
TYPE ram_type is ARRAY(0 to 12)of std_logic_vector(1 downto 0);--vector de vectori
signal RAM_M: ram_type := (others =>"00");
BEGIN
    process(INTR, Write_enable, addr, clk)
    begin
       if(clk'event and clk = '1') then 
        if (Write_enable = '0') then -- daca modul e 0 atunci se citeste din memorie
	       DATE <=  RAM_M(conv_integer(ADDR));
	    else -- altfel se scrie in memorie
	       RAM_M(conv_integer(ADDR)) <= INTR;
	    end if;
	   end if;
	end process;
end Behavioral;
