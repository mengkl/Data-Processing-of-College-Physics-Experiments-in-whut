function [ua] = ua(inputArg1,inputArg2)
%UA 此处显示有关此函数的摘要
%   此处显示详细说明
avg = inputArg2;
arr = size(inputArg1, 1);
sum_of_squares = 0;
for i = 1:arr
    sum_of_squares = sum_of_squares + ( inputArg1(i,1)-avg ).^2;
end
ua = sqrt(sum_of_squares/(arr.*(arr-1)));
end

