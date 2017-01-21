library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

Entity nine_counter is
port(
iClk, iRst : in std_logic;
iData : in std_logic;
outpdata: out std_logic_vector(5 to 0));
End Entity nine_counter;

architecture Behavioral of nine_counter is
  type state_type is (A,B,C,D,E,F,G,H);
  signal state : state_type := A;
  begin
  process(iClk)
  begin
    if( iRst = '1' ) then     --reset state and output signal when reset is asserted.
        outpdata <= "000000";
        state <= A;
    elsif ( rising_edge(iClk) ) then   --calculates the next state based on current state and input bit.
    if ( iData = '1' ) then
        case state is
            when A =>   --when the current state is A.
              outpdata <= "000000";
              state <= B;
            when B =>
              outpdata <= "001001";
              state <= C;
            when C =>
              outpdata <= "010010";
              state <= D;
            when D =>
              outpdata <= "011011";
              state <= E;
            when E =>
              outpdata <= "100100";
              state <= F;
            when F =>
              outpdata <= "101101";
              state <= G;
            when G =>
              outpdata <= "110110";
              state <= H;
            when H =>
              outpdata <= "111111";
            when others =>
                  NULL;
            end case;
        end if;
      end if;
  end process;
  end Behavioral;
