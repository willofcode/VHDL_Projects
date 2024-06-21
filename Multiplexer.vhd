----------------------------------------------------------------------------------
-- Company: CCNY
-- Engineer: William Ng
-- 
-- Create Date:    12:47:41 06/12/2024 
-- Design Name: 	4_1 Multiplexer
-- Module Name:    Multiplexer - Behavioral 
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

entity mux4_1 is
    Port ( D0 : in  STD_LOGIC;
           D1 : in  STD_LOGIC;
			  D2 : in  STD_LOGIC;
           D3 : in  STD_LOGIC;
			  S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end mux4_1;

architecture mux4_1_arch of mux4_1 is
signal S0_L, S1_L: STD_LOGIC;
signal S0L_S1L_D0, S0_SlL_D1, S0L_S1_D2, S0_S1_D3: STD_LOGIC;
component INV port (I: in STD_LOGIC; O: out STD_LOGIC); end component;
component AND3 port (I0,I1,I2: in STD_LOGIC; O: out STD_LOGIC); end component;
component OR4 port (I0,I1,I2,I3: in STD_LOGIC; O: out STD_LOGIC); end component;
begin
	U1: INV port map (S0, S0_L);
	U2: INV port map (S1, S1_L);
	U3: AND3 port map (S0_L, S1_L, D0, S0L_S1L_D0);
	U4: AND3 port map (S0, S1_L, D1, S0_SlL_D1);
	U5: AND3 port map (S0_L, S1, D2, S0L_S1_D2);
	U6: AND3 port map (S0, S1, D3, S0_S1_D3);
	U7: OR4 port map (S0L_S1L_D0, S0_SlL_D1, S0L_S1_D2, S0_S1_D3, Y);
end mux4_1_arch;

