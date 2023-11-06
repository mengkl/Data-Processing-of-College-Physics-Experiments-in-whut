function [r] = r(vc,de,ga,dl,td)
%viscosity_coefficient 空气粘性系数η
%density 油的密度ρ
%gravitational_acceleration 重力加速度g
%distance_l 下落距离l
%time_down 下落时间的平均td
%   用来计算油滴半径
vd = dl./td;
r = sqrt((9.*vc.*vd)./(2.*de.*ga));
end

