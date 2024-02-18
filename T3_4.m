n=-3:7;
x=0.55.^(n+3);
h=[1 1 1 1 1 1 1 1 1 1 1];
y=conv(x,h);
figure
subplot(3,1,1)
stem(x)
title('señal original')
subplot(3,1,2)
stem(h) %usa steam para secuencias discretas
title('Respuesta al Impulso/Segunda Senal')
subplot(313)
stem(y)
title('Convolucion Resultante')

