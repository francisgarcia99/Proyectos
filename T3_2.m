% 0980 Proyectos de Computacion Aplicados a Ingenieria Electronica
% Tarea 3 Ejercicio 2: Eleuterio Francis Garcia Aguilon
n = -1000:1000;
x = exp(j*2*pi*0.01*n);
y=exp(j*2*pi*2.01*n); %note que ωy[n]= ωx[n]+ 2π
figure;
subplot(2,1,1);
plot(n, real(x)); grid
xlabel('n','FontSize', 20);
ylabel('Real x','FontSize', 20);
subplot(2,1,2);
plot(n, real(y),'r'); grid
xlabel('n','FontSize', 20);
ylabel('Real y','FontSize', 20);


