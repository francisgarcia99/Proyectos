% 0980 Proyectos de Computacion Aplicados a Ingenieria Electronica
% Tarea 3 Ejercicio 1: Eleuterio Francis Garcia Aguilon
t = -0.04:0.001:0.04;
x = 20*exp(j*(80*pi*t-0.4*pi));
figure;
subplot(1,2,1);
plot3(t, real(x), imag(x)); grid
title('20*e^{j*(80\pi*t-0.4\pi)}', 'FontSize', 26);
xlabel('Tiempo (s)','FontSize', 20);
ylabel('Real','FontSize', 20);
zlabel('Imag','FontSize', 20);
subplot(1,2,2);
plot(t, real(x), 'b'); hold on
plot(t, imag(x), 'r'); grid
title('Rojo - Componente Imaginario, Azul - Componente Real de la Exponencial','FontSize', 18);
xlabel('Tiempo (s)','FontSize', 20);
ylabel('Amplitud','FontSize', 20);





