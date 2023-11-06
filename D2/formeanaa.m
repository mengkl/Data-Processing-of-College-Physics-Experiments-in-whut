function aa = formeanaa(a)
%FORMEANAA 此处显示有关此函数的摘要
%   此处显示详细说明
aa = zeros(size(a:1));
for i =1:size(a,1)
    aa(i,1) = mean(a(i,2:4));
end
end

