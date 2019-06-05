vsim aula1

add wave *

force A 0 0ns, 1 40ns
force B 0 0ns, 1 20ns -repeat 40ns
force C 0 0ns, 1 10ns -repeat 20ns

run 80ns



 
