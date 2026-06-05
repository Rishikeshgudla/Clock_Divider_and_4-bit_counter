library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    Port (
        clk      : in  STD_LOGIC;
        reset    : in  STD_LOGIC;
        clk_out  : out STD_LOGIC;
        count    : out STD_LOGIC_VECTOR(3 downto 0)
    );
end top;

architecture Structural of top is

    signal slow_clk : STD_LOGIC;

begin

    U1 : entity work.clock_divider
        port map(
            clk     => clk,
            reset   => reset,
            clk_out => slow_clk
        );

    U2 : entity work.counter
        port map(
            clk   => slow_clk,
            reset => reset,
            count => count
        );

    clk_out <= slow_clk;

end Structural;