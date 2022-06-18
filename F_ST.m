% [force%、time、force]
function Y=F_ST(MP1_T,MP1_F)
[F_max,ind]=max(MP1_F);
F_max=roundn(F_max,-2);
MP1_F=MP1_F(1:ind);
T_Max=MP1_T(ind);
for n=1:9
    [~,ind]=min(abs(MP1_F-F_max*((10-n)/10)));
    F1=MP1_F(ind);
    F1=roundn(F1,-2); 
    T=MP1_T(ind);
    Fn(n,:)=[F1];
    Tn(n,:)=[T];
    MP1_F=MP1_F(1:ind);
    n=n+1;
end
f=[0:10:100]';
Fn=[0;flip(Fn);F_max];
T=[0;flip(Tn);T_Max];
Y=[f,T,Fn];
end