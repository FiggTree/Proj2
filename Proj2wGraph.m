clear
syms A B V Cwd Cs Cw E Gwd Gs Gw Gg Pwd Ps Pw Pg
eq1= B+A==1000;
eq2= .65.*A==Cwd;
eq3= (1./3).*.3.*A==Cw;
eq4= .05.*A==Cs;
eq5= (2./3).*.3.*A==V;
eq6= Cwd==Gwd;
eq7= Cw==Gw;
eq8= Cs==Gs;
eq9= E==Gg;
eq10= E==.5.*Cw;
eq11= Gwd+.65.*B==Pwd;
eq12= Gw+.3.*B==Pw;
eq13= Gs+.05.*B==Ps;
eq14= Gg==Pg;
eq15= Pg./(Pwd+Pw+Ps+Pg)==.03;

a=solve(eq1,eq2,eq3,eq4,eq5,eq6,eq7,eq8,eq9,eq10,eq11,eq12,eq13,eq14,eq15,A,B,V,Cwd,Cs,Cw,E,Gwd,Gs,Gw,Gg,Pwd,Ps,Pw,Pg);

count=0;
for i=-.1:.01:.1
    count=count+1;
    CwVary(count)=a.Cw.*i + a.Cw;
    CwPerc(count)=i.*100;
end
for i=1:length(CwVary)
    FracVary(i)=a.Pg./(a.Pwd+a.Ps+a.Pg+(CwVary(i)+ .3.*a.B));
    FracVaryPerc(i)=FracVary(i).*100;
end


figure
plot(CwPerc,FracVaryPerc,'r.--','MarkerSize',15);
grid on
xlabel('Percent Variance of Water in Stream C');
ylabel('Percent Glue Compositon of Total Product Stream');
title('Change of Product Glue Composition');
legend('Product Stream Glue Percentage');

sz=[1,15];
vartypes={'double','double','double','double','double','double','double','double','double','double','double','double','double','double','double'};
varnames={'A','B','V','Cwd','Cs','Cw','E','Gwd','Gs','Gw','Gg','Pwd','Ps','Pw','Pg'};
Stream_Compositions=table('Size',sz,'VariableTypes',vartypes,'VariableNames',varnames);
Stream_Compositions(1,:)={a.A,a.B,a.V,a.Cwd,a.Cs,a.A,a.B,a.V,a.Cwd,a.Cs,a.Gg,a.Pwd,a.Ps,a.Pw,a.Pg}
%Equlibrium_Gas_Concentrations(1,:)={a.A,a.B,a.V,a.Cwd,a.Cs}
%Equlibrium_Gas_Concentrations(2,:)={a.Cw,a.E,a.Gwd,a.Gs,a.Gw}
%Equlibrium_Gas_Concentrations(3,:)={a.Gg,a.Pwd,a.Ps,a.Pw,a.Pg}

