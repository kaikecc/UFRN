entity comparador4bits is

port(A, B : in bit_vector(3 downto 0);

A_igual_B, A_maior_B, A_menor_B : out bit);


end comparador4bits;

architecture comparacao of comparador4bits is

signal S : bit_vector(3 downto 0);
signal W : bit_vector(3 downto 0);
signal Aux_igual_Bux, Aux_maior_Bux : bit;


begin

S(0) <= A(0) xnor B(0);
S(1) <= A(1) xnor B(1);
S(2) <= A(2) xnor B(2);
S(3) <= A(3) xnor B(3);

A_igual_B <= S(0) and S(1) and S(2) and S(3);
Aux_igual_Bux <= S(0) and S(1) and S(2) and S(3);

W(0) <= A(0) and not B(0);
W(1) <= A(1) and not B(1) and S(0);
W(2) <= A(2) and not B(2) and S(0) and S(1);
W(3) <= A(3) and not B(3) and S(0) and S(1) and S(2);

A_maior_B <= W(0) or W(1) or W(2) or W(3);
Aux_maior_Bux <= W(0) or W(1) or W(2) or W(3);

A_menor_B <= Aux_igual_Bux nor Aux_maior_Bux;

end comparacao;
--------------------------- .do -----------------------------------------------
--vsim comparador4bits

--add wave *

--force A "0000" 0ns, "0001" 1ns, "0010" 2ns, "0011" 3ns, "0100" 4ns, "0101" 5ns
--force B "0001" 0ns, "0002" 1ns, "0010" 2ns, "0000" 3ns, "0000" 4ns, "0101" 5ns

--run 20
