----------------------------------------------------------------------------------
-- Company: CCNY	
-- Engineer: GROUP 1
-- 
-- Create Date:    23:48:10 07/16/2024 
-- Design Name: 
-- Module Name:    ROM - Behavioral 
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

entity ROM is
    Port ( I_ROM_EN : in  STD_LOGIC;
           I_ROM_ADDR : in  STD_LOGIC_VECTOR (31 downto 0);
           O_ROM_DATA : out  STD_LOGIC_VECTOR (31 downto 0));
end ROM;

architecture Behavioral of ROM is
    type ROM_Array is array (0 to 255) of STD_LOGIC_VECTOR(31 downto 0);
    signal ROM_Content : ROM_Array := (
        0 => "00100000000110010010000000000000",
        1 => "00100111001110010000000000000001",
        2 => "00000001001010100101100000100001",
        3 => "00100100000010010000000000000001",
        4 => "00010010000100101111111111111011",
        5 => "10001111001010000000000000000001",
        6 => "00010101101011001111111111111001",
        7 => "10101101001010001111111111111111",
        8 => "00001000000000000000000000001001",
        9 => "00100100000000100000000000001010",
        10 => "00000000000000000000000000001100",
        others => "00000000000000000000000000000000"
    );
begin
    process (I_ROM_EN, I_ROM_ADDR)
    begin
        if I_ROM_EN = '1' then
            O_ROM_DATA <= ROM_Content(to_integer(unsigned(I_ROM_ADDR(7 downto 0))));
        end if;
    end process;
end Behavioral;
