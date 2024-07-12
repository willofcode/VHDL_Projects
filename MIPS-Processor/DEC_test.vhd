--------------------------------------------------------------------------------
-- Company: CCNY
-- Engineer: Group 1
--
-- Create Date:   12:57:23 07/09/2024
-- Design Name:   
-- Module Name:   C:/Users/cs343/Desktop/Lab4/DEC_test.vhd
-- Project Name:  Lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DEC
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DEC_test IS
END DEC_test;
 
ARCHITECTURE behavior OF DEC_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DEC
    PORT(
         I_DEC_EN : IN  std_logic;
         I_DEC_Opcode : IN  std_logic_vector(5 downto 0);
         O_DEC_RegDst : OUT  std_logic;
         O_DEC_Jump : OUT  std_logic;
         O_DEC_Beq : OUT  std_logic;
         O_DEC_Bne : OUT  std_logic;
         O_DEC_MemRead : OUT  std_logic;
         O_DEC_MemtoReg : OUT  std_logic;
         O_DEC_ALUOp : OUT  std_logic_vector(1 downto 0);
         O_DEC_MemWrite : OUT  std_logic;
         O_DEC_ALUSrc : OUT  std_logic;
         O_DEC_RegWrite : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal I_DEC_EN : std_logic := '0';
   signal I_DEC_Opcode : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal O_DEC_RegDst : std_logic;
   signal O_DEC_Jump : std_logic;
   signal O_DEC_Beq : std_logic;
   signal O_DEC_Bne : std_logic;
   signal O_DEC_MemRead : std_logic;
   signal O_DEC_MemtoReg : std_logic;
   signal O_DEC_ALUOp : std_logic_vector(1 downto 0);
   signal O_DEC_MemWrite : std_logic;
   signal O_DEC_ALUSrc : std_logic;
   signal O_DEC_RegWrite : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DEC PORT MAP (
          I_DEC_EN => I_DEC_EN,
          I_DEC_Opcode => I_DEC_Opcode,
          O_DEC_RegDst => O_DEC_RegDst,
          O_DEC_Jump => O_DEC_Jump,
          O_DEC_Beq => O_DEC_Beq,
          O_DEC_Bne => O_DEC_Bne,
          O_DEC_MemRead => O_DEC_MemRead,
          O_DEC_MemtoReg => O_DEC_MemtoReg,
          O_DEC_ALUOp => O_DEC_ALUOp,
          O_DEC_MemWrite => O_DEC_MemWrite,
          O_DEC_ALUSrc => O_DEC_ALUSrc,
          O_DEC_RegWrite => O_DEC_RegWrite
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 10 ns.
      wait for 10 ns;
		I_DEC_EN <= '0';
		wait for 10 ns;
		I_DEC_EN <= '1';
		wait for 10 ns;
		I_DEC_Opcode <= "000000"; --addu
		wait for 10 ns;
		I_DEC_Opcode <= "001000"; --addi
		wait for 10 ns;
		I_DEC_Opcode <= "001001"; -- addiu
		wait for 10 ns;
		I_DEC_Opcode <= "101011";	--sw
		wait for 10 ns;
		I_DEC_Opcode <= "100011"; -- lw
		wait for 10 ns;
		I_DEC_Opcode <= "000010"; -- j
		wait for 10 ns;
		I_DEC_Opcode <= "000011"; -- other
		wait for 10 ns;
		I_DEC_Opcode <= "000100";	--beq
		wait for 10 ns;
		I_DEC_Opcode <= "000101";	-- bne
      wait;
   end process;

END;
