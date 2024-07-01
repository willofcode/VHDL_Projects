----------------------------------------------------------------------------------
-- Company: CCNY
-- Engineer: William Ng
-- 
-- Create Date:    12:48:41 06/24/2024 
-- Design Name: 
-- Module Name:    Control - Behavioral 
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

entity Control is
    Port (
        I_CTL_CLK : in STD_LOGIC; -- the clock that drives the control unit
        I_CTL_EN 	: in STD_LOGIC; -- the signal that enables the control unit
        O_CTL_ALU : out STD_LOGIC; -- the control signal that enables the ALU
        O_CTL_RMD : out STD_LOGIC; -- the control signal that triggers the update of the remainder register
        O_CTL_SLL : out STD_LOGIC; -- the control signal that triggers the shift of the remainder register
        O_CTL_INI : out STD_LOGIC); -- the control signal that triggers the initialization of the register
end Control;

architecture control_arch of Control is
    type control_state is (S0, S1, S2, S3, S4); -- control types
	 -- S0: Initialize
	 -- S1: Register Shift
	 -- S2: ALU Subtract
	 -- S3: Register Update
	 -- S4: Result
    signal state: control_state := S0;
	 -- signal state : control_state; -- the current state of the control type
	 -- signal next_state : control_state; -- the next state of the control type
begin
    process (I_CTL_CLK)
    begin
        if rising_edge(I_CTL_CLK) then
            if I_CTL_EN = '1' then 
				-- condition when control is enabled
					if state = S0 then -- intialize to shift
						state <= S1; 
					elsif state = S1 then -- shift to subtract
						state <= S2;
					elsif state = S2 then -- subtract to update
						state <= S3;
					elsif state = S3 then --- update to result
						state <= S4;
					elsif state = S4 then -- result to shift
						state <= S1;
					end if;
				-- current state gets updated with next state
				-- control is disabled
            end if;
        end if;
    end process;

    process (state)
    begin
			if state = S0 then -- Initialize
                O_CTL_INI <= '1';
                O_CTL_SLL <= '0';
                O_CTL_ALU <= '0';
                O_CTL_RMD <= '0';
					 -- next state updates control state sequentially
        elsif state = S1 then -- Shift
                O_CTL_INI <= '0';
                O_CTL_SLL <= '1';
                O_CTL_ALU <= '0';
                O_CTL_RMD <= '0';
					 -- next state updates control state sequentially
        elsif state = S2 then -- Subtract
					 O_CTL_INI <= '0';
                O_CTL_SLL <= '0';
                O_CTL_ALU <= '1';
					 O_CTL_RMD <= '0';
					 -- next state updates control state sequentially
        elsif state = S3 then -- Update
					 O_CTL_INI <= '0';
                O_CTL_SLL <= '0';		  
                O_CTL_ALU <= '0';
                O_CTL_RMD <= '1';
					 -- next state updates control state sequentially
        elsif state = S4 then -- Result
		  			 O_CTL_INI <= '0';
                O_CTL_SLL <= '0';		  
					 O_CTL_ALU <= '0';
					 O_CTL_RMD <= '0';
					 -- next resets after a full cycle
        end if;
    end process;
end control_arch;
