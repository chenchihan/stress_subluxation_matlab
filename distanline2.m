function [dA,dB,M,B,K,R]=distanline2(P,M1,M2,T1)
syms m b k r;
eq1=m*M1(1)-M1(2)+b;
eq2=m*M2(1)-M2(2)+b;
[M,B]= solve(eq1,eq2,m,b);
eq3=M*P(1)-P(2)+r;
R= solve(eq3,r);
d=abs(R-B)/sqrt(M^2+(-1)^2);
dA=double(vpa(d));
eq4=M*T1(1)-T1(2)+k;
K= solve(eq4,k);
d2=abs(R-K)/sqrt(M^2+(-1)^2);
dB=double(vpa(d2));
M=double(M);
B=double(B);
K=double(K);
R=double(R);
end