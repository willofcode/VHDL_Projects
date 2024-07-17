----------------------------------------------------------------------------------
-- Company: CCNY
-- Engineer: GROUP 1
-- 
-- Create Date:    00:01:56 07/17/2024 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
    Port ( I_RAM_EN : in  STD_LOGIC;
           I_RAM_RE : in  STD_LOGIC;
           I_RAM_WE : in  STD_LOGIC;
           I_RAM_ADDR : in  STD_LOGIC_VECTOR (31 downto 0);
           I_RAM_DATA : in  STD_LOGIC_VECTOR (31 downto 0);
           O_RAM_DATA : out  STD_LOGIC_VECTOR (31 downto 0));
end RAM;

architecture Behavioral of RAM is
    type ram_type is array (0 to 255) of std_logic_vector(31 downto 0);
    signal RAM : ram_type := (
        0 => "00000000000000000000000000000001",
        1 => "00000000000000000000000000000010",
        2 => "00000000000000000000000000000100",
        3 => "00000000000000000000000000001000",
        4 => "00000000000000000000000000010000",
        5 => "00000000000000000000000000100000",
        6 => "00000000000000000000000001000000",
        7 => "00000000000000000000000010000000",
        8 => "00000000000000000000000100000000",
        9 => "00000000000000000000001000000000",
        10 => "00000000000000000000010000000000",
        11 => "00000000000000000000100000000000",
        12 => "00000000000000000001000000000000",
        13 => "00000000000000000010000000000000",
        14 => "00000000000000000100000000000000",
        15 => "00000000000000001000000000000000",
        16 => "00000000000000010000000000000000",
        17 => "00000000000000100000000000000000",
        18 => "00000000000001000000000000000000",
        19 => "00000000000010000000000000000000",
        20 => "00000000000100000000000000000000",
        21 => "00000000001000000000000000000000",
        22 => "00000000010000000000000000000000",
        23 => "00000000100000000000000000000000",
        24 => "00000001000000000000000000000000",
        25 => "00000010000000000000000000000000",
        26 => "00000100000000000000000000000000",
        27 => "00001000000000000000000000000000",
        28 => "00010000000000000000000000000000",
        29 => "00100000000000000000000000000000",
        30 => "01000000000000000000000000000000",
        31 => "10000000000000000000000000000000",
        others => (others => '0')
    );
    signal current_RAM_DATA : std_logic_vector(31 downto 0) := (others => '0');
begin
    process(I_RAM_EN, I_RAM_RE, I_RAM_WE, I_RAM_ADDR, I_RAM_DATA)
    begin
        if I_RAM_EN = '1' then
            if I_RAM_RE = '1' then
                current_RAM_DATA <= RAM(to_integer(unsigned(I_RAM_ADDR(7 downto 0))));
            elsif I_RAM_WE = '1' then
                RAM(to_integer(unsigned(I_RAM_ADDR(7 downto 0)))) <= I_RAM_DATA;
            end if;
        end if;
    end process;

    O_RAM_DATA <= current_RAM_DATA;

end Behavioral;
