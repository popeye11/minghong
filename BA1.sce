clear;
clc;
xdel(winsid())
//inline function norm of transfer
function y=tfnorm(u)
  y = abs(u/(u^4+0.8*u^3+8.74*u^2+3.432*u+14.4041))
endfunction
// ==========1. generate transfer function with syslin =======================
s=poly(0,'s');
F=syslin('c',(s)/(s^4+0.8*s^3+8.74*s^2+3.432*s+14.4041))
disp("the transfer function is represented as:")
disp(F)
frq=0:0.5:30;
resf=repfreq(F,frq);
// ==========2. transfom the transfer function into ""zero-pole-gain" form====
S = zpk(F)
disp("the Zero pole gain form is represented as:")
disp(S)

//===========3. bode plot ================================================
bode(F, 0.1, 3)


//============  mesh plot of Betraggebirge ===================================
i=1;
j =1;
a =[0:-0.025:-1]
b =[0:0.1:4]
y = zeros(length(a),length(b))
for i=1:length(a)
    for j = 1:length(b)
        u = a(i)+ b(j)*%i
        y(i,j) =min(1.5,tfnorm(u))
        
    end
end
h2=figure(2)
mesh(b,a,y)
xlabel('Image')
ylabel('Real')
zlabel('Norm')
// ==================== contour of  Betragsgebirge with level 10 ===============
h3=figure(3)
contour(b,a,y,10)
xlabel('Image')
ylabel('real')

