close,spy,clear,clc

raw_data1 = readmatrix("Data.xlsx",Sheet="Sheet1",Range="B2:D18");
raw_data2 = readmatrix("Data.xlsx",Sheet="Sheet2",Range="B2:D12");
raw_data3 = readmatrix("Data.xlsx",Sheet="Sheet3",Range="B2:D18");
raw_data4 = readmatrix("Data.xlsx",Sheet="Sheet4",Range="B2:D24");

f = @(x,y,z) (1000.*(5.*x./y).^2)./z;%匿名函数，x是Ul，y是Um,z是RL
ans1 = round(f(raw_data1(:,2),raw_data1(:,end),50),4);
ans2 = round(f(raw_data2(:,2),raw_data2(:,end),50),4);
ans3 = round(f(raw_data3(:,2),raw_data3(:,end),50),4);
ans4 = round(f(raw_data4(:,2),raw_data4(:,end),50),4);

writematrix(ans1,"Data.xlsx","Sheet",1,Range="E2");
writematrix(ans2,"Data.xlsx","Sheet",2,Range="E2");
writematrix(ans3,"Data.xlsx","Sheet",3,Range="E2");
writematrix(ans4,"Data.xlsx","Sheet",4,Range="E2");

img1 = figure;
plot(raw_data2(:,1),ans2,'-o');
title('谐振频率f0下负载功率PL随间距d的变化')
xlabel("间距d(cm)")
ylabel("负载功率PL(mW)")
grid on
axis tight
img1 = frame2im(getframe(img1));
imwrite(img1,"111.png");


img2 = figure;
plot(raw_data3(:,1),ans3,'-o');
title('临界耦合点处负载功率PL随频率f的变化')
xlabel("频率f(MHz)")
ylabel("负载功率PL(mW)")
grid on
axis tight
img2 = frame2im(getframe(img2));
imwrite(img2,"222.png");







