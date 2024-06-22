----------------------------------------------------------------------------------
-- Company: CCNY
-- Engineer: William Ng
-- 
-- Create Date:    14:24:38 06/12/2024 
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
library UNISIM;
use UNISIM.VComponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A 		 : in   STD_LOGIC;
           A_inv   : in   STD_LOGIC;
           B 		 : in   STD_LOGIC;
           B_inv 	 : in   STD_LOGIC;
           CarryIn : in   STD_LOGIC;
           OP0 	 : in   STD_LOGIC;
           OP1	  	 : in   STD_LOGIC;
           CarryOut: out  STD_LOGIC;
           Result  : out  STD_LOGIC);
end ALU;

architecture ALU_arch of ALU is
signal A_L, B_L, A_out, B_out : STD_LOGIC;
signal AND_out, OR_out, ADD_out : STD_LOGIC;
component INV port (I: in STD_LOGIC; O: out STD_LOGIC); end component;
component AND2 port (I0,I1: in STD_LOGIC; O: out STD_LOGIC); end component;
component OR2 port (I0,I1: in STD_LOGIC; O: out STD_LOGIC); end component;
component mux2_1 port (D0,D1,S0: in STD_LOGIC; Y: out STD_LOGIC); end component;
component ADDER port (A,B,CI: in STD_LOGIC; CO,S: out STD_LOGIC); end component;
component mux4_1 port (D0, D1, D2, D3, S0, S1: in STD_LOGIC; Y: out STD_LOGIC); end component;
begin
	U1: INV port map (A, A_L);
	U2: INV port map (B, B_L);
	U3: mux2_1 port map (A, A_L, A_inv, A_out);
	U4: mux2_1 port map (B,B_L, B_inv, B_out);
	U5: AND2 port map (A_out, B_out, AND_out);
	U6: OR2 port map (A_out, B_out, OR_out);
	U7: ADDER port map (A_out, B_out, CarryIn, CarryOut, ADD_out); 
	U8: mux4_1 port map (AND_out, OR_out, ADD_out,'0', OP0, OP1, Result);
end ALU_arch;