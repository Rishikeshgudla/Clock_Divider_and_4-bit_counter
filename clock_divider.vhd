library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_divider is
    Port (
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        clk_out : out STD_LOGIC
    );
end clock_divider;

architecture Behavioral of clock_divider is

    signal count   : integer := 0;
    signal clk_div : STD_LOGIC := '0';

begin

    process(clk, reset)
    begin
        if reset = '1' then
            count <= 0;
            clk_div <= '0';

        elsif rising_edge(clk) then

            if count = 4 then
                count <= 0;
                clk_div <= not clk_div;
            else
                count <= count + 1;
            end if;

        end if;
    end process;

    clk_out <= clk_div;

end Behavioral;