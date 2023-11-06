function [uc] = Uc(inputArg1)
%UC 此处显示有关此函数的摘要
%   此处显示详细说明

a = 0;
for i = 1:size(inputArg1)
    a = a + inputArg1(i,1).^2;
end
uc = sqrt(a);
end

