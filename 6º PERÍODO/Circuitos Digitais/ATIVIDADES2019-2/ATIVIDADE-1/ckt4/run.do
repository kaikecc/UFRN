vsim ckt4 
add wave *

force A 0 0ns, 1 80ns
force B 0 0ns, 1 40ns -repeat 80ns
force C 0 0ns, 1 20ns -repeat 40ns
force D 0 0ns, 1 10ns -repeat 20ns

run 150ns
