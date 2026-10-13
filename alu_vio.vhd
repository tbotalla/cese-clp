---------------------------------------------------------
-- Top: ALU probada desde VIO (JTAG) en placa remota.
--
-- probe_out0[9:0]  -> { opcode[1:0], a_i[3:0], b_i[3:0] }
-- probe_in0[5:0]   -> { overflow, carry, result_o[3:0] }
-- led[3:0]         -> result_o (visual en Arty Z7)
---------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity alu_vio is
	port (
		clk_pin : in  std_logic;
		led   : out std_logic_vector(3 downto 0)
	);
end entity alu_vio;

architecture alu_vio_arq of alu_vio is

	component alu is
		port (
			opcode_i   : in  std_logic_vector(1 downto 0);
			a_i        : in  std_logic_vector(3 downto 0);
			b_i        : in  std_logic_vector(3 downto 0);
			result_o   : out std_logic_vector(3 downto 0);
			carry_o    : out std_logic;
			overflow_o : out std_logic
		);
	end component;

	component vio
		port (
			clk        : in  std_logic;
			probe_in0  : in  std_logic_vector(5 downto 0);
			probe_out0 : out std_logic_vector(9 downto 0)
		);
	end component;

	signal vio_out   : std_logic_vector(9 downto 0);
	signal vio_in    : std_logic_vector(5 downto 0);
	signal opcode_s  : std_logic_vector(1 downto 0);
	signal a_s       : std_logic_vector(3 downto 0);
	signal b_s       : std_logic_vector(3 downto 0);
	signal result_s  : std_logic_vector(3 downto 0);
	signal carry_s   : std_logic;
	signal overflow_s : std_logic;

begin

	opcode_s <= vio_out(9 downto 8);
	a_s      <= vio_out(7 downto 4);
	b_s      <= vio_out(3 downto 0);

	vio_in(3 downto 0) <= result_s;
	vio_in(4)          <= carry_s;
	vio_in(5)          <= overflow_s;

	led <= result_s;

	u_alu : alu
		port map (
			opcode_i   => opcode_s,
			a_i        => a_s,
			b_i        => b_s,
			result_o   => result_s,
			carry_o    => carry_s,
			overflow_o => overflow_s
		);

	u_vio : vio
		port map (
			clk        => clk_pin,
			probe_in0  => vio_in,
			probe_out0 => vio_out
		);

end architecture alu_vio_arq;
