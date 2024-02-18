function T5()
    % Universidad de San Carlos de Guatemala
    % Eleuterio Francis Garcia Aguilon 201906545
    % Hoja de trabajo 1

    % Funciones para cada opción
    function MostrarOpciones()
        % Mostrar las opciones disponibles al usuario
        disp("1. Calcular y mostrar IMC");
        disp("2. Leer información del archivo");
        disp("3. Borrar información del archivo");
        disp("4. Salir");
    end

    function CalcularYMostrarIMC()
        % Definición de las categorías
        bajoPeso = "Bajo peso";
        pesoNormal = "Peso normal";
        sobrePeso = "Sobrepeso";

        % Leer nombre, peso y altura del usuario
        nombre = input("Ingrese su nombre: ", 's');
        peso = str2double(input("Ingrese su peso en kg: ", 's'));
        altura = str2double(input("Ingrese su altura en metros: ", 's'));

        % Calcular el IMC
        imc = peso / (altura^2);

        % Determinar la categoría
        if imc < 18.5
            categoria = bajoPeso;
        elseif imc >= 18.5 && imc < 25
            categoria = pesoNormal;
        else
            categoria = sobrePeso;
        end

        % Mostrar el IMC y la categoría
        disp(['IMC calculado para ', nombre, ': ', num2str(imc)]);
        disp(['Categoría: ', categoria]);
        disp('');

        try
            fid = fopen('imc.txt', 'a');
            fprintf(fid, 'Nombre: %s, Peso: %s kg, Altura: %s m, IMC: %s, Categoría: %s\n', nombre, num2str(peso), num2str(altura), num2str(imc), categoria);
            fclose(fid);
            disp("Datos guardados en imc.txt");
        catch
            disp("Error al guardar los datos en imc.txt");
        end
    end

    function LeerInformacion()
        try
            fid = fopen('imc.txt', 'r');

            while ~feof(fid)
                line = fgetl(fid);
                disp(line);
            end

            fclose(fid);

        catch err
            disp("Error al leer el archivo 'imc.txt'");
            disp(err.message);
            disp(err.identifier);
        end
    end

    function BorrarInformacion()
        try
            fid = fopen('imc.txt', 'w');
            fclose(fid);
            disp("Datos del archivo 'imc.txt' eliminados");

        catch err
            disp("Error al eliminar los datos del archivo 'imc.txt'");
            disp(err.message);
            disp(err.identifier);
        end
    end

    % Bucle principal
    while true
        % Mostrar opciones
        MostrarOpciones()

        % Leer la opción del usuario
        opcion = input("Ingrese la opción deseada: ");

        % Validar la opción
        if ~(1 <= opcion && opcion <= 4)
            disp("Opción no válida. Intente de nuevo");
            continue;
        end

        % Ejecutar la acción según la opción
        if opcion == 1
            % Calcular IMC y mostrar resultados
            CalcularYMostrarIMC();
        elseif opcion == 2
            % Leer información del archivo
            LeerInformacion();
        elseif opcion == 3
            % Borrar información del archivo
            BorrarInformacion();
        elseif opcion == 4
            % Salir del programa
            break;
        end
    end

    % Mensaje de despedida
    disp("¡Gracias por usar el programa!");
end

