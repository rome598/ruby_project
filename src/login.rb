# require bcrypt para encriptar la contraseña
require 'bcrypt'
# usando bycrypt y sin mostrar al escrbir
require 'io/console'
# require './src/archive.rb'
require './src/archive.rb'

# require './src/manager.rb'
require './src/manager.rb'

# require byebug
require 'byebug'


class Login

    # Declarando metodo de inicializacion
    def initialize
        @user_info = []
        @username, @password = '', ''
        @file = Archive.new
        @manager = Manager.new
    end

    # Metodo que pregunta al metodo file_exist? de la clase archivo si existe ese archivo, si existe usuario ha sido ya creado,
    # si no existe el usuario no ha sido creado
    def user_exist?
        # Si el archivo no existe, llamamos al metodo new_user para crear el usuario y crea el archivo
        if (!@file.file_exist?("./dist/user.txt"))
            new_user
            @file.write_file(@username, @password)
        else # Si el archivo existe, llamamos al metodo current_user para validar las credenciales
            # Si existe igualo la variable @user_info con los datos del usuario
            @user_info = @file.read_file
            # Elimino el salto de linea que se encuentra en el archivo
            @user_info.each do |credential|
                credential.gsub!("\n","")
            end
            current_user
            @manager.menu
        end
    end

    # Declarando metodo encargado de crear nuevo usuario o pedir inicio de sesion
    def new_user
        puts "Ingrese su nombre de usuario: "
        @username = gets.chomp
        puts "Ingrese su contraseña: "
        # encriptando la contraseña:
        @password = BCrypt::Password.create(STDIN.noecho(&:gets).chomp)
    end

    # Si el usuario existe, checar si son validas las credenciales que entra por consola
    def current_user
        found = false
        while (!found)
            puts "Ingrese su nombre de usuario: "
            @username = gets.chomp
            puts "Ingrese su contraseña: "
            @password = STDIN.noecho(&:gets).chomp
            if (@username == @user_info[0] && BCrypt::Password.new(@user_info[1]) == @password)
                puts "Bienvenido #{@username}"
                found = true
            else 
                puts "Credenciales incorrectas"
            end
        end
    end

end

