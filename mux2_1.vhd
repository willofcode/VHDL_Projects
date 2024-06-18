----------------------------------------------------------------------------------
-- Company: CCNY
-- Engineer: William Ng
-- 
-- Create Date:    13:29:35 06/13/2024 
-- Design Name: 	Mux2_1
-- Module Name:    M2_1 - Behavioral 
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

entity mux2_1 is
    Port ( D0 : in  STD_LOGIC;
           D1 : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           Y  : out  STD_LOGIC);
end mux2_1;

architecture mux2_1_arch of mux2_1 is
signal S0_L: STD_LOGIC;
signal D0_S0L, D1_S0: STD_LOGIC;
component INV port (I: in STD_LOGIC; O: out STD_LOGIC); end component;
component AND2 port (I0,I1: in STD_LOGIC; O: out STD_LOGIC); end component;	
component OR2 port (I0,I1: in STD_LOGIC; O: out STD_LOGIC); end component;
begin
	U1: INV port map (S0, S0_L);
	U2: AND2 port map (D0, S0_L, D0_S0L);
	U3: AND2 port map (D1, S0, D1_S0);
	U4: OR2 port map (D0_S0L, D1_S0, Y);
end mux2_1_arch;

