function [slope,intercept] = fucktogether(X_axis,Y_axis,X_name,Y_name)
%FUCKTOGETHER 此处显示有关此函数的摘要
%   此处显示详细说明
R = corrcoef(X_axis , Y_axis);

% 使用polyfit函数进行线性拟合，第二个参数1表示线性拟合
coefficients = polyfit(X_axis, Y_axis, 1);

% 从拟合系数中提取斜率和截距
slope = coefficients(1);
intercept = coefficients(2);

% 使用polyval函数生成拟合线的图像数据
x_fit = linspace(min(X_axis), max(X_axis), 100); % 生成用于绘制拟合线的新x值
y_fit = polyval(coefficients, x_fit);   % 计算对应的y值

% 绘制原始数据点
scatter(X_axis, Y_axis, 'o', 'filled', 'MarkerFaceColor', 'b');
hold on; % 保持图形，以便在同一图上绘制拟合线

% 绘制拟合线
plot(x_fit, y_fit, 'r', 'LineWidth', 2);

% 添加标签和标题
xlabel(X_name);
ylabel(Y_name);
title('线性拟合');

% 显示线性相关系数
text(mean(X_axis), mean(Y_axis) , sprintf('线性相关系数:\n %f', R(1,2)), 'FontSize', 12);
text(mean(X_axis), mean(Y_axis)./2 , sprintf('φ = %.3f C + %.3f',slope,intercept),'FontSize', 12);
% 添加图例
legend('原始数据', '线性拟合', 'Location', 'NorthWest');

end

