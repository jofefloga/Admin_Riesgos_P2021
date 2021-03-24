%% DERIVADOS

datos = xlsread('CDS.xlsx','BND','A3:G13');
bonos = [x2mdate(datos(:,3),0),datos(:,4)];
[zerorates,curvedates]=zbtyield(bonos,datos(:,1),'12-feb-2021',12);%actualizar la fecha
curvatasas = intenvset('Rates',zerorates+1/10000,'StartDates','12-feb-2021','EndDates',curvedates,'Basis',2);
% % 2 años
% [p,s] = swapbyzero(curvatasas,[0 0.0468],'18-feb-2021',['18-feb-2023'],'Principal',[400]*10^6,'Basis',2,'LegReset',[12,1],'LegType',[0 1])
% % 3
% [p3,s3] = swapbyzero(curvatasas,[0 0.0476],'18-feb-2021',['18-feb-2024'],'Principal',[300]*10^6,'Basis',2,'LegReset',[12,1],'LegType',[0 1])
% %5
[p5,s5] = swapbyzero(curvatasas,[NaN 0.0495],'18-feb-2021',['18-feb-2026'],'Principal',[1600]*10^6,'Basis',2,'LegReset',[12,1],'LegType',[0 1])
% %10
[p10,s10] = swapbyzero(curvatasas,[NaN 0.0563],'18-feb-2021',['18-feb-2031'],'Principal',[2100]*10^6,'Basis',2,'LegReset',[12,1],'LegType',[0 1])
% 
% 
% % 5 años
primacap5 = capbyblk(curvatasas,[0.05, 0.06],'18-feb-2021',['18-feb-2026'],[0.197, 0.2045],'Principal',[500,700]*10^6,'Basis',2,'Reset',12)
% %7
% primacap7 = capbyblk(curvatasas,[0.05, 0.06],'18-feb-2021',['18-feb-2028'],[0.2093, 0.2165],'Principal',[800,1100]*10^6,'Basis',2,'Reset',12)
% %10
% primacap10 = capbyblk(curvatasas,[0.05, 0.06],'18-feb-2021',['18-feb-2031'],[0.2138, 0.2305],'Principal',[900,1300]*10^6,'Basis',2,'Reset',12)
% 
% 
% % 2 años
% primafloor2 = floorbyblk(curvatasas,[0.04, 0.03],'18-feb-2021','18-feb-2023',[0.2075, 0.213],'Principal',[1200,1500]*10^6,'Basis',2,'Reset',12)
% % 3 años
% primafloor3 = floorbyblk(curvatasas,[0.04, 0.03],'18-feb-2021','18-feb-2024',[0.192, 0.199],'Principal',[600,800]*10^6,'Basis',2,'Reset',12)
% % 5 años
% primafloor5 = floorbyblk(curvatasas,[0.04, 0.03],'18-feb-2021','18-feb-2026',[0.186, 0.182],'Principal',[300,400]*10^6,'Basis',2,'Reset',12)
% 
% 
% 
% 
a = 0.0558;
yield = [a a+1/10000];
cuponr = 0.0775;
settle = '18-feb-2021';
mad = '29-may-2031';


bono = bndprice(yield,cuponr,settle,mad)



