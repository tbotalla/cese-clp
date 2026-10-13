library IEEE;
use IEEE.std_logic_1164.all;

entity alu_tb is
end entity alu_tb;

architecture alu_tb_arq of alu_tb is

	signal opcode_i   : std_logic_vector(1 downto 0);
	signal a_i        : std_logic_vector(3 downto 0);
	signal b_i        : std_logic_vector(3 downto 0);
	signal result_o   : std_logic_vector(3 downto 0);
	signal carry_o    : std_logic;
	signal overflow_o : std_logic;

begin

	-- work: libreria por defecto del simulador; ahi queda la entidad alu tras compilar alu.vhd (y sus submodulos). Evita repetir component en el testbench
	dut : entity work.alu
		port map (
			opcode_i   => opcode_i,
			a_i        => a_i,
			b_i        => b_i,
			result_o   => result_o,
			carry_o    => carry_o,
			overflow_o => overflow_o
		);

	-- Caso: ADD +4 + +5  (esperado result=1001, carry=0, overflow=1)
	opcode_i <= "00"; -- ADD
	a_i      <= "0100";
	b_i      <= "0101";

end architecture alu_tb_arq;
