library IEEE;
use IEEE.std_logic_1164.all;

entity mul4_s_tb is
end entity mul4_s_tb;

architecture mul4_s_tb_arq of mul4_s_tb is

	signal a_i   : std_logic_vector(3 downto 0);
	signal b_i   : std_logic_vector(3 downto 0);
	signal s_o   : std_logic_vector(3 downto 0);
	signal ovf_o : std_logic;

begin

	-- work: libreria por defecto del simulador; ahi queda la entidad mul4_s tras compilar mul4_s.vhd. Evita repetir component en el testbench
	dut : entity work.mul4_s
		port map (
			a_i   => a_i,
			b_i   => b_i,
			s_o   => s_o,
			ovf_o => ovf_o
		);

	-- Caso: +4 * +3  (esperado s=1100, ovf=1 pues no representable en 4 bits signed)
	a_i <= "0100";
	b_i <= "0011";

end architecture mul4_s_tb_arq;
