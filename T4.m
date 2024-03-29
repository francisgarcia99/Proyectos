
pkg load signal;

% Menú principal
opcion = 0;
while opcion ~= 5
    % Menú de opciones
    disp('Seleccione una opción:')
    disp('1. Grabar')
    disp('2. Reproducir')
    disp('3. Graficar')
    disp('4. Graficar densidad')
    disp('5. Salir')

    opcion = input('Ingrese su elección: ');

    switch opcion
        case 1
            % Grabación de audio
            try
                duracion = input('Ingrese la duración de la grabación en segundos: ');
                disp('Comenzando la grabación...');
                recObj = audiorecorder;
                recordblocking(recObj, duracion);
                disp('Grabación finalizada.');
                data = getaudiodata(recObj);
                audiowrite('audio.wav', data, recObj.SampleRate);
                disp('Archivo de audio grabado correctamente.');
            catch
                disp('Error al grabar el audio.');
            end
        case 2
            % Reproducción de audio
            try
                [data, fs] = audioread('audio.wav');
                sound(data, fs);
            catch
                disp('Error al reproducir el audio.');
            end
        case 3
            % Gráfico de audio
            try
                [data, fs] = audioread('audio.wav');
                tiempo = linspace(0, length(data)/fs, length(data));
                plot(tiempo, data);
                xlabel('Tiempo (s)');
                ylabel('Amplitud');
                title('Audio');
            catch
                disp('Error al graficar el audio.');
            end
        case 4
            % Graficando espectro de frecuencia
            try
                disp('Graficando espectro de frecuencia...');
                [audio, Fs] = audioread('audio.wav');
                N = length(audio);
                f = linspace(0, Fs/2, N/2+1);
                ventana = hann(N);
                Sxx = pwelch(audio, ventana, 0, N, Fs);
                plot(f, 10*log10(Sxx(1:N/2+1)));
                xlabel('Frecuencia (Hz)');
                ylabel('Densidad espectral de potencia (dB/Hz)');
                title('Espectro de frecuencia de la señal grabada');
            catch
                disp('Error al graficar el espectro de frecuencia.');
            end
        case 5
            % Salir
            disp('Saliendo del programa...');
        otherwise
            disp('Opción no válida.');
    end
end

