clear,close,clc

raw_data = readtable("data.xlsx","VariableNamingRule","preserve");
array_data = table2array(raw_data(:,2:8));
cell_data = table2cell(raw_data(:,1));


X_axis1 = array_data(1,:);X_name1 = string(cell_data(1,:));
Y_axis1 = array_data(2,:);Y_name1 = string(cell_data(2,:));
Y_axis2 = array_data(3,:);Y_name2 = string(cell_data(3,:));
Y_axis3 = array_data(4,:);Y_name3 = string(cell_data(4,:));

X_axis2 = array_data(5,1:6);X_name2 = string(cell_data(5,1));
Y_axis4 = array_data(end,1:6);Y_name4 = string(cell_data(end,1));

figure;
slope1 = fucktogether(X_axis1,Y_axis1,X_name1,Y_name1)
figure;
slope2 = fucktogether(X_axis1,Y_axis2,X_name1,Y_name2)
figure;
slope3 = fucktogether(X_axis1,Y_axis3,X_name1,Y_name3)
figure;
slope4 = fucktogether(X_axis2,Y_axis4,X_name2,Y_name4)