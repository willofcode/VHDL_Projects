----------------------------------------------------------------------------------
-- Company: CCNY
-- Engineer: William Ng
-- 
-- Create Date:    12:47:15 06/20/2024 
-- Design Name: 
-- Module Name:    DivRegister - Behavioral 
-- Project Name: 		Register Unit
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DivRegister is
    Port (
        I_REG_Init 	: in STD_LOGIC; -- control signal to let the register initialize its contents
        I_REG_Update	: in STD_LOGIC; -- control signal to let the register update its contents
        I_REG_SLL 	: in STD_LOGIC; -- control signal to let the register perform a shift
        I_REG_LSB 	: in STD_LOGIC; -- used to set the LSB of the register
        I_REG_Div 	: in STD_LOGIC_VECTOR (5 downto 0); -- pass Dividend to the register
        I_REG_ALU 	: in STD_LOGIC_VECTOR (5 downto 0); -- pass ALU output to the register
        O_REG_HI 		: out STD_LOGIC_VECTOR (5 downto 0);-- the output of HI
        O_REG_LO 		: out STD_LOGIC_VECTOR (5 downto 0)); -- the output of LO
end DivRegister;


architecture DivReg_arch of DivRegister is
begin
    process (I_REG_Init, I_REG_Update, I_REG_SLL, I_REG_LSB, I_REG_Div, I_REG_ALU)
	 -- init, update, Shift, LSB, Dividend, and Remainder ports gets updated throughout the process
	     variable Half_HI : STD_LOGIC_VECTOR (5 downto 0);
		  variable Half_LO : STD_LOGIC_VECTOR (5 downto 0);
    begin
		  if I_REG_Init = '1' then
		  -- when init is enabled, then intialized the higher half and lower half of register
            Half_HI := "000000";
            Half_LO := I_REG_Div(5 downto 0);
        elsif I_REG_Update = '1' then
		  -- update the register, return the arithetic operation between the higher half register and the divisor
				Half_HI := I_REG_ALU(5 downto 0);
				if I_REG_LSB = '1' then
					Half_LO(0) := '1';
				end if;
        elsif I_REG_SLL = '1' then
		  -- shift the remainder register, higher half and lower half shift by 1 bit to the left
            Half_HI := Half_HI(4 downto 0) & Half_LO(5);
            Half_LO := Half_LO(4 downto 0) & I_REG_LSB;
				if I_REG_LSB ='1' then
					Half_LO(0):= '1';
				else
					Half_LO(0):= '0';
				end if;
        end if;
		  O_REG_HI <= Half_HI;
		  O_REG_LO <= Half_LO;
    end process;
end DivReg_arch;
