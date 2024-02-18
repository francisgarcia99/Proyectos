#Universidad de San Carlos de Guatemala
#Eleuterio Francis Garcia Aguilon 201906545
#Hoja de trabajo 1
# Funciones para cada opción

function CalcularYMostrarIMC()
  # Definición de las categorías
  bajoPeso = "Bajo peso";
  pesoNormal = "Peso normal";
  sobrePeso = "Sobrepeso";
    # Leer nombre, peso y altura del usuario
    nombre = input("Ingrese su nombre: ", 's');
    peso = input("Ingrese su peso en kg: ");
    altura = input("Ingrese su altura en metros: ");

    # Calcular el IMC
    imc = peso / (altura^2);

    # Determinar la categoría
    if imc < 18.5
        categoria = bajoPeso;
    elseif imc >= 18.5 && imc < 25
        categoria = pesoNormal;
    else
        categoria = sobrePeso;
    end

    # Mostrar el IMC y la categoría
    disp(strcat("IMC calculado para ", nombre, ": ", num2str(imc)));
    disp(strcat("Categoría: ", categoria));
    disp('');
    disp('');

    try
        fid = fopen('imc.txt', 'a');  # Abre el archivo en modo de escritura, añadiendo al final
        fprintf(fid, 'Nombre: %s, Peso: %s kg, Altura: %s m, IMC: %s, Categoría: %s\n', nombre, num2str(peso), num2str(altura), num2str(imc), categoria);
        fclose(fid);
        disp("Datos guardados en imc.txt");
    catch
        disp("Error al guardar los datos en imc.txt");
    end

end


function LeerInformacion()
    try
        fid = fopen('imc.txt', 'r');  # Abre el archivo en modo de lectura

        while ~feof(fid)  # Mientras no sea el final del archivo
            line = fgetl(fid);  # Lee una línea
            disp(line);  # Muestra la línea (puedes ajustar cómo procesar cada línea)

            % Aquí puedes procesar cada línea según tus necesidades
            % Por ejemplo, podrías analizar la línea con textscan si sabes que sigue un formato específico
            % Ejemplo: data = textscan(line, 'Nombre: %d, Peso: %d kg, Altura: %d m, IMC: %f, Categoría: %s');
        end

        fclose(fid);

    catch err
        disp("Error al leer el archivo 'imc.txt'");
        disp(err.message);  # Muestra el mensaje de error específico
        disp(err.identifier);  # Muestra la identificación del error
    end
end

function BorrarInformacion()
    try
        fid = fopen('imc.txt', 'w');  # Abre el archivo en modo de escritura (crea uno nuevo o sobrescribe el existente)
        fclose(fid);
        disp("Datos del archivo 'imc.txt' eliminados");1

    catch err
        disp("Error al eliminar los datos del archivo 'imc.txt'");
        disp(err.message);  # Muestra el mensaje de error específico
        disp(err.identifier);  # Muestra la identificación del error
    end
end

# Bucle principal
while true
    # Mostrar opciones


    # Mostrar las opciones disponibles al usuario
    disp("1. Calcular y mostrar IMC")
    disp("2. Leer información del archivo")
    disp("3. Borrar información del archivo")
    disp("4. Salir")
    # Leer la opción del usuario
    disp('prueba');
    opcion = input("Ingrese la opción deseada: ");

    # Validar la opción
    if ~(1 <= opcion && opcion <= 4)
        disp("Opción no válida. Intente de nuevo");
        continue;
    end

    # Ejecutar la acción según la opción
    if opcion == 1
        # Calcular IMC y mostrar resultados
        CalcularYMostrarIMC();
    elseif opcion == 2
        # Leer información del archivo
        LeerInformacion();
    elseif opcion == 3
        # Borrar información del archivo
        BorrarInformacion();
    elseif opcion == 4
        # Salir del programa
        break;
    end
end
