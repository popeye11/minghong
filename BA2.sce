clear;
clc;
xdel(winsid())

//  =====================step response of  PIDT1 ==============================
T1 = 11.12e-3;
TI = 105e-3;
K  = 4.6
Kr =3.045;
TN = 76.858e-3;
Tv = 39.262e-3;
Td = 25.987e-3;
// transfer function
s=poly(0,'s');
F=syslin('c',Kr*(1+TN*s)*(1+Tv*s)/((TN*s)*(1+T1*s)))
t=0:0.0005:0.3;
stepresp=csim('step',t,F)
figure(1)
plot(t,stepresp)
xgrid(2)
xlabel('time [sec]')
ylabel('step response [V]')

// ==================== step response of DT2 ===================================
K =4.94;
d =0.072;
w = 20.81;

// transfer function
F=syslin('c',K*s/(1+2*d/w*s+1/w^2*s^2))
t=0:0.05:5;
stepresp=csim('step',t,F)
figure(2)
plot(t,stepresp)
xgrid(2)
xlabel('time [sec]')
ylabel('step response [V]')

// ====================== Lab experiment 2  PIDT1 ============================
K  = 4.53

TI = 0.111;
Td = 0.0226;
Kr = 3.2455;
TN = 0.0797;
Tv = 0.0315386;
T1 = [-0.02, 0.00958,0.02, 0.1,0.5];
// transfer function

figure(3)
s=poly(0,'s');
F1=syslin('c',Kr*(1+TN*s)*(1+Tv*s)/((TN*s)*(1+T1(1)*s)))
F2=syslin('c',Kr*(1+TN*s)*(1+Tv*s)/((TN*s)*(1+T1(2)*s)))
F3=syslin('c',Kr*(1+TN*s)*(1+Tv*s)/((TN*s)*(1+T1(3)*s)))
F4=syslin('c',Kr*(1+TN*s)*(1+Tv*s)/((TN*s)*(1+T1(4)*s)))
F5=syslin('c',Kr*(1+TN*s)*(1+Tv*s)/((TN*s)*(1+T1(5)*s)))
bode([F1;F2;F3;F4;F5], 0.1, 1000,['T1:-0.02';'T1:0.00958';'T1:0.02';'T1:0.1';'T1:0.5'])
xgrid(2)
