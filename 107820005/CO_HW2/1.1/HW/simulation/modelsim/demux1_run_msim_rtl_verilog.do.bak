transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/GameToGo/Desktop/107820005/1.1/source {C:/Users/GameToGo/Desktop/107820005/1.1/source/demux1.v}

vlog -vlog01compat -work work +incdir+C:/Users/GameToGo/Desktop/107820005/1.1/HW/../source {C:/Users/GameToGo/Desktop/107820005/1.1/HW/../source/demux_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  demux_tb

add wave *
view structure
view signals
run 100 ps
