--
-- VHDL Architecture work.pipereg_id_ex.behavioral
--
-- Created:
--          by - brandmar.extern (paulchen.Informatik.tu-cottbus.de)
--          at - 20:23:42 01/04/21
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

ENTITY pipereg_id_ex IS
    port(
        i_rst : std_logic;
        i_clk : std_logic;
    
        -- Signals from the instr. decoder
        i_memrd         : in std_logic;
        i_memwr         : in std_logic;
        i_regwr         : in std_logic;
        i_alusrc        : in std_logic;
        i_pc_ctrl       : in std_logic_vector(3 downto 0);
        i_regwdsel      : in std_logic_vector(2 downto 0);
        i_aluop         : in aluop;

        o_memrd         : out std_logic;
        o_memwr         : out std_logic;
        o_regwr         : out std_logic;
        o_alusrc        : out std_logic;
        o_pc_ctrl       : out std_logic_vector(3 downto 0);
        o_regwdsel      : out std_logic_vector(2 downto 0);
        o_aluop         : out aluop;

        -- Signals from the reg. file
        i_regA          : in  std_logic_vector(31 downto 0);
        i_regB          : in  std_logic_vector(31 downto 0);
        o_regA          : out std_logic_vector(31 downto 0);
        o_regB          : out std_logic_vector(31 downto 0);

        -- Immediate
        i_imm           : in std_logic_vector(31 downto 0);
        o_imm           : out std_logic_vector(31 downto 0);

        -- PC + 4
        i_pcplusfour    : in std_logic_vector(31 downto 0);
        o_pcplusfour    : out std_logic_vector(31 downto 0);

        -- PC + Immediate
        i_pcplusimm     : in std_logic_vector(31 downto 0);
        o_pcplusimm     : out std_logic_vector(31 downto 0));


END pipereg_id_ex ;

--
ARCHITECTURE behavioral OF pipereg_id_ex IS
BEGIN
END ARCHITECTURE behavioral;

