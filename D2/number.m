function aaaa = number(aaa,e)
%NUMBER 此处显示有关此函数的摘要
%   此处显示详细说明
aaaa = zeros(size(aaa));
for i = 1:size(aaa)
    aaaa(i,1) = round(aaa(i,1)./e);
end
end

