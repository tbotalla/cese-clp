library IEEE;
use IEEE.std_logic_1164.all;

entity shla4_s_tb is
end entity shla4_s_tb;

architecture shla4_s_tb_arq of shla4_s_tb is

	signal a_i   : std_logic_vector(3 downto 0);
	signal b_i   : std_logic_vector(3 downto 0);
	signal s_o   : std_logic_vector(3 downto 0);
	signal co_o  : std_logic;
	signal ovf_o : std_logic;

begin

	-- work: libreria por defecto del simulador; ahi queda la entidad shla4_s tras compilar shla4_s.vhd. Evita repetir component en el testbench
	dut : entity work.shla4_s
		port map (
			a_i   => a_i,
			b_i   => b_i,
			s_o   => s_o,
			co_o  => co_o,
			ovf_o => ovf_o
		);

	-- Caso: a = -1  (esperado s=1110 (-2 en complemento a 2), co=1 (el bit que 'sale'), ovf=0)
	a_i <= "1111"; -- -1 en complemento a 2
	b_i <= "0000"; -- no usado

end architecture shla4_s_tb_arq;
