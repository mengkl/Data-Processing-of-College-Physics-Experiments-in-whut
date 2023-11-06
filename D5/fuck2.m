function [cD,cM,cS] = fuck2(c)
%FUCK2 S 2 DMS
%   此处显示详细说明
cD = floor(c./3600);
cM = floor((c - 3600.*cD)./60);
cS = c - 3600.*cD - 60.*cM;
end

