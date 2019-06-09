vsim radar

add wave *

force Sensor_A_Caju 0 0ns, 1 10ns, 0 11ns
force Sensor_B_Caju 0 0ns, 1 12ns, 0 13ns
force clk1          0 0ns, 1 1ns -repeat 2ns

run 20
