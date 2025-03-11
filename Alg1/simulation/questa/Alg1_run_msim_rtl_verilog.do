transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/benbt/Desktop/Comp_eng_lab_2/Lab_Mats/CompEngHw4/Alg1 {C:/Users/benbt/Desktop/Comp_eng_lab_2/Lab_Mats/CompEngHw4/Alg1/Alg1.v}
vlog -vlog01compat -work work +incdir+C:/Users/benbt/Desktop/Comp_eng_lab_2/Lab_Mats/CompEngHw4/Alg1 {C:/Users/benbt/Desktop/Comp_eng_lab_2/Lab_Mats/CompEngHw4/Alg1/hexSevenSegmentDisplayDecoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/benbt/Desktop/Comp_eng_lab_2/Lab_Mats/CompEngHw4/Alg1 {C:/Users/benbt/Desktop/Comp_eng_lab_2/Lab_Mats/CompEngHw4/Alg1/multiply1.v}

