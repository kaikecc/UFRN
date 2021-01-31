onerror {exit -code 1}
vlib work
vlog -work work main.vo
vlog -work work Comparador.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Comparador_vlg_vec_tst -voptargs="+acc"
vcd file -direction ANS_MACHINE.msim.vcd
vcd add -internal Comparador_vlg_vec_tst/*
vcd add -internal Comparador_vlg_vec_tst/i1/*
run -all
quit -f
