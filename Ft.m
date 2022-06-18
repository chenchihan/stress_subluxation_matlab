function [Ft_max,Ft_75,Ft_50,Ft_25]=Ft(MP1_T,MP1_F)
[F_max,ind]=max(MP1_F);
MP1_F=MP1_F(1:ind);
Ft_max=MP1_T(ind);
[F_75,ind]=min(abs(MP1_F-F_max*0.75));
F_75=MP1_F(ind);
Ft_75=MP1_T(ind);
[F_50,ind]=min(abs(MP1_F-F_max*0.5));
F_50=MP1_F(ind);
Ft_50=MP1_T(ind);
[F_25,ind]=min(abs(MP1_F-F_max*0.25));
F_25=MP1_F(ind);
Ft_25=MP1_T(ind);
end

