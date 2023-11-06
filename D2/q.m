function q = q(a,density,gravitational_acceleration,viscosity_coefficient,distance_l,correction_factor,atmospheric_pressure,distance_d)
   
% e %元电荷理论值
% density ;%油的密度ρ
% gravitational_acceleration %重力加速度g
% viscosity_coefficient %空气粘性系数η
% distance_l %下落距离l
% correction_factor %修正系数b
% atmospheric_pressure %大气压强p
% distance_d %用来计算电场强度的d
q = zeros(size(size(a,1)));
for i = 1:size(a,1)
    time_down = mean(a(i,2:end));
    oil_droplet_radius = r(viscosity_coefficient,density, ...
                     gravitational_acceleration, ...
                     distance_l,time_down);
    q(i,1) =(18.*pi./sqrt(2.*density.*gravitational_acceleration)) .* ...
            (viscosity_coefficient.*distance_l./(time_down.*(1+correction_factor./atmospheric_pressure.*oil_droplet_radius))) ...
            .^(3./2) .* distance_d ./ a(i,1);
end
end

