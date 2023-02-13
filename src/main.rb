# Encargado de ejecutar el programa

# require './src/login.rb'
require './src/login.rb'

class Main
    def main
        login = Login.new
        login.user_exist?
    end
end

main = Main.new
main.main