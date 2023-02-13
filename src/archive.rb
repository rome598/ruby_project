# Encargado de manejar los archivos en el proyecto.

class Archive
    def initialize
        @user_info = Array.new
    end

    # Metodo encargado de escribir usuario y contraseña
    def write_file(username, password)
        # Abre un archivo llamado user.txt, y escribe el usuario y la contraseña
        File.open("./dist/user.txt", "w") do |f|
            f.puts username
            f.puts password
        end
    end

    def read_file
        # El propósito de este metodo es leer el contenido del archivo "user.txt" línea por línea y almacenarlo en el array llamado @user_info.
        File.open("./dist/user.txt", "r") do |f|
            while line = f.gets
                # Quedando el username en la posicion [0] y el password en la posicion [1]
                @user_info.append(line)
            end
        end
        @user_info
    end

    # Metodo recibe la ruta de un archivo y devuelve si existe o no.
    def file_exist?(ruta)
        File.file?(ruta)
    end

    # Metodos encargados de crear, leer y escribir en archivo de las tareas
    
    # Crea el archivo tasks
    def create_file_tasks
        File.new("./dist/tasks.txt", "w")
    end

    # Leer el archivo tasks
    def read_file_tasks
        File.open("./dist/tasks.txt", "r") do |f|
            while line = f.gets
                # Quedando el username en la posicion [0] y el password en la posicion [1]
                line = eval(line) # eval convierte en string 
                # Se agrega linea x linea la informacion de tasks a la variable $manager
                $manager.append(line)
            end
        end
        $manager
    end

    # Re|Escribir en el archivo tasks el contenido de $manager
    def write_file_tasks
        File.open("./dist/tasks.txt", "w") do |f|
            f.puts $manager
        end
    end
end