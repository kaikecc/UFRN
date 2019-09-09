vsim mux2x1

add wave *

force Ea  0 0, 1 1 -repeat 2
force Eb  0 0, 1 2 -repeat 4
force SEL 0 0, 1 4 

run 8
