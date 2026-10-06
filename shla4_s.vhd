---------------------------------------------------------
-- Desplazamiento aritmetico a la izquierda de 1 bit (signed, 4 bits).
-- Equivalente a a * 2 en complemento a 2.
-- b_i no se usa.
-- co_o = MSB de a que sale (bit shifted out).
-- ovf_o = resultado real no cabe en 4 bits signed.
---------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shla4_s is
	port(
		a_i   : in  std_logic_vector(3 downto 0);
		b_i   : in  std_logic_vector(3 downto 0);
		s_o   : out std_logic_vector(3 downto 0);
		co_o  : out std_logic;
		ovf_o : out std_logic
	);
end entity;

architecture shla4_s_arq of shla4_s is

	signal sa      : signed(3 downto 0);
	signal double5 : signed(4 downto 0);

begin

	sa      <= signed(a_i);
	double5 <= resize(sa, 5) + resize(sa, 5);

	s_o  <= std_logic_vector(double5(3 downto 0));
	co_o <= a_i(3);
	-- Signo en 5 bits inconsistente => 2*a no representable en 4 bits
	ovf_o <= '1' when double5(4) /= double5(3) else '0';

end architecture;
