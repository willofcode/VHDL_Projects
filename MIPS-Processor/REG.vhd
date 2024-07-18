----------------------------------------------------------------------------------
-- Company: CCNY
-- Engineer: GROUP 1
-- 
-- Create Date:    23:44:56 07/16/2024 
-- Design Name: 
-- Module Name:    REG - Behavioral 
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
use std.textio.all;

entity REG is
    Port ( I_REG_EN : in  STD_LOGIC;
           I_REG_WE : in  STD_LOGIC;
           I_REG_SEL_RS : in  STD_LOGIC_VECTOR (4 downto 0);
           I_REG_SEL_RT : in  STD_LOGIC_VECTOR (4 downto 0);
           I_REG_SEL_RD : in  STD_LOGIC_VECTOR (4 downto 0);
           I_REG_DATA_RD : in  STD_LOGIC_VECTOR (31 downto 0);
           O_REG_DATA_A : out  STD_LOGIC_VECTOR (31 downto 0);
           O_REG_DATA_B : out  STD_LOGIC_VECTOR (31 downto 0));
end REG;

architecture Behavioral of REG is
    type reg_file_type is array (0 to 31) of std_logic_vector(31 downto 0);
    signal reg_file : reg_file_type;

impure function init_reg(FileName : in string) return reg_file_type is
	constant LINE_NUM : integer := 32;
	file fp: text;
	variable temp_reg : reg_file_type := (others => x"00000000");
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
			temp_reg(i) := to_stdlogicvector(byte_cache);
		end if;
	end loop;
	file_close(fp);
	return temp_reg;
end function;

begin
    process (I_REG_EN, reg_file)
    begin
        if I_REG_EN = '1' then
	    reg_file <= init_reg("REG_init.txt");
            O_REG_DATA_A <= reg_file(to_integer(unsigned(I_REG_SEL_RS)));
            O_REG_DATA_B <= reg_file(to_integer(unsigned(I_REG_SEL_RT)));
            if I_REG_WE = '1' and I_REG_SEL_RD /= "00000" then
                reg_file(to_integer(unsigned(I_REG_SEL_RD))) <= I_REG_DATA_RD;
            end if;
        end if;
    end process;
end Behavioral;


			
