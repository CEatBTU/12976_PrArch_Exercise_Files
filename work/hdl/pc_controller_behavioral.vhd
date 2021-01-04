--
-- VHDL Architecture work.pc_controller.behavioral
--
-- Created:
--          by - brandmar.extern (paulchen.Informatik.tu-cottbus.de)
--          at - 09:13:43 12/15/20
--
-- using Mentor Graphics HDL Designer(TM) 2020.1 Built on 20 Jan 2020 at 19:35:24
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY pc_controller IS
    PORT( 
        -- 0000: Std Instruction; 
        -- 0001: Branch Eq
        -- 0010: Branch Neq
        -- 0011: Branch LT
        -- 0100: Branch GE
        -- 0101: Branch LTU
        -- 0110: Branch GEU
        -- 1000: JAL; 
        -- 1001: JALR  
        i_pc_ctrl    : IN std_logic_vector (3 DOWNTO 0);
        i_alu_ltu    : IN std_logic := '0';
        i_alu_lt     : IN std_logic := '0';
        i_alu_eq     : IN std_logic := '0';
        i_alu_gt     : IN std_logic := '0';
        i_alu_gtu    : IN std_logic := '0';
        -- 00: PC+4
        -- 01: PC+IMM (Branch, JAL)
        -- 10: ALU Result (JALR)
        o_pc_ctrl    : OUT std_logic_vector (1 DOWNTO 0));
END ENTITY pc_controller;

ARCHITECTURE behavioral OF pc_controller IS
BEGIN

    process(i_pc_ctrl, i_alu_lt, i_alu_eq, i_alu_gt) is
    begin
        case i_pc_ctrl is 
            when "0000" =>
                o_pc_ctrl <= "00";
            
            -- EQ
            when "0001" =>
                if i_alu_eq = '0' then 
                    o_pc_ctrl <= "00";
                else
                    o_pc_ctrl <= "01";
                end if;

            -- NE
            when "0010" =>
                if i_alu_eq = '1' then 
                    o_pc_ctrl <= "00";
                else
                    o_pc_ctrl <= "01";
                end if;

            -- LT
            when "0011" =>
                if not (i_alu_lt = '1') then 
                    o_pc_ctrl <= "00";
                else
                    o_pc_ctrl <= "01";
                end if;

            -- GE
            when "0100" =>
                if not (i_alu_gt = '1' or i_alu_eq = '1') then 
                    o_pc_ctrl <= "00";
                else
                    o_pc_ctrl <= "01";
                end if;

            -- LTU
            when "0101" =>
                if not (i_alu_ltu = '1') then 
                    o_pc_ctrl <= "00";
                else
                    o_pc_ctrl <= "01";
                end if;

            -- GEU
            when "0110" =>
                if not (i_alu_gtu = '1' or i_alu_eq = '1') then 
                    o_pc_ctrl <= "00";
                else
                    o_pc_ctrl <= "01";
                end if;

            when "1000" =>
                o_pc_ctrl <= "01";

            when "1001" =>
                o_pc_ctrl <= "10";

            when others =>
                o_pc_ctrl <= "00";
        end case;
    end process;

END ARCHITECTURE behavioral;

