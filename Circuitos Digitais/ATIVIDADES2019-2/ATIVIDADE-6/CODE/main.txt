vsim com_serial

add wave *

force A "0000" 0, "1010" 1, "1001" 16, "1111" 31, "0111" 46 -repeat 61
force K "00" 1, "01" 2, "10" 4, "11" 13 -repeat 15
force clockk 0 0, 1 1 -repeat 2

run 128

