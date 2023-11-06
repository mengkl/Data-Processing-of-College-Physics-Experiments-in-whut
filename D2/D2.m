clear,close,clc           %起手式
raw_data = readtable("data.xlsx","VariableNamingRule","preserve");
a = table2array(raw_data(2:7,2:5));
e = 1.602e-19;%元电荷理论值
density = 981;%油的密度ρ
gravitational_acceleration = 9.794;%重力加速度g
viscosity_coefficient = 1.83e-5;%空气粘性系数η
distance_l = 1.00e-3;%下落距离l
correction_factor = 8.21e-3;%修正系数b
atmospheric_pressure = 1.013e5;%大气压强p
distance_d = 5.00e-3;%用来计算电场强度的d

aa = formeanaa(a);
aaa = q(a,density,gravitational_acceleration,viscosity_coefficient,distance_l,correction_factor,atmospheric_pressure,distance_d);
aaaa = number(aaa,e);
aaaaa = mye(aaa,aaaa);
aaaaaa = finally(aaaaa,e);

final = [aa,aaa,aaaa,aaaaa,aaaaaa];

writematrix(final,'data.xlsx','Sheet',1,'Range','F3');


