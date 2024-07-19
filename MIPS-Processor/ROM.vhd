----------------------------------------------------------------------------------
-- Company: CCNY
-- Engineer: GROUP 1
-- 
-- Create Date:    14:44:56 07/17/2024 
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
use STD.textio.ALL;

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
    type ROM_Array is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
    signal ROM_Content : ROM_Array;

impure function init_rom(FileName : in string) return ROM_Array is
	constant LINE_NUM : integer := 11;
	file fp: text;
	variable temp_rom : ROM_Array := (others => x"00");
	variable line_cache : line;
	variable byte_cache : bit_vector ( 31 downto 0) := x"00000000";
begin
	file_open(fp, filename, read_mode);
	for i in 0 to line_num loop
		if endfile(fp) then 
			exit;
		else 
			readline (fp, line_cache);
			read (line_cache, byte_cache);
			temp_rom(0+4*i) := to_stdlogicvector(byte_cache(31 downto 24));
			temp_rom(1+4*i) := to_stdlogicvector(byte_cache(23 downto 16));
			temp_rom(2+4*i) := to_stdlogicvector(byte_cache(15 downto 8));
			temp_rom(3+4*i) := to_stdlogicvector(byte_cache(7 downto 0));
		end if;
	end loop;
	file_close(fp);
	return temp_rom;
end function;

begin
    process (I_ROM_EN, I_ROM_ADDR, ROM_Content)
    begin
        if I_ROM_EN = '1' then
				ROM_Content <= init_rom("ROM_init.txt");
           			O_ROM_DATA(31 downto 24) <= ROM_Content(to_integer(unsigned(I_ROM_ADDR)));
				O_ROM_DATA(23 downto 16) <= ROM_Content(to_integer(unsigned(I_ROM_ADDR)+1));
				O_ROM_DATA(15 downto 8) <= ROM_Content(to_integer(unsigned(I_ROM_ADDR)+2));
				O_ROM_DATA(7 downto 0) <= ROM_Content(to_integer(unsigned(I_ROM_ADDR)+3));
        end if;
    end process;
end Behavioral;
