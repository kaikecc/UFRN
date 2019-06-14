entity mux2for1 is
	port(A, B, SEL : in bit;
	S : out bit);

end mux2for1;


architecture mux of mux2for1 is

signal W1,W2 : bit;



begin

W1 <= A and not SEL;
W2 <= B and     SEL;

S <= W1 or W2;



end mux;

--vsim mux2for1

--add wave *

--force A 0 0ns, 1 1ns, 1 2ns, 0 3ns, 0 4ns, 1 5ns, 0 6ns, 1 7ns, 1 8ns, 0 9ns, 1 10ns
--force B 0 0ns, 1 1ns, 1 2ns, 0 3ns, 1 4ns, 0 5ns, 0 6ns, 1 7ns, 1 8ns, 1 9ns, 1 10ns
--force SEL  0 0ns, 1 1ns  -repeat 2

--run 10
