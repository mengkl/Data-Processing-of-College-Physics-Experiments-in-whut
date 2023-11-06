function [phik,phikmean] = fuck1(data)
%FUCK1 此处显示有关此函数的摘要
%   此处显示详细说明

[r,c] = size(data);
b = zeros(r,c);
for i = 1:r
    for j = 1:c
        a= data(i,j);
        datastring = str2double(strsplit(a,' '));
        b(i,j) = datastring(1).*3600 + datastring(2).*60;
    end
end
c = abs(b(:,1) - b(:,3) + b(:,2) - b(:,4))./4;

[cD,cM,cS] = fuck2(c);

phik = [cD,cM,cS];

d1 = [mean(c(1:4,1)),mean(c(5:8,1)),mean(c(9:end,1))]';

[dD,dM,dS] = fuck2(d1);

phikmean = [dD,dM,dS];
end

