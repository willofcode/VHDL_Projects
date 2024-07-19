--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:31:29 07/18/2024
-- Design Name:   
-- Module Name:   C:/Users/cs343/Desktop/Lab5/Group01_Lab05_CC1XC/ROM_test.vhd
-- Project Name:  Group01_Lab05_CC1XC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ROM
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
USE ieee.numeric_std.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ROM_test IS
END ROM_test;
 
ARCHITECTURE behavior OF ROM_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM
    PORT(
         I_ROM_EN : IN  std_logic;
         I_ROM_ADDR : IN  std_logic_vector(31 downto 0);
         O_ROM_DATA : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I_ROM_EN : std_logic := '0';
   signal I_ROM_ADDR : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal O_ROM_DATA : std_logic_vector(31 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM PORT MAP (
          I_ROM_EN => I_ROM_EN,
          I_ROM_ADDR => I_ROM_ADDR,
          O_ROM_DATA => O_ROM_DATA
        );

   -- Stimulus process
   stim_proc: process
	variable num_lines : integer := 12;
	variable address : integer := 0;
   begin
		-- hold reset state for 10 ns
		wait for 10 ns;
		-- insert stimulus here
		for i in 0 to num_lines loop
			I_ROM_EN <= '1';
			I_ROM_ADDR <= std_logic_vector(to_unsigned(address, I_ROM_ADDR'length));
			wait for 10 ns;
			I_ROM_EN <= '0';
			address := address + 4;
			wait for 10 ns;
		end loop;
      wait;
   end process;

END;
