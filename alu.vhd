---------------------------------------------------------
-- alu
--
-- ALU combinacional de 4 bits; ADD/SUB/MUL/SHL signed (4 bits de resultado).
-- Opcode: 00 ADD, 01 SUB, 10 MUL, 11 SHL (1 bit)
-- Flags: carry_o, overflow_o (zero/negative = derivar de result_o)
---------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu is
	port(
		opcode_i   : in  std_logic_vector(1 downto 0);
		a_i        : in  std_logic_vector(3 downto 0);
		b_i        : in  std_logic_vector(3 downto 0);
		result_o   : out std_logic_vector(3 downto 0);
		carry_o    : out std_logic;
		overflow_o : out std_logic
	);
end entity;

architecture alu_arq of alu is

	constant OP_ADD : std_logic_vector(1 downto 0) := "00";
	constant OP_SUB : std_logic_vector(1 downto 0) := "01";
	constant OP_MUL : std_logic_vector(1 downto 0) := "10";
	constant OP_SHL : std_logic_vector(1 downto 0) := "11";

	component add4_s is
		port(
			a_i   : in  std_logic_vector(3 downto 0);
			b_i   : in  std_logic_vector(3 downto 0);
			s_o   : out std_logic_vector(3 downto 0);
			co_o  : out std_logic;
			ovf_o : out std_logic
		);
	end component;

	component sub4_s is
		port(
			a_i   : in  std_logic_vector(3 downto 0);
			b_i   : in  std_logic_vector(3 downto 0);
			s_o   : out std_logic_vector(3 downto 0);
			ovf_o : out std_logic
		);
	end component;

	component mul4_s is
		port(
			a_i   : in  std_logic_vector(3 downto 0);
			b_i   : in  std_logic_vector(3 downto 0);
			s_o   : out std_logic_vector(3 downto 0);
			ovf_o : out std_logic
		);
	end component;

	component shla4_s is
		port(
			a_i   : in  std_logic_vector(3 downto 0);
			b_i   : in  std_logic_vector(3 downto 0);
			s_o   : out std_logic_vector(3 downto 0);
			co_o  : out std_logic;
			ovf_o : out std_logic
		);
	end component;

	signal add_s   : std_logic_vector(3 downto 0);
	signal add_co  : std_logic;
	signal add_ovf : std_logic;
	
	signal sub_s   : std_logic_vector(3 downto 0);
	signal sub_ovf : std_logic;

	signal mul_s   : std_logic_vector(3 downto 0);
	signal mul_ovf : std_logic;

	signal shl_s   : std_logic_vector(3 downto 0);
	signal shl_co  : std_logic;
	signal shl_ovf : std_logic;

begin

	add4_s_inst : add4_s
		port map(
			a_i   => a_i,
			b_i   => b_i,
			s_o   => add_s,
			co_o  => add_co,
			ovf_o => add_ovf
		);

	sub4_s_inst : sub4_s
		port map(
			a_i   => a_i,
			b_i   => b_i,
			s_o   => sub_s,
			ovf_o => sub_ovf
		);

	mul4_s_inst : mul4_s
		port map(
			a_i   => a_i,
			b_i   => b_i,
			s_o   => mul_s,
			ovf_o => mul_ovf
		);

	shla4_s_inst : shla4_s
		port map(
			a_i   => a_i,
			b_i   => b_i,
			s_o   => shl_s,
			co_o  => shl_co,
			ovf_o => shl_ovf
		);

	alu_comb : process (opcode_i, add_s, add_co, add_ovf, sub_s, sub_ovf, mul_s, mul_ovf, shl_s, shl_co, shl_ovf)
		variable res_v      : std_logic_vector(3 downto 0);
		variable carry_v    : std_logic;
		variable overflow_v : std_logic;
	begin
		res_v      := (others => '0');
		carry_v    := '0';
		overflow_v := '0';

		case opcode_i is
			when OP_ADD =>
				res_v      := add_s;
				carry_v    := add_co;
				overflow_v := add_ovf;

			when OP_SUB =>
				res_v      := sub_s;
				carry_v    := '0';
				overflow_v := sub_ovf;

			when OP_MUL =>
				res_v      := mul_s;
				carry_v    := '0';
				overflow_v := mul_ovf;

			when OP_SHL =>
				res_v      := shl_s;
				carry_v    := shl_co;
				overflow_v := shl_ovf;

			when others =>
				null;
		end case;

		result_o     <= res_v;
		carry_o      <= carry_v;
		overflow_o   <= overflow_v;
	end process alu_comb;

end architecture;
