transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Benjamin\ Betancourt/Desktop/Comp_Eng_Design_Lab_2/Homework_4/Alg2 {C:/Users/Benjamin Betancourt/Desktop/Comp_Eng_Design_Lab_2/Homework_4/Alg2/Alg2.v}
vlog -vlog01compat -work work +incdir+C:/Users/Benjamin\ Betancourt/Desktop/Comp_Eng_Design_Lab_2/Homework_4/Alg2 {C:/Users/Benjamin Betancourt/Desktop/Comp_Eng_Design_Lab_2/Homework_4/Alg2/multiplyAlg2.v}
vlog -vlog01compat -work work +incdir+C:/Users/Benjamin\ Betancourt/Desktop/Comp_Eng_Design_Lab_2/Homework_4/Alg2 {C:/Users/Benjamin Betancourt/Desktop/Comp_Eng_Design_Lab_2/Homework_4/Alg2/hexSevenSegmentDisplayDecoder.v}

