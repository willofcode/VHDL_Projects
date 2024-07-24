--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:26:27 07/18/2024
-- Design Name:   
-- Module Name:   C:/Users/cs343/Desktop/Lab5/Group01_Lab05_CC1XC/RAM_test.vhd
-- Project Name:  Group01_Lab05_CC1XC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM
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
 
ENTITY RAM_Test IS
END RAM_Test;
 
ARCHITECTURE behavior OF RAM_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM
    PORT(
         I_RAM_EN : IN  std_logic;
         I_RAM_RE : IN  std_logic;
         I_RAM_WE : IN  std_logic;
         I_RAM_ADDR : IN  std_logic_vector(31 downto 0);
         I_RAM_DATA : IN  std_logic_vector(31 downto 0);
         O_RAM_DATA : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I_RAM_EN : std_logic := '0';
   signal I_RAM_RE : std_logic := '0';
   signal I_RAM_WE : std_logic := '0';
   signal I_RAM_ADDR : std_logic_vector(31 downto 0) := (others => '0');
   signal I_RAM_DATA : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal O_RAM_DATA : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM PORT MAP (
          I_RAM_EN => I_RAM_EN,
          I_RAM_RE => I_RAM_RE,
          I_RAM_WE => I_RAM_WE,
          I_RAM_ADDR => I_RAM_ADDR,
          I_RAM_DATA => I_RAM_DATA,
          O_RAM_DATA => O_RAM_DATA
        );


   
	-- Stimulus process
   stim_proc: process
	variable num_lines : integer := 32;
	-- RAM range is 0x00002000 - 0x000020FF
	-- that is 8192 to 8447 in decimal 
	variable address : integer := 8192;
   begin		
		-- hold reset state for 10 ns
		wait for 10 ns;
		-- TEST #01
		-- read the first 128 bytes of the RAM
		-- i.e. from 8192 to 8319 
		-- 0x00002000 - 0x0000207F
		for i in 0 to (num_lines-1) loop
			I_RAM_EN <= '1';
			I_RAM_RE <= '1';
			I_RAM_WE <= '0';
			I_RAM_ADDR <= std_logic_vector(to_unsigned(address, I_RAM_ADDR'length));
			wait for 10 ns;
			I_RAM_EN <= '0';
			address := address + 4;
			wait for 10 ns;
		end loop;
		-- stop RAM
		I_RAM_EN <= '0';
		I_RAM_RE <= '0';
		I_RAM_WE <= '0';
		wait for 10 ns;
		-- TEST #2
		-- write the first 8 bytes of the RAM without WE asserted
		-- i.e. from 8192 to 8199
		-- 0x00002000 - 0x00002007
		I_RAM_EN <= '1';
		I_RAM_RE <= '1';
		I_RAM_WE <= '0';
		I_RAM_ADDR <= x"00002000";
		I_RAM_DATA <= x"66778899";
		wait for 5 ns;
		I_RAM_EN <= '0';
		wait for 5 ns;
		I_RAM_EN <= '1';
		I_RAM_ADDR <= x"00002004";
		I_RAM_DATA <= x"AABBCCDD";
		wait for 5 ns;
		I_RAM_EN <= '0';
		wait for 5 ns;
		-- stop RAM
		I_RAM_EN <= '0';
		I_RAM_RE <= '0';
		I_RAM_WE <= '0';
		wait for 10 ns;
		-- TEST #3
		-- read the first 8 bytes of the RAM
		-- Verify that the RAM content cannot be overwritten
		-- if WE is not asserted
		I_RAM_EN <= '1';
		I_RAM_RE <= '1';
		I_RAM_ADDR <= x"00002000";
		wait for 10 ns;
		I_RAM_EN <= '0';
		wait for 10 ns;
		I_RAM_EN <= '1';
		I_RAM_ADDR <= x"00002004";
		wait for 10 ns;
		I_RAM_EN <= '0';
		wait for 10 ns;
		-- stop RAM
		I_RAM_EN <= '0';
		I_RAM_RE <= '0';
		I_RAM_WE <= '0';
		wait for 10 ns;
		-- TEST #4
		-- write the first 8 bytes of the RAM with WE asserted
		-- i.e. from 8192 to 8199
		-- 0x00002000 - 0x00002007
		I_RAM_EN <= '1';
		I_RAM_RE <= '0';
		I_RAM_WE <= '1';
		I_RAM_ADDR <= x"00002000";
		I_RAM_DATA <= x"66778899";
		wait for 5 ns;
		I_RAM_EN <= '0';
		wait for 5 ns;
		I_RAM_EN <= '1';
		I_RAM_RE <= '0';
		I_RAM_WE <= '1';		
		I_RAM_ADDR <= x"00002004";
		I_RAM_DATA <= x"AABBCCDD";
		wait for 5 ns;
		I_RAM_EN <= '0';
		wait for 5 ns;
		-- stop RAM
		I_RAM_EN <= '0';
		I_RAM_RE <= '0';
		I_RAM_WE <= '0';
		wait for 10 ns;		
		-- TEST #5
		-- read the first 8 bytes of the RAM
		-- Verify that the RAM content can be updated when needed
		I_RAM_EN <= '1';
		I_RAM_RE <= '1';
		I_RAM_WE <= '0';
		I_RAM_ADDR <= x"00002000";
		I_RAM_DATA <= x"00000000";
		wait for 10 ns;
		I_RAM_EN <= '0';
		wait for 10 ns;
		I_RAM_EN <= '1';
		I_RAM_RE <= '1';
		I_RAM_WE <= '0';
		I_RAM_ADDR <= x"00002004";
		wait for 10 ns;
		-- end of the test
		-- disable the module
		I_RAM_EN <= '0';
		I_RAM_RE <= '0';
		I_RAM_WE <= '0';
      wait;
   end process;

END;