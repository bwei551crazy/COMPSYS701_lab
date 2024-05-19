vcom -work work fetch_decode_execute_load_test.vwf.vht
vsim -novopt -c -t 1ps -L cyclonev -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.fetch_decode_control_vhd_vec_tst -voptargs="+acc"
add wave /*
run -all
