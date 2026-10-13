library IEEE;
use IEEE.std_logic_1164.all;

entity sub4_s_tb is
end entity sub4_s_tb;

architecture sub4_s_tb_arq of sub4_s_tb is

	signal a_i   : std_logic_vector(3 downto 0);
	signal b_i   : std_logic_vector(3 downto 0);
	signal s_o   : std_logic_vector(3 downto 0);
	signal ovf_o : std_logic;

begin

	-- work: libreria por defecto del simulador; ahi queda la entidad sub4_s tras compilar sub4_s.vhd. Evita repetir component en el testbench
	dut : entity work.sub4_s
		port map (
			a_i   => a_i,
			b_i   => b_i,
			s_o   => s_o,
			ovf_o => ovf_o
		);

	-- Caso: +3 - +5  (esperado s=1110 (-2 en complemento a 2), ovf=0)
	a_i <= "0011";
	b_i <= "0101";

end architecture sub4_s_tb_arq;
