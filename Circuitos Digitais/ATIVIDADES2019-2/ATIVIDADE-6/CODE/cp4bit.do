vsim cp4bit

add wave *

force E0 "0000" 0
force E1 "0000" 0, "0101" 1 -repeat 2
force E2 "0000" 0
force E3 "0000" 0

force SS(0) 0 0, 1 1 -repeat 2
force SS(1) 0 0, 1 2 -repeat 4

run 16