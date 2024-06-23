--------------------------------------------------------------------------------
-- Company: CCNY
-- Engineer: William Ng
--
-- Create Date:   14:51:58 06/17/2024
-- Design Name:   
-- Module Name:   C:/Users/cs343/Desktop/Lab_01/ALU8_test.vhd
-- Project Name:  Lab_01
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU8
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
 
ENTITY ALU8_test IS
END ALU8_test;
 
ARCHITECTURE behavior OF ALU8_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU8
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         A_inv : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         B_inv : IN  std_logic_vector(7 downto 0);
         CarryIn : IN  std_logic_vector(7 downto 0);
         OP : IN  std_logic_vector(1 downto 0);
         CarryOut : OUT  std_logic_vector(7 downto 0);
         Result : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal A_inv : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal B_inv : std_logic_vector(7 downto 0) := (others => '0');
   signal CarryIn : std_logic_vector(7 downto 0) := (others => '0');
   signal OP : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal CarryOut : std_logic_vector(7 downto 0);
   signal Result : std_logic_vector(7 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU8 PORT MAP (
          A => A,
          A_inv => A_inv,
          B => B,
          B_inv => B_inv,
          CarryIn => CarryIn,
          OP => OP,
          CarryOut => CarryOut,
          Result => Result
        );

   -- Stimulus process
   stim_proc: process
   begin		
		-- A AND B
		OP <= "00"; CarryIn <= '0'; A_inv <= '0'; B_inv <= '0';
		A <= "01111000"; B <= "00011110"; wait for 40 ns;
		-- A OR B
		OP <= "01"; CarryIn <= '0'; A_inv <= '0'; B_inv <= '0';
		A <= "01111000"; B <= "00011110"; wait for 40 ns;
		-- A + B
		OP <= "10"; CarryIn <= '0'; A_inv <= '0'; B_inv <= '0';
		A <= "00001100"; B <= "00111000"; wait for 40 ns;
		-- A - B
		OP <= "10"; CarryIn <= '1'; A_inv <= '0'; B_inv <= '1';
		A <= "01010101"; B <= "00101010"; wait for 40 ns;
      wait;
   end process;

END;
