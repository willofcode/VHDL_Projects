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
use STD.textio.ALL;

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
    type ram_type is array (0 to 8447) of std_logic_vector(7 downto 0);
	 signal RAM : ram_type;
	 signal temp_RAM_DATA: std_logic_vector(31 downto 0) := (others => '0');
    signal current_RAM_DATA : std_logic_vector(31 downto 0) := (others => '0');
	 
impure function init_ram(FileName : in string) return ram_type is
	constant line_num : integer := 32;
	file fp: text;
	variable temp_ram : ram_type := (others => x"00");
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
			temp_ram(0+4*i) := to_stdlogicvector(byte_cache(31 downto 24));
			temp_ram(1+4*i) := to_stdlogicvector(byte_cache(23 downto 16));
			temp_ram(2+4*i) := to_stdlogicvector(byte_cache(15 downto 8));
			temp_ram(3+4*i) := to_stdlogicvector(byte_cache(7 downto 0));
		end if;
	end loop;
	file_close(fp);
	return temp_ram;
end function;

begin
    process(I_RAM_EN, I_RAM_RE, I_RAM_WE, I_RAM_ADDR, I_RAM_DATA, RAM, current_RAM_DATA)
	 begin
	     RAM <= init_ram("RAM_init.txt");
        if I_RAM_EN = '1' then					
            if I_RAM_RE = '1' then
					current_RAM_DATA(31 downto 24) <= RAM(to_integer(unsigned(I_RAM_ADDR)));		-- Update when enabled
					current_RAM_DATA(23 downto 16) <= RAM(to_integer(unsigned(I_RAM_ADDR)+1));		
					current_RAM_DATA(15 downto 8) <= RAM(to_integer(unsigned(I_RAM_ADDR)+2));
					current_RAM_DATA(7 downto 0) <= RAM(to_integer(unsigned(I_RAM_ADDR)+3));
					O_RAM_DATA <= current_RAM_DATA;
					temp_RAM_DATA <= current_RAM_DATA;
					end if;
				if I_RAM_WE = '1' then
					O_RAM_DATA <= I_RAM_DATA;	
            end if;
			else 
        end if;
    end process;
end Behavioral;
