
T1=0.01
T2=1
T3=0.05
T4=0.03
K=1
// open loop transfer function
s=poly(0,'s');
Fo=syslin('c',K/((1+T1*s)*(1+T2*s)*(2+T3*s)*(1+T4*s)))
// RTskript Seite 94
// RTskript seite 99
//phi_R= 60 ==>  -120° ==> wd =1.4
// Frequence of -12db/Decade =  1 Hz 
// Frequence of -30db/decade = 3.0 Hz
// Kr = 1/(F0(1.4)*Ks) = 1/0.63/2 = 0.79
// TN =1/ 1 = 1
// Tv = 1/ 3.0 =0.333
 Kr = 0.79
 TN =1
// close loop with PI control
K_PI = Kr*(1+TN*s)/TN/s
G =1/((1+T1*s)*(1+T2*s)*(2+T3*s)*(1+T4*s))
G_PI =syslin('c',K_PI*G/(1+K_PI*G))
figure(1)
bode(Fo)
figure(2)
bode(G_PI)
