function [t,truestress]=tstr(stress,sign)
beg=-0.0090;[local]=find(sign==beg);
[truestressf1]=stress(local(1):local(end),:);
truestressf1=roundn(truestressf1,-2);
t=0:0.001:size(truestressf1)./1000;
truestress=[0;truestressf1];
end