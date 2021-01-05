--
-- VHDL Architecture work.pipereg_if_id.behavioral
--
-- Created:
--          by - brandmar.extern (paulchen.Informatik.tu-cottbus.de)
--          at - 20:04:51 01/04/21
--
-- using Mentor Graphics HDL Designer(TM) 2020.1 Built on 20 Jan 2020 at 19:35:24
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
LIBRARY work;
USE work.pkg_alu.all;
USE work.pkg_util.all;
USE work.pkg_riscv_insts.all;

ENTITY pipereg_if_id IS
    port(
        i_rst : std_logic;
        i_clk : std_logic;
        
        i_encoded_instr : in std_logic_vector(31 downto 0);
        o_encoded_instr : out std_logic_vector(31 downto 0));

END pipereg_if_id ;

ARCHITECTURE behavioral OF pipereg_if_id IS
BEGIN

    process(i_clk)
    begin
        if (rising_edge(clk_i)) then
            if rst_i = '1' then
                o_encoded_instr <= (others => '0');
            else
                o_encoded_instr <= i_encoded_instr;
            end if;
        end if;
    end process;

END ARCHITECTURE behavioral;

