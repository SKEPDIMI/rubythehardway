require_relative 'engine'
require_relative 'map'
require_relative 'controller'

class Game_Map
  include Map
end
class Game_Engine
  include Engine
end
class Controller_model
  include Controller
end

# Will create a controller
# Controllers get/set the game_data for all Modules
# It is sort of like a centralized store

controller = Controller_model.new({
  'user' => nil,
  'time' => 7,
  'day' => 0
});

engine = Game_Engine.new(controller)

engine.play()

# GAME ENGINE WILL HAVE THE GAME DATA
# GAME ENGINE WILL THEN START A CONTROLER TO ACCESS GAME DATA ACROSS MAP AND CONSOLE
# Ex. of map getting game_data
# class Map
#   @@ locations = { 'city' => City.new @controller }
#   def initialize(controller)
#     @controller = controller
#   end
# end
#
# class City < Location
#   def initialize(controller)
#     user = controller.get('user')
#     puts "Hello, #{user.name}"
#   end
# end
#
# Ex. of console getting game_data
# class Console
#   def initialize(controller)
#     @controller = controller
#   end
# end
#
# def log
#   timeOfDay = @controller.get('timeOfDay')
#   time = @controller.get('time')
#   puts "It is #{timeOfDay} - #{time}"
# end
#