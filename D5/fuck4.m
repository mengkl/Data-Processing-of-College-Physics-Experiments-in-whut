function [ua,ub,uc,ud] = fuck4(phik,phikmean,n,Delta1,C,lambda)
%FUCK4 此处显示有关此函数的摘要
%   此处显示详细说明
a = deg2rad(dms2degrees(phik(1:4,:)));
ameandeg = dms2degrees(phikmean(1,:));
ameanrad = deg2rad(ameandeg);

alla = 0;
for i =1:size(a,1)
    alla = alla + (a(i)-ameanrad).^2;
end
ua = sqrt(   alla./(n.*(n-1))  );
ub = Delta1./C;
uc = sqrt(ua.^2 + ub.^2);

ud = cosd(ameandeg) ./ (sind(ameandeg) .^ 2)  .*lambda  .*uc;



end

