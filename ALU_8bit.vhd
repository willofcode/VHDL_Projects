----------------------------------------------------------------------------------
-- Company: CCNY
-- Engineer: William Ng
-- 
-- Create Date:    17:16:00 06/16/2024 
-- Design Name: 	8-Bit ALU test
-- Module Name:    ALU8 - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU8 is
    Port ( A :       in  STD_LOGIC_VECTOR (7 downto 0);
           A_inv :   in  STD_LOGIC;
           B :       in  STD_LOGIC_VECTOR (7 downto 0);
           B_inv :   in  STD_LOGIC;
           CarryIn : in  STD_LOGIC;
           OP :      in  STD_LOGIC_VECTOR (1 downto 0);
           CarryOut :out  STD_LOGIC;
           Result :  out  STD_LOGIC_VECTOR (7 downto 0));
end ALU8;

architecture ALU8_arch of ALU8 is
signal CO_01, CO_02, CO_03, CO_04, CO_05, CO_06, CO_07: STD_LOGIC;
component ALU 
    Port ( A, A_inv, B, B_inv, CarryIn, OP0, OP1: in STD_LOGIC;
           CarryOut, Result : out STD_LOGIC); 
end component;
begin
    U1: ALU port map( A(0), A_inv, B(0), B_inv, CarryIn, OP(0), OP(1), CO_01, Result(0));
    U2: ALU port map( A(1), A_inv, B(1), B_inv, CO_01, OP(0), OP(1), CO_02, Result(1));
    U3: ALU port map( A(2), A_inv, B(2), B_inv, CO_02, OP(0), OP(1), CO_03, Result(2));
    U4: ALU port map( A(3), A_inv, B(3), B_inv, CO_03, OP(0), OP(1), CO_04, Result(3));
    U5: ALU port map( A(4), A_inv, B(4), B_inv, CO_04, OP(0), OP(1), CO_05, Result(4));
    U6: ALU port map( A(5), A_inv, B(5), B_inv, CO_05, OP(0), OP(1), CO_06, Result(5));
    U7: ALU port map( A(6), A_inv, B(6), B_inv, CO_06, OP(0), OP(1), CO_07, Result(6));
    U8: ALU port map( A(7), A_inv, B(7), B_inv, CO_07, OP(0), OP(1), CarryOut, Result(7));
end ALU8_arch;

