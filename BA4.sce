clear;
clc;
xdel(winsid())

T1=0.3
T2=0.2
T3=0.05
K=10
// open loop transfer function
s=poly(0,'s');
Fo=syslin('c',K/((1+T1*s)*(1+T2*s)*(1+T3*s)))
figure(1)
bode(Fo)
xgrid(2)
// close loop transfer function
s=poly(0,'s');
Fc=syslin('c',K/(K+(1+T1*s)*(1+T2*s)*(1+T3*s)))
figure(2)
bode(Fc)
xgrid(2)
