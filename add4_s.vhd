---------------------------------------------------------
-- Componente: add4_s
--
-- Sumador signed de 4 bits (complemento a 2, combinacional).
-- s_o = a + b en 4 bits;
-- co_o = bit 4 de la suma en 5 bits;
-- ovf_o = overflow signed (mismos signos en a,b y signo distinto en s_o).
---------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity add4_s is
	port(
		a_i   : in  std_logic_vector(3 downto 0);
		b_i   : in  std_logic_vector(3 downto 0);
		s_o   : out std_logic_vector(3 downto 0);
		co_o  : out std_logic;
		ovf_o : out std_logic
	);
end entity;

architecture add4_s_arq of add4_s is

	signal sa   : signed(3 downto 0);
	signal sb   : signed(3 downto 0);
	signal sum5 : signed(4 downto 0);

begin

	sa   <= signed(a_i);
	sb   <= signed(b_i);
	sum5 <= resize(sa, 5) + resize(sb, 5); -- resize respeta el signo

	s_o  <= std_logic_vector(sum5(3 downto 0));
	co_o <= std_logic(sum5(4));

	ovf_o <= '1' when (a_i(3) = b_i(3) and sum5(3) /= a_i(3)) else '0';

end architecture;
