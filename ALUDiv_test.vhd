--------------------------------------------------------------------------------
-- Company: CCNY
-- Engineer: William Ng
--
-- Create Date:   02:36:14 06/26/2024
-- Design Name:   
-- Module Name:   C:/Users/Willi/OneDrive/Desktop/Lab_02/Lab_02/ALU_test.vhd
-- Project Name:  Lab_02
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_test IS
END ALU_test;
 
ARCHITECTURE behavior OF ALU_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         I_ALU_EN : IN  std_logic;
         I_ALU_A : IN  std_logic_vector(5 downto 0);
         I_ALU_B : IN  std_logic_vector(5 downto 0);
         O_ALU_Out : OUT  std_logic_vector(5 downto 0);
         O_ALU_Flag : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal I_ALU_EN : std_logic := '0';
   signal I_ALU_A : std_logic_vector(5 downto 0) := (others => '0');
   signal I_ALU_B : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal O_ALU_Out : std_logic_vector(5 downto 0);
   signal O_ALU_Flag : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          I_ALU_EN => I_ALU_EN,
          I_ALU_A => I_ALU_A,
          I_ALU_B => I_ALU_B,
          O_ALU_Out => O_ALU_Out,
          O_ALU_Flag => O_ALU_Flag
        );

   -- Clock process definitions

   -- Stimulus process
   stim_proc: process
   begin
		wait for 10 ns;
		-- Test case 1
		I_ALU_EN <= '1';
		I_ALU_A <= "001010"; -- 10
		I_ALU_B <= "000101"; -- 5
		wait for 10 ns;

		-- Test case 2
		I_ALU_A <= "000011"; -- 3
		I_ALU_B <= "001100"; -- 12
		wait for 10 ns;

		-- Test case 3
		I_ALU_EN <= '0';
		I_ALU_A <= "111111"; -- 63
		I_ALU_B <= "000000"; -- 0
		wait for 10 ns;

      wait;
   end process;

END;
