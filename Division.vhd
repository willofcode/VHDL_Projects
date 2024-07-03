----------------------------------------------------------------------------------
-- Company: CCNY
-- Engineer: William Ng
-- 
-- Create Date:    12:49:46 06/24/2024 
-- Design Name: 
-- Module Name:    Division - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Division is
    Port (
        I_CLK 			: in STD_LOGIC; -- Input Clock
        I_EN 			: in STD_LOGIC; -- Input Enabled
        I_Dividend	: in STD_LOGIC_VECTOR (5 downto 0); -- Input Divident
        I_Divisor 	: in STD_LOGIC_VECTOR (5 downto 0); -- Input Divisor
        O_Remainder	: out STD_LOGIC_VECTOR (5 downto 0); -- Higher Half Register represents Remainder
        O_Quotient	: out STD_LOGIC_VECTOR (5 downto 0)); -- Lower Half Register represents Quotient
end Division;

architecture Division_arch of Division is
    signal ALU_Out : STD_LOGIC_VECTOR (5 downto 0); -- ALU subtraction operation
    signal ALU_Flag : STD_LOGIC; -- Flag indication for LSB outputs depended if difference is negative or positive
    signal REG_HI : STD_LOGIC_VECTOR (5 downto 0); -- Higher Half
    signal REG_LO : STD_LOGIC_VECTOR (5 downto 0); -- Lower Half
    signal CTL_ALU, CTL_RMD, CTL_SLL, CTL_INI : STD_LOGIC; 
	 -- branch control signal for ALU, Remainder, Shift, and Initialize 
	 component ALU	Port ( 
		  I_ALU_EN   : in  STD_LOGIC; -- used to enable the ALU
		  I_ALU_A, I_ALU_B : in  STD_LOGIC_VECTOR (5 downto 0); -- the two inputs of the ALU
		  O_ALU_Out  : out  STD_LOGIC_VECTOR (5 downto 0); -- the output of the ALU
		  O_ALU_Flag : out  STD_LOGIC); -- Flag indicator for higher half and LSB
	 end component;
	 component DivRegister Port (
		  I_REG_Init, I_REG_Update	: in STD_LOGIC; -- let the register initialize, update the register its contents
		  I_REG_SLL, I_REG_LSB 	: in STD_LOGIC; -- let the register perform a shift, set the LSB of the register
		  I_REG_Div, I_REG_ALU 	: in STD_LOGIC_VECTOR (5 downto 0); -- pass Dividend, ALU output to the register
		  O_REG_HI, O_REG_LO : out STD_LOGIC_VECTOR (5 downto 0)); -- the output of HI and LO
	 end component;
	 component Control Port (
        I_CTL_CLK, I_CTL_EN : in STD_LOGIC; -- the control clock, and signal that enables the control unit
        O_CTL_ALU, O_CTL_RMD, O_CTL_SLL, O_CTL_INI : out STD_LOGIC); 
		  -- the control signal for ALU, Remainder, Shift,and the initialization of the register
	 end component;
begin
	 U1: ALU port map (CTL_ALU, REG_HI, I_Divisor, ALU_Out, ALU_Flag);
    U2: DivRegister port map (CTL_INI, CTL_RMD, CTL_SLL, ALU_Flag, I_Dividend, ALU_Out, REG_HI, REG_LO);
    U3: Control port map (I_CLK, I_EN, CTL_ALU, CTL_RMD, CTL_SLL, CTL_INI);
    O_Remainder <= REG_HI;
    O_Quotient <= REG_LO;
end Division_arch;
