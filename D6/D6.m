clear;close;clc;format long G


data = readmatrix("Data.xlsx","Sheet","Sheet1","Range",'A1:L3');
base1 = data(:,1); 
base2 = data(:,2);

Ci = [0.02,0.04,0.06,0.08];

data1 = zeros(3,12);
for i = 1:2:size(data,2)
    data1(:,i) = round(data(:,i) - base1,2);
end

for i = 2:2:size(data,2)
    data1(:,i) = round(data(:,i) - base2,2); 
end

writematrix(data1(:,3:end),"Data.xlsx","Sheet",1,"Range",'C4:L6','AutoFitWidth',false);
data2 = zeros(1,5);
for i=3:2:size(data1,2)-1
    col1 = data1(:,i);
    col2 = data1(:,i+1);
    avg = mean((col1 + col2) / 2);
    data2(:,(i-1)./2) = avg; 
end

writematrix(data2(1,1),"Data.xlsx","Sheet",1,"Range",'C8','AutoFitWidth',false);
writematrix(data2(1,2),"Data.xlsx","Sheet",1,"Range",'E8','AutoFitWidth',false);
writematrix(data2(1,3),"Data.xlsx","Sheet",1,"Range",'G8','AutoFitWidth',false);
writematrix(data2(1,4),"Data.xlsx","Sheet",1,"Range",'I8','AutoFitWidth',false);

img = figure;
[slope,intercept] = fucktogether(Ci,data2(1,1:4),"溶液浓度","相对于零位转过的角度");
img = frame2im(getframe(img));
imwrite(img,"111.png")


Cx = (mean(data1(1,11:end)) - intercept) ./ slope;
writematrix(Cx,"Data.xlsx","Sheet",1,"Range",'G15','AutoFitWidth',false);
