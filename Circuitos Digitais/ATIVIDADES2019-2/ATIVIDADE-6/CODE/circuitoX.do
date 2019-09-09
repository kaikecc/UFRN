vsim circuitoX

add wave *

force clckk 0 0, 1 1 -repeat 2
force CLR1 1 0
force U 0 0, 1 4 -repeat 8

run 16
