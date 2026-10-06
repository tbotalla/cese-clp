---------------------------------------------------------
-- Restador signed de 4 bits (complemento a 2, combinacional).
-- s_o = a - b en 4 bits.
-- ovf_o = overflow signed (signos distintos en a,b y signo de s_o distinto al de a).
---------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sub4_s is
	port(
		a_i   : in  std_logic_vector(3 downto 0);
		b_i   : in  std_logic_vector(3 downto 0);
		s_o   : out std_logic_vector(3 downto 0);
		ovf_o : out std_logic
	);
end entity;

architecture sub4_s_arq of sub4_s is

	signal sa     : signed(3 downto 0);
	signal sb     : signed(3 downto 0);
	signal diff4  : signed(3 downto 0);

begin

	sa    <= signed(a_i);
	sb    <= signed(b_i);
	diff4 <= sa - sb;

	s_o <= std_logic_vector(diff4);

	ovf_o <= '1' when (a_i(3) /= b_i(3) and diff4(3) /= a_i(3)) else '0';

end architecture;
