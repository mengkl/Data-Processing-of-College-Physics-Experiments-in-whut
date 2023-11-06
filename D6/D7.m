clear,close,clc


b = 5893e-7;%毫米
m = 20;
n = 6;

data1 = readmatrix("Data.xlsx","Sheet",2,"Range","B2:G3");
data2 = readmatrix("Data.xlsx","Sheet",2,"Range","B7:G8");

a1 = data1(1,:) - data1(2,:);
a2 = data2(1,:) - data2(2,:);

aa1 = a1.^2;
aa2 = a2.^2;
aa3 = aa1 - aa2;

writematrix(a1,"Data.xlsx","Sheet",2,"Range",'B4')
writematrix(a2,"Data.xlsx","Sheet",2,"Range",'B9')
writematrix(aa1,"Data.xlsx","Sheet",2,"Range",'B5')
writematrix(aa2,"Data.xlsx","Sheet",2,"Range",'B10')
writematrix(aa3,"Data.xlsx","Sheet",2,"Range",'B11')


aaa1 = mean(aa3);

aaa2 = aaa1 ./ (4.*m.*b);

aaa3 = sqrt((sum((aa3 - aaa1).^2)./(n.*(n-1))));  %ua

aaa4 = 0.005 ./ sqrt(3); %ub left right

aaa5 = sqrt(2) .* aaa4; %ub

aaa6 = 2 .* aaa5 .* sum(sqrt(aa1+aa2)); %ub b

aaa7 = sqrt( aaa3.^2 + aaa5.^2 ); %uc c

aaa8 = sqrt( (1./aaa1).^2 .*aaa7.^2 );

aaa9 = aaa2 .* aaa8;

aaa10 = 2 .* aaa9;

aaaa = [aaa1,aaa2,aaa3,aaa4,aaa5,aaa6,aaa7,aaa8,aaa9,aaa10]';

writematrix(aaaa,"Data.xlsx","Sheet",2,"Range","F15")