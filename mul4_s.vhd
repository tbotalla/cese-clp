---------------------------------------------------------
-- Multiplicador signed de 4 bits (combinacional).
-- s_o = (a * b) en 4 bits (parte baja).
-- ovf_o si el producto no cabe en 4 bits signed.
-- Usa operador * de numeric_std.
---------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mul4_s is
	port(
		a_i   : in  std_logic_vector(3 downto 0);
		b_i   : in  std_logic_vector(3 downto 0);
		s_o   : out std_logic_vector(3 downto 0);
		ovf_o : out std_logic
	);
end entity;

architecture mul4_s_arq of mul4_s is

	signal sa        : signed(3 downto 0);
	signal sb        : signed(3 downto 0);
	signal product8  : signed(7 downto 0);
	signal trunc4    : signed(3 downto 0);

begin

	sa       <= signed(a_i);
	sb       <= signed(b_i);
	product8 <= sa * sb;
	trunc4   <= product8(3 downto 0);

	s_o <= std_logic_vector(trunc4);

	-- Producto de 8 bits distinto de la extension de signo del nibble bajo => overflow
	ovf_o <= '1' when product8 /= resize(trunc4, 8) else '0';

end architecture;
