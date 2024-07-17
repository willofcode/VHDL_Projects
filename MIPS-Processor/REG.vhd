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
    signal reg_file : reg_file_type := (
        0  => x"00000000", 	 -- $zero
        2  => x"02020202",     -- $v0
        4  => x"04040404",     -- $a0
        8  => x"08080808",     -- $t0
        9  => x"09090909",     -- $t1
        10 => x"0A0A0A0A",     -- $t2
        11 => x"0B0B0B0B",     -- $t3
        12 => x"0C0C0C0C",     -- $t4
        13 => x"0D0D0D0D",     -- $t5
        14 => x"0E0E0E0E",     -- $t6
        15 => x"0F0F0F0F",     -- $t7
        16 => x"10101010",     -- $s0
        17 => x"11111111",     -- $s1
        18 => x"12121212",     -- $s2
        19 => x"13131313",     -- $s3
        20 => x"14141414",     -- $s4
        21 => x"15151515",     -- $s5
        22 => x"16161616",     -- $s6
        23 => x"17171717",     -- $s7
        24 => x"18181818",     -- $t8
        25 => x"19191919",     -- $t9
        others => x"00000000");
	 
begin
    process (I_REG_EN, I_REG_WE, I_REG_SEL_RS, I_REG_SEL_RT, I_REG_SEL_RD, I_REG_DATA_RD, reg_file)
    begin
        if I_REG_EN = '1' then
            O_REG_DATA_A <= reg_file(to_integer(unsigned(I_REG_SEL_RS)));
            O_REG_DATA_B <= reg_file(to_integer(unsigned(I_REG_SEL_RT)));
            if I_REG_WE = '1' and I_REG_SEL_RD /= "00000" then
                reg_file(to_integer(unsigned(I_REG_SEL_RD))) <= I_REG_DATA_RD;
            end if;
        end if;
    end process;
end Behavioral;
