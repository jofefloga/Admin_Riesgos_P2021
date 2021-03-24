datos = xlsread('CDS.xlsx','BND','A3:G13');
bonos = [x2mdate(datos(:,3),0),datos(:,4)];
[zerorates,curvedates]=zbtyield(bonos,datos(:,1),'126-feb-2021',12);%actualizar la fecha
curvatasas = intenvset('Rates',zerorates,'StartDates','26-feb-2021','EndDates',curvedates,'Basis',2);
for i = 1:8
    [p,s] = swapbyzero(curvatasas,[0 0.0481],'01-mar-2021',['01-mar-2024'],'Principal',[i]*10^6,'Basis',2,'LegReset',[12,1],'LegType',[0 1])
end




