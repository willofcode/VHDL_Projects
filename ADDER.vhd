----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:00:15 06/13/2024 
-- Design Name: 
-- Module Name:    ADDER - Behavioral 
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
library UNISIM;
use UNISIM.VComponents.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADDER is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           CI : in  STD_LOGIC;
           CO : out  STD_LOGIC;
           S : out  STD_LOGIC);
end ADDER;

architecture ADDER_arch  of ADDER is
signal A_CI, CI_B, A_B: STD_LOGIC;
component AND2 port (I0,I1: in STD_LOGIC; O: out STD_LOGIC); end component;
component OR3 port (I0,I1,I2: in STD_LOGIC; O: out STD_LOGIC); end component;
component XOR3 port (I0,I1,I2: in STD_LOGIC; O: out STD_LOGIC); end component;
begin
	U1: AND2 port map (A, CI, A_CI);
	U2: AND2 port map (B, CI, CI_B);
	U3: AND2 port map (A, B, A_B);
	U4: OR3 port map (A_CI, CI_B, A_B, CO);
	U5: XOR3 port map (A, B, CI, S);
end ADDER_arch ;

