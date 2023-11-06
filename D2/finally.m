function aaaaaa = finally(aaaaa,e)
%FINALLY 此处显示有关此函数的摘要
%   此处显示详细说明
aaaaaa = zeros(size(aaaaa));

for i = 1:size(aaaaa)
    aaaaaa(i,1) = abs((aaaaa(i,1) - e)./e.*100);
end

