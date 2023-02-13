# Encargado de manejar las tareas en el proyecto.

class Task
    @name = ''
    @state = ''
    @task = {
        name: '',
        state: ''
    }

    def create(name, state)
        @name = name
        @state = state
        @task = {
            name: @name,
            state: @state
        }
        $manager.append(@task)
    end

    def show
        $manager
    end

    # Busca una tarea por el nombre, y la retorna
    def show_by_name(name)
        _task = $manager.select do |task|
            task[:name] == name
        end
        _task
    end

    # Busca la tarea a actualizar por nombre, pide el nuevo nombre, guarda la tarea
    def update(name)
        @task = show_by_name(name)
        puts "Ingrese en nuevo nombre: "
        @name = gets.chomp
        @task[0][:name] = @name
    end

    # Busca la tarea a actualizar por nombre, y le cambia su estado a 1
    def mark_as_in_process(name)
        $manager.each do |task|
            if (task[:name] == name)
                task[:state] = 1
            end
        end
    end

    # Busca la tarea a actualizar por nombre, y le cambia su estado a 2
    def mark_as_done(name)
        $manager.each do |task|
            if (task[:name] == name)
                task[:state] = 2
            end
        end
    end

    # Retorna todas las tareas creadas (estado 0)
    def get_all_created
        _create_tasks = []
        $manager.each do |task|
            if (task[:state] == 0)
                _create_tasks.append(task)
            end
        end
        _create_tasks
    end

    # Retorna todas las tareas en proceso (estado 1)
    def get_all_in_process
        _in_process_tasks = []
        $manager.each do |task|
            if (task[:state] == 1)
                _in_process_tasks.append(task)
            end
        end
        _in_process_tasks
    end

    # Retorna todas las tareas finalizadas (estado 2)
    def get_all_done
        _done_tasks = []
        $manager.each do |task|
            if (task[:state] == 2)
                _done_tasks.append(task)
            end
        end
        _done_tasks
    end

end