% 0980 Proyectos de Computación Aplicados a Ingenieria Electronica
% Tarea 2: Eleuterio Francis García Aguilón
% Generar señal senoidal
fs = 1000; %frecuencia de muestreo
t = 0:1/fs:1; %Vector de tiempo
f = 100; %frecuencia de la señal
x = sin(2*pi*f*t); %Señal senoidal

xf = fft(x);  %Aplicar la transformada rapida de fourier

%Generar Filtro pasa bajos
n = length(x);
fcutoff = 50; % frecuencia de corte
h = ones(n, 1); %vector de ceros
h(round(n*fcutoff/fs)+1:end) = 0; %aplicar filtro pasa bajos

%Aplicar filtro a la señal en el dominio de la frecuencia
xf_filtered = xf .* h;

%convertir la señal filtrada al dominio del tiempo
x_filtered = ifft(xf_filtered);

%Graficar señal original y señal filtrada
figure;
subplot(2,1,1);
plot(t,x);
title('Señal Original');
xlabel('Tiempo (s)');
ylabel('Amplitud');
subplot(2,1,2);
plot(t,real(x_filtered));
title('Señal Filtrada');
xlabel('Tiempo (s)');
ylabel('Amplitud');





