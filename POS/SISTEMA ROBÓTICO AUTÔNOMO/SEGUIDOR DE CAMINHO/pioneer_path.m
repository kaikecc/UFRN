clc
clear

b = 0.1655;
R = 0.1955/2;
tetha = pi/2;
rd = R;
re = R;
wd = 0;
we = 0;


 v_x = cos(tetha)*(rd*wd + re*we)/2;
 v_y = sin(tetha)*(rd*wd + re*we)/2;
 v_tetha = (rd*wd - re*we)/b;
 
 q_v = [v_x, v_y, v_tetha];
 
 R_r = [cos(tetha), sin(tetha), 0; -sin(tetha), cos(tetha), 0; 0, 0, 1];
 
 xp = s
yp = (-2/3)*s*s*s - (s*s) + (2/3)*s + (1/2)