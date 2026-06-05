library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_top is
end tb_top;

architecture Behavioral of tb_top is

    signal clk   : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '1';
    signal clk_out : STD_LOGIC;
    signal count : STD_LOGIC_VECTOR(3 downto 0);

begin

    DUT : entity work.top
        port map(
            clk     => clk,
            reset   => reset,
            clk_out => clk_out,
            count   => count
        );

    -- Clock Generation
    clk <= not clk after 5 ns;

    -- Stimulus
    process
    begin
        wait for 20 ns;
        reset <= '0';

        wait for 500 ns;

        wait;
    end process;

end Behavioral;