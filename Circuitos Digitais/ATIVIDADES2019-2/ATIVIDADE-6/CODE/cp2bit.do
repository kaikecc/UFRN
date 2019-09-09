vsim cp2bit

add wave *

force EE "1010" 0, "0000" 2 -repeat 2
force B "0000" 0, "0110" 4 -repeat 8
force SLC 0 0, 1 1 -repeat 2

run 8
