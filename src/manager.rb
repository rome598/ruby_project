# Manager se encarga de responder las peticiones del usuario. (clase login).

# require './src/archive.rb'
require './src/archive.rb'
# require './src/task.rb'
require './src/task.rb'

class Manager
    # Creando una variable global
    # La variable $manager leera toda la informacion de las tareas y se guardara en esta
    # Cada vez que se editen estas, se editara la variable $manager y luego el archivo se sobreescribe con la variable $manager
    $manager = []
    
    # Instanciando las clases task y archive
    def initialize
        @task = Task.new
        @archive = Archive.new
        $manager = @archive.read_file_tasks
    end

    # Metodo para comprobar si existe el archivo task, existen tareas por lo que se leen, si no existe,
    # llamar a la funcion que crea el archivo
    def initialize_file
        if (!@archive.file_exist?("./dist/tasks.txt"))
            $manager = ''
            @archive.create_file_tasks
        else
            @manager = archive.read_file_tasks
        end
    end

    # Metodo encargado de llamar a crear tarea en task
    def create_task
        puts "Nombre de la tarea: "
        _name = gets.chomp
        @task.create(_name, 0)
        @archive.write_file_tasks
        gets
    end

    # Llamar al metodo show de @task, para que muestre $manager (todas las tareas)
    def get_tasks
        puts @task.show
        gets
    end

    # Pedirle al usuario el nombre de la tarea a buscar, y luego atraves de @task llamar al metodo que
    # llama las tareas por nombre y pasarle el parametro del nombre qe entro el usuario.
    def get_task_by_name
        puts "Ingrese en nombre de la tarea: "
        name = gets.chomp
        puts @task.show_by_name(name)
        gets
    end

    def update_task
        puts "Ingrese en nombre de la tarea: "
        name = gets.chomp
        @task.update(name)
        @archive.write_file_tasks
        gets
    end

    def mark_as_in_process
        puts "Ingrese en nombre de la tarea a iniciar: "
        name = gets.chomp
        @task.mark_as_in_process(name)
        @archive.write_file_tasks
        gets
    end

    def mark_as_done
        puts "Ingrese en nombre de la tarea a finalizar: "
        name = gets.chomp
        @task.mark_as_done(name)
        @archive.write_file_tasks
        gets
    end

    # Ver todas las tareas creadas, metodo llama al metodo get_all_created en @task
    def get_all_created
        if(@task.get_all_created != 0)
           puts @task.get_all_created
        else
            puts "No hay tareas creadas"
        end
        gets
    end
    # Ver todas las tareas creadas, metodo llama al metodo get_all_created en @task
    def get_all_in_process
        if(@task.get_all_in_process != 0)
            puts @task.get_all_in_process
        else
            puts "No hay tareas finalizadas"
        end
        gets
    end
    # Ver todas las tareas creadas, metodo llama al metodo get_all_created en @task
    def get_all_done
        if (@task.get_all_done.length != 0)
            puts @task.get_all_done
        else
            puts "No hay tareas finalizadas"
        end
        gets
    end


    def menu
        op = 0
        while (op != 10)
            system 'clear'
            puts "*****************************************"
            puts "* 1. Crear tarea                        *"
            puts "* 2. Listar todas las tareas            *"
            puts "* 3. Buscar tarea por nombre            *"
            puts "* 4. Editar tarea                       *"
            puts "* 5. Marcar como en proceso             *"
            puts "* 6. Marcar como terminada              *"
            puts "* 7. Ver todas las tareas creadas       *"
            puts "* 8. Ver todas las tareas en proceso    *"
            puts "* 9. Ver todas las tareas finalizadas   *"
            puts "* 10. Salir                             *"
            puts "*****************************************"
            op = gets.to_i

            case op
            when 1
                system 'clear'
                create_task
            when 2
                system 'clear'
                get_tasks
            when 3
                system 'clear'
                get_task_by_name
            when 4
                system 'clear'
                update_task
            when 5
                system 'clear'
                mark_as_in_process
            when 6
                system 'clear'
                mark_as_done
            when 7
                system 'clear'
                get_all_created
            when 8
                system 'clear'
                get_all_in_process
            when 9
                system 'clear'
                get_all_done
            when 10
                system 'clear'
                puts "*******************"
                puts "*  See you soon!  *"
                puts "*******************"
            end
        end
    end
end