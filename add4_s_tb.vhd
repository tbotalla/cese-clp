library IEEE;
use IEEE.std_logic_1164.all;

entity add4_s_tb is
end entity add4_s_tb;

architecture add4_s_tb_arq of add4_s_tb is

	signal a_i   : std_logic_vector(3 downto 0);
	signal b_i   : std_logic_vector(3 downto 0);
	signal s_o   : std_logic_vector(3 downto 0);
	signal co_o  : std_logic;
	signal ovf_o : std_logic;

begin

	-- work: libreria por defecto del simulador; ahi queda la entidad add4_s tras compilar add4_s.vhd. Evita repetir component en el testbench
	dut : entity work.add4_s
		port map (
			a_i   => a_i,
			b_i   => b_i,
			s_o   => s_o,
			co_o  => co_o,
			ovf_o => ovf_o
		);

	-- Caso: +4 + +5  (esperado s=1001, co=0, ovf=1 pues no representable en 4 bits signed)
	a_i <= "0100";
	b_i <= "0101";

end architecture add4_s_tb_arq;
