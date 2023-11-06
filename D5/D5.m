close,clear,clc,format longG

raw_data = readmatrix("Data.xlsx",'Sheet',1,'OutputType','string','Range','B1:E12');
data = strrep(strrep(strrep(strrep(raw_data,'º',','),'′',',0'),' ',''),',',' ');
k = [1,2,3]';

%光的波长，单位埃米。1nm = 10Å
lambda = 5461;

%实验仪器误差限 ∆仪
Delta1 = 0.0002908;

%实验次数n = 4
n = 4;

%计算Ub时候的置信任系数C 均匀分布为√3 三角分布为√6 正态分布为3
C = sqrt(3);

[phik,phikmean] = fuck1(data);

[dkmean,dmean] = fuck3(k,lambda,phikmean);

[ua,ub,uc,ud] = fuck4(phik,phikmean,n,Delta1,C,lambda);
ubuauc = [ub,ua,uc]';

writematrix(phik,'Data.xlsx','Sheet',1,'Range','F1:H12','AutoFitWidth',false)
writematrix(phikmean(1,:),'Data.xlsx','Sheet',1,'Range','I1','AutoFitWidth',false)
writematrix(phikmean(2,:),'Data.xlsx','Sheet',1,'Range','I5','AutoFitWidth',false)
writematrix(phikmean(3,:),'Data.xlsx','Sheet',1,'Range','I9','AutoFitWidth',false)

writematrix(dkmean(1,:),'Data.xlsx','Sheet',1,'Range','L1','AutoFitWidth',false)
writematrix(dkmean(2,:),'Data.xlsx','Sheet',1,'Range','L5','AutoFitWidth',false)
writematrix(dkmean(3,:),'Data.xlsx','Sheet',1,'Range','L9','AutoFitWidth',false)

writematrix(dmean,'Data.xlsx','Sheet',1,'Range','C22','AutoFitWidth',false)
writematrix(ubuauc,'Data.xlsx','Sheet',1,'Range','C25:C27','AutoFitWidth',false)

writematrix(ud,'Data.xlsx','Sheet',1,'Range','C30','AutoFitWidth',false)
writematrix(2.*ud,'Data.xlsx','Sheet',1,'Range','C31','AutoFitWidth',false)






