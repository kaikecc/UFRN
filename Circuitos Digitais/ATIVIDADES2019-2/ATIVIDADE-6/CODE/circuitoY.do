vsim circuitoY

add wave *

force I "0000" 0, "1010" 4, "1101" 8, "1111" 12, "1111" 16  -repeat 32
force P "00" 0, "01" 4, "10" 8, "11" 16 -repeat 32
force CLR2 1 0
force clock1 0 0, 1 1 -repeat 2

run 64