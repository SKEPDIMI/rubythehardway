require_relative 'engine'
require_relative 'map'

class Game_Map
  include Map
end
class Game_Engine
  include Engine
end

a_map = Game_Map.new
a_engine = Game_Engine.new a_map
a_game = a_engine.play