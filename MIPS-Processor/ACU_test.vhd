--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:43:07 07/10/2024
-- Design Name:   
-- Module Name:   C:/Users/cs343/Desktop/Lab4/ACU_test.vhd
-- Project Name:  Lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ACU
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
 
ENTITY ACU_test IS
END ACU_test;
 
ARCHITECTURE behavior OF ACU_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ACU
    PORT(
         I_ACU_ALUOp : IN  std_logic_vector(1 downto 0);
         I_ACU_Funct : IN  std_logic_vector(5 downto 0);
         O_ACU_CTL : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I_ACU_ALUOp : std_logic_vector(1 downto 0) := (others => '0');
   signal I_ACU_Funct : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal O_ACU_CTL : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ACU PORT MAP (
          I_ACU_ALUOp => I_ACU_ALUOp,
          I_ACU_Funct => I_ACU_Funct,
          O_ACU_CTL => O_ACU_CTL
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 10 ns.
		wait for 10 ns;
		I_ACU_ALUOp <= "00";
		wait for 10 ns;
		I_ACU_Funct <= "101010";
      wait for 10 ns;
		I_ACU_ALUOp <= "00";
		wait for 10 ns;
		I_ACU_ALUOp <= "01";
		wait for 10 ns;
		I_ACU_Funct <= "101010";
      wait for 10 ns;
		I_ACU_ALUOp <= "10";
		wait for 10 ns;
		I_ACU_ALUOp <= "10";
		wait for 10 ns;
		I_ACU_Funct <= "100001";
		wait for 10 ns;
		I_ACU_ALUOp <= "10";
		wait for 10 ns;
		I_ACU_Funct <= "100010";
		wait for 10 ns;
		I_ACU_ALUOp <= "10";
		wait for 10 ns;
		I_ACU_Funct <= "100100";
		wait for 10 ns;
		I_ACU_ALUOp <= "10";
		wait for 10 ns;
		I_ACU_Funct <= "100101";
		wait for 10 ns;
		I_ACU_ALUOp <= "10";
		wait for 10 ns;
		I_ACU_Funct <= "101010";
      wait;
   end process;

END;
