T1=0.01
T2=1
T3=0.05
T4=0.03
K=1
// open loop transfer function
s=poly(0,'s');
Fo=syslin('c',K/((1+T1*s)*(1+T2*s)*(2+T3*s)*(1+T4*s)))
// close loop with PIDT1 control
Kr = 3.04
st = 10
Tv = 0.33
TN = 1
K_PIDT1 = Kr*(1+TN*s)*(1+Tv*s)/TN/s/(1+Tv/st*s)
G_PIDT1 =syslin('c',K_PIDT1*G/(1+K_PIDT1*G))
figure(1)
bode(G_PIDT1)
