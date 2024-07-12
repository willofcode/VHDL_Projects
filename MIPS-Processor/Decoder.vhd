----------------------------------------------------------------------------------
-- Company: CCNY
-- Engineer: Group 1
-- 
-- Create Date:    14:31:55 07/03/2024 
-- Design Name: 
-- Module Name:    Decoder - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DEC is 
	Port(
		I_DEC_EN		: in STD_LOGIC;
		I_DEC_Opcode: in STD_LOGIC_VECTOR (5 downto 0);
		O_DEC_RegDst: out STD_LOGIC;
		O_DEC_Jump	: out STD_LOGIC;
		O_DEC_Beq	: out STD_LOGIC;
		O_DEC_Bne	: out STD_LOGIC;
		O_DEC_MemRead: out STD_LOGIC;
		O_DEC_MemtoReg: out STD_LOGIC;
		O_DEC_ALUOp	: out STD_LOGIC_VECTOR (1 downto 0);
		O_DEC_MemWrite: out STD_LOGIC;
		O_DEC_ALUSrc	: out STD_LOGIC;
		O_DEC_RegWrite	: out STD_LOGIC
		);
end DEC;


architecture Behavioral of DEC is
begin
	process(I_DEC_EN, I_DEC_Opcode)
	begin
		if I_DEC_EN = '1' then
			case I_DEC_Opcode is
				when "000000" => --addu bit: 0
					O_DEC_RegDst <= '1';
					O_DEC_Jump <= '0';
					O_DEC_Beq <= '0';
					O_DEC_Bne <= '0';
					O_DEC_MemRead <= '0';
					O_DEC_MemtoReg <= '0';
					O_DEC_ALUOp <= "10";
					O_DEC_MemWrite <= '0';
					O_DEC_ALUSrc <= '0';
					O_DEC_RegWrite <= '1';
				when "001000" => -- addi bit: 8
					O_DEC_RegDst <= '0';
					O_DEC_Jump <= '0';
					O_DEC_Beq <= '0';
					O_DEC_Bne <= '0';
					O_DEC_MemRead <= '0';
					O_DEC_MemtoReg <= '0';
					O_DEC_ALUOp <= "00";
					O_DEC_MemWrite <= '0';
					O_DEC_ALUSrc <= '1';
					O_DEC_RegWrite <= '1';
				when "001001" => -- addiu bit: 9
					O_DEC_RegDst <= '0';
					O_DEC_Jump <= '0';
					O_DEC_Beq <= '0';
					O_DEC_Bne <= '0';
					O_DEC_MemRead <= '0';
					O_DEC_MemtoReg <= '0';
					O_DEC_ALUOp <= "00";
					O_DEC_MemWrite <= '0';
					O_DEC_ALUSrc <= '1';
					O_DEC_RegWrite <= '1';
				when "000100" => --beq
				   O_DEC_RegDst <= '0';
					O_DEC_Jump <= '0';
					O_DEC_Beq <= '1';
					O_DEC_Bne <= '0';
					O_DEC_MemRead <= '0';
					O_DEC_MemtoReg <= '0';
					O_DEC_ALUOp <= "01";
					O_DEC_MemWrite <= '0';
					O_DEC_ALUSrc <= '0';
					O_DEC_RegWrite <= '0';
				when "000101" => --bne
				   O_DEC_RegDst <= '0';
					O_DEC_Jump <= '0';
					O_DEC_Beq <= '0';
					O_DEC_Bne <= '1';
					O_DEC_MemRead <= '0';
					O_DEC_MemtoReg <= '0';
					O_DEC_ALUOp <= "01";
					O_DEC_MemWrite <= '0';
					O_DEC_ALUSrc <= '0';
					O_DEC_RegWrite <= '0';
				when "101011" => -- store bit: 43
					O_DEC_RegDst <= '0';
					O_DEC_Jump <= '0';
					O_DEC_Beq <= '0';
					O_DEC_Bne <= '0';
					O_DEC_MemRead <= '0';
					O_DEC_MemtoReg <= '0';
					O_DEC_ALUOp <= "00";
					O_DEC_MemWrite <= '1';
					O_DEC_ALUSrc <= '1';
					O_DEC_RegWrite <= '0';
				when "100011" => -- load bit: 35
					O_DEC_RegDst <= '0';
					O_DEC_Jump <= '0';
					O_DEC_Beq <= '0';
					O_DEC_Bne <= '0';
					O_DEC_MemRead <= '1';
					O_DEC_MemtoReg <= '1';
					O_DEC_ALUOp <= "00";
					O_DEC_MemWrite <= '0';
					O_DEC_ALUSrc <= '1';
					O_DEC_RegWrite <= '1';
				when "000010" => -- j bit: 2
					O_DEC_RegDst <= '0';
					O_DEC_Jump <= '1';
					O_DEC_Beq <= '0';
					O_DEC_Bne <= '0';
					O_DEC_MemRead <= '0';
					O_DEC_MemtoReg <= '0';
					O_DEC_ALUOp <= "01";
					O_DEC_MemWrite <= '0';
					O_DEC_ALUSrc <= '0';
					O_DEC_RegWrite <= '0';
				when others =>
					O_DEC_RegDst <= '0';
					O_DEC_Jump <= '0';
					O_DEC_Beq <= '0';
					O_DEC_Bne <= '0';
					O_DEC_MemRead <= '0';
					O_DEC_MemtoReg <= '0';
					O_DEC_ALUOp <= "00";
					O_DEC_MemWrite <= '0';
					O_DEC_ALUSrc <= '0';
					O_DEC_RegWrite <= '0';
			end case;
		end if;
	end process;
end Behavioral;

