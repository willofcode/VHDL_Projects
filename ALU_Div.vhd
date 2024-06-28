----------------------------------------------------------------------------------
-- Company: CCNY
-- Engineer: William Ng
-- 
-- Create Date:    12:45:23 06/20/2024 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( I_ALU_EN   : in  STD_LOGIC; -- used to enable the ALU
           I_ALU_A    : in  STD_LOGIC_VECTOR (5 downto 0); -- the first input of the ALU
           I_ALU_B 	 : in  STD_LOGIC_VECTOR (5 downto 0); -- the second input of the ALU
           O_ALU_Out  : out  STD_LOGIC_VECTOR (5 downto 0); -- the output of the ALU
           O_ALU_Flag : out  STD_LOGIC); -- Flag indicates which input is bigger, used to set the LSB of the Register
end ALU;

architecture ALU_arch of ALU is
begin		
	process(I_ALU_EN, I_ALU_A, I_ALU_B)
	-- variable declaration
	variable IN_A: integer;
	variable IN_B: integer;
	variable O_AB: integer;
	begin
		-- type vector to unsigned integer conversion (input)
		IN_A := to_integer(unsigned(I_ALU_A)); -- assign IN_A as the Remainder Register
		IN_B := to_integer(unsigned(I_ALU_B)); -- assign IN_B as the divisor
		-- enable is turned on to intialized ALU arithmetic operation
		if I_ALU_EN = '1' then
			if (IN_A >= IN_B) then
				O_AB := IN_A - IN_B; 
				O_ALU_Out <= STD_LOGIC_VECTOR(to_unsigned(O_AB, 6)); -- type vector to unsigned integer conversion (output)
				O_ALU_Flag <='1'; -- the Remainder is larger, a positive sum, hence the LSB is 1
			else 
				O_ALU_Out <= I_ALU_A;
				O_ALU_Flag <='0'; -- the Divisor is larger, a negative sum, hence the LSB is 0
		-- enable turned off
			end if;
		end if;
	end process;
end ALU_arch;

