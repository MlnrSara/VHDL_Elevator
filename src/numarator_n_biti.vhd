----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2023 10:00:18 PM
-- Design Name: 
-- Module Name: numarator_n_biti - Behavioral
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

entity numarator_n_biti is
 generic (nr_biti : integer :=4);
 Port ( 
        clk: IN std_logic;
  		enable : IN std_logic;
  		reset : IN std_logic;
  		load : IN std_logic;
  		direction : IN std_logic;
  		init_nr : IN std_logic_vector (nr_biti-1 downto 0);
  		max: IN std_logic_vector(nr_biti-1 downto 0);
  		
  		flag : OUT std_logic;
  		count_nr : OUT std_logic_vector (nr_biti-1 downto 0));
end numarator_n_biti;

architecture Behavioral of numarator_n_biti is
signal count_temp : std_logic_vector(nr_biti-1 downto 0):= (others => '0');
begin
    
    process(clk, enable, load, reset)
        begin
        if (enable = '1') then  
         if (reset = '1') then
            count_temp <= (others => '0');
         else if (rising_edge(clk)) then
            if load = '1' then
                    count_temp <= init_nr;
            else if direction = '0' then
                    count_temp <= count_temp + 1;   
                else
                    if (count_temp = "0") then
                        count_temp <= count_temp;
                    else
                        count_temp <= count_temp - 1;
                    end if;
                end if;
            end if;
          end if;
            if (init_nr = count_temp) then
                flag <= '1';
            else
                flag <= '0';
            end if;
            if (count_temp = max) then 
                count_temp <=(others =>'0');
            end if;
        end if;
       end if;
    end process;
    count_nr <= count_temp;
end Behavioral;
