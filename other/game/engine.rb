require_relative 'user'
require_relative 'messenger'

class User_model
  include User
end

class Messenger_model
  include Messenger
end

module Engine
  def initialize(map)
    @messenger = Messenger_model.new
    @map = map

    current_location = @map.locations('_START')
    last_scene = @map.locations('_FINISH')

    while current_location != last_scene
      next_location_id = current_location.enter() || '_FINISH' # Enter the current location, which will return the next scene's ID WHEN the player finishes the given scene
      current_location = @map.locations(next_location_id) # Current location is now the location that goes after the completed location
    end

    current_location.enter()
  end
  def play
    messenger.prompt """
      ### EPIQUEST 64 ###
      ~~~~~~~~~~~~~~~~~~~
      
      > made by john in ruby
      > PRESS ENTER TO BEGIN
    """

    messenger.display("Welcome to Epiquest.")

    name = messenger.prompt("What is your name, traveller?")
    
    @user_data = User_model.new(name)

    messenger.display("An honor to meet you, #{@user_data.name}");
    messenger.prompt("An honor to meet you, #{@user_data.name}.\n# Let us begin our quest.\n> PRESS ENTER TO BEGIN");

    @scene_map.enter(0)
  end
end
