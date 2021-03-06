library ieee;
use ieee.std_logic_1164.all;
entity stimgen is
    port(
        clk       : in  std_logic;
        rst       : in  std_logic;
        start     : out std_logic;
        -- TODO N1 "Find Net": On the line below, select the port "stim_data", right-click
        -- and select "Find Net". The "Net Search" view opens and shows: 
        -- * all signals in the net
        -- * all drivers in the net
        -- * all loads in the net  
        stim_data : out std_logic_vector(7 downto 0)
    );
end entity stimgen;

architecture BEH of stimgen is
begin
    name : process(clk) is
    begin
        if rising_edge(clk) then
            if rst = '1' then
                stim_data <= (others => '0');
            else
                stim_data <= not stim_data;
            end if;
        end if;
    end process name;

    start_p : process is
    begin
        for i in 0 to 10 loop
            wait until rising_edge(clk);
        end loop;

        start <= '1';
        wait; -- forever
    end process start_p;

end architecture BEH;
