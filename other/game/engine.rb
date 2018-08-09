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
      next_location_id = current_location.enter # Current scene will return the next scene once the player finishes it
      current_location = @map.locations(next_location_id) # Play the next scene
      puts current_location.id || 'OOPS'
    end

    current_location.enter()
  end
  def play
    prompt """
      ### EPIQUEST 64 ###
      ~~~~~~~~~~~~~~~~~~~
      
      > made by john in ruby
      > PRESS ENTER TO BEGIN
    """

    messenger.display('Welcome to Epiquest.')

    name = messenger.prompt("Welcome to Epiquest. \n# What is your name, traveller?")
    @user_data = User_model.new(name)

    messenger.display("An honor to meet you, #{@user_data.name}");
    messenger.prompt("An honor to meet you, #{@user_data.name}.\n# Let us begin our quest.\n> PRESS ENTER TO BEGIN");

    @scene_map.enter(0)
  end
end
