function [ alpharad ] = angle4P(M1,M2,P1,P2) 
% Calculate angle between two vectors 
veca1=M2-M1;
veca=veca1./((veca1(1).^2+veca1(2).^2).^0.5);
vecb1=P2-P1;
vecb=vecb1./((vecb1(1).^2+vecb1(2).^2).^0.5);
alpharad = acos(dot(veca/norm(veca), vecb/norm(vecb)));
alpharad=alpharad./(2 * pi/360);
alpharad=roundn(alpharad,-2);
if alpharad>90;
    alpharad=abs(alpharad-180);
else
end
end 