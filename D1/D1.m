close,clear,clc
format longG
%记得单位统一
a1 = [
-0.112391999999957
-0.413132000000004
-0.0935289999999966
0.494876999999981
0.197416000000004
-0.0732400000000126
];
%实验仪器误差限 ∆仪
Delta1 = 0.005;

%计算Ub时候的置信任系数C 均匀分布为√3 三角分布为√6 正态分布为3
C1 = sqrt(3);

%扩展因子的取值
k1 = 2;

avg1 = mean(a1, 1);
b1 = [Ua(a1,avg1);Ub(Delta1,C1)];
uc1 = Uc(b1);
str_avg1 = ['数据一的平均值是' num2str(mean(a1, 1))];
str_ua1 = ['ua是' num2str(Ua(a1,avg1))];
str_ub1 = ['ub是' num2str(Ub(Delta1,C1))];
str_uc1 = ['uc是' num2str(Uc(b1))];
str_result_expression = ['结果表达式是' num2str(mean(a1, 1)) '±' num2str(k1 .* uc1)];

disp('关于测量值的数据')
disp(str_avg1);
disp(str_ua1);
disp(str_ub1);
disp(str_uc1);
disp(str_result_expression);
disp('-------------------------------')

%以下计算的是间接测量量的不确定度
syms x1 x2 x3;%创建n个变量,使用空格分开  x1 x2 x3...
Syms = [
    x1
    x2
    x3
    ];%注册变量
funct = x3./(pi.*x1.^2.*x2);%注册n维函数
x = [
    2.040
    4.190
    149.40
    ];%各个x的平均值

uc2 = [
    0.005
    0.002
    0.03
    ];%各个x的不确定度
ucy = Ucy(funct,Syms,x,uc2);%不确定度
funx = subs(funct,Syms,x);
ucr = eval(ucy./funx).*100;%相对不确定度
str_ucr = ['相对不确定度是:' num2str(ucr) '%'];
disp(str_ucr)









