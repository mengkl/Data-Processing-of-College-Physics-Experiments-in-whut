function [ucy] = Ucy(fun,syms,x,u)

% 输入:
%   fun - 待计算不确定度的函数  
%   syms - 参与运算的符号
%   x - 符号变量测量值值组成的数组
%   u - 每个变量的不确定度组成的数组

% 将x转换为动态数组
a = num2cell(x); 
len = length(x);
item = zeros(1,len);
vars = cell(1,len); 
for i = 1:len
    vars{i} = sym(['x' num2str(i)]);
    diffxi = matlabFunction(diff(fun,vars(i)) + 0.000000000001.*sum(syms));
    item(i) = ((diffxi(a{:}) - 0.000000000001.*sum(x))*u(i))^2; 
end
ucy = sqrt(sum(item));
end