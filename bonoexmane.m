a = 0.0514;
yield = [a a+1/10000];
cuponr = 0.0575;
settle = '28-feb-2021';
mad = '05-mar-2026';

bono = bndprice(yield,cuponr,settle,mad)

[p,s] = swapbyzero(curvatasas,[0 0.0609],'22-feb-2021',['22-feb-2031'],'Principal',[i]*10^6,'Basis',2,'LegReset',[12,1],'LegType',[0 1])
