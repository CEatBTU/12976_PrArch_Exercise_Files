--
-- VHDL Package Header work.riscv_insts
--
-- Created:
--          by - bmarc.UNKNOWN (LAPTOP-TS0CSSEU)
--          at - 08:35:17 10/ 1/2020
--
-- using Mentor Graphics HDL Designer(TM) 2020.3 Built on 12 Jul 2020 at 11:01:26
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE pkg_riscv_insts IS

  -- This type represents an instruction from the RISC-V ISA
  type t_riscv_inst is (
    -- Load (upper) immediate operation
    -- U-type
	INST_LUI,
	INST_AUIPC,

    -- Control operations
    -- B-type
    INST_BEQ, 
    INST_BNE,
    INST_BLTU,
    INST_BLT,
    INST_BGE,
    INST_BGEU,

    -- Memory operations
    INST_LW, -- I-type
    INST_SW, -- S-type

    -- Immediate operations
    -- I-type
    INST_ADDI,
    INST_SLTI,
    INST_SLTIU,
    INST_XORI,
    INST_ORI,
	INST_ANDI,
	-- JALR uses the I-type encoding too
	INST_JALR,

    -- Shifts
    -- R-type
    INST_SLLI,
    INST_SRLI,
    INST_SRAI,

    -- Register-to-Register
    -- R-type
    INST_ADD,
    INST_SUB,
    INST_SLL,
    INST_SLT,
    INST_SLTU,
    INST_XOR,
    INST_SRL,
    INST_SRA,
    INST_OR,
    INST_AND,
	
	-- JUMP
	-- J-Type
	INST_JAL,

    INST_UNDEFINED);
	
  function is_utype(instr : t_riscv_inst) return boolean;
  function is_itype(instr : t_riscv_inst) return boolean;
  function is_stype(instr : t_riscv_inst) return boolean;
  function is_jtype(instr : t_riscv_inst) return boolean;

	-- Functions for which the register write signal will
	-- be set to the ALU output.
	function writes2reg(instr : t_riscv_inst) return boolean;
	function is_SET(instr : t_riscv_inst) return boolean;
	function is_branch(instr : t_riscv_inst) return boolean;
	function is_pc2reg(instr : t_riscv_inst) return boolean;
END pkg_riscv_insts;

PACKAGE BODY pkg_riscv_insts IS
	function is_utype(instr : t_riscv_inst) return boolean is
	begin
		if (instr = INST_LUI)  or (instr = INST_AUIPC) then
			return true;
		else
			return false;
		end if;
	end function;

	function is_rtype(instr : t_riscv_inst) return boolean is
	begin
		if (instr = INST_ADD) or (instr = INST_SUB) or (instr = INST_SLL) 
		or (instr = INST_XOR) or (instr = INST_SRL) or (instr = INST_SRA)
		or (instr = INST_OR)  or (instr = INST_AND) then
			return true;
		else
			return false;
		end if;
	end function;

  	function is_itype(instr : t_riscv_inst) return boolean is
	begin
		if (instr = INST_ADDI) or (instr = INST_XORI) or (instr = INST_ORI) 
		or (instr = INST_ANDI) or (instr = INST_SLTI) or (instr = INST_SLTIU)
		or (instr = INST_SLLI) or (instr = INST_SRLI) or (instr = INST_SRAI) 
		or (instr = INST_LW)   or (instr = INST_JALR) then
			return true;
		else
			return false;
		end if;
	end function;
	
	function is_stype(instr : t_riscv_inst) return boolean is
	begin
	  if (instr = INST_SW) then
	    return true;
	  else
	    return false;
	  end if;
	end function;	

	function is_jtype(instr : t_riscv_inst) return boolean is
	begin
	  if (instr = INST_JAL) then
	    return true;
	  else
	    return false;
	  end if;
	end function;
	
	
	function is_SET(instr : t_riscv_inst) return boolean is
	begin
		if (instr = INST_SLT) or (instr = INST_SLTI) or (instr = INST_SLTIU) or (instr = INST_SLTU) then
			return true;
		else
			return false;
		end if;
	end function;
	
	function is_branch(instr : t_riscv_inst) return boolean is
	begin
		if (instr = INST_BEQ) or (instr = INST_BGE) or (instr = INST_BLT) then
			return true;
		else
			return false;
		end if;
	end function;
	
	function is_pc2reg(instr : t_riscv_inst) return boolean is
	begin
		if (instr = INST_JAL) or (instr = INST_JALR) or (instr = INST_AUIPC) then
			return true;
		else
			return false;
		end if;
	end function;

	function writes2reg(instr : t_riscv_inst) return boolean is
	begin
		if is_rtype(instr) or is_itype(instr) or is_utype(instr) then
			return true;
		else
			return false;
		end if;
	end function;

END PACKAGE BODY;
