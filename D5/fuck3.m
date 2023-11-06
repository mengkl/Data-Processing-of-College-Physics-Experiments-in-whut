function [dkmean,dmean] = fuck3(k,lambda,phikmean)
%FUCK3 此处显示有关此函数的摘要
%   此处显示详细说明

a = [dms2degrees(phikmean(1,:)),...
    dms2degrees(phikmean(2,:)),...
    dms2degrees(phikmean(3,:))]';

dkmean =  k.*lambda ./ sind(a)  ;

dmean = mean([dkmean(1),dkmean(2)]);

end

