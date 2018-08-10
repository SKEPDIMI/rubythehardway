require_relative 'user'
require_relative 'console'

class User_model
  include User
end

class Console_model
  include Console
end

module Engine
  def initialize(controller)
    @controller = controller
    @console = Console_model.new(controller)
    @map = Game_Map.new(controller)
  end
  def play
    @console.prompt """
      _____ ______  _____  _____  _   _  _____  _____  _____             ____    ___ 
      |  ___|| ___ \\|_   _||  _  || | | ||  ___|/  ___||_   _|           / ___|  /   |
      | |__  | |_/ /  | |  | | | || | | || |__  \\ `--.   | |    ______  / /___  / /| |
      |  __| |  __/   | |  | | | || | | ||  __|  `--. \\  | |   |______| | ___ \\/ /_| |
      | |___ | |     _| |_ \\ \\/' /| |_| || |___ /\\__/ /  | |            | \\_/ |\\___  |
      \\____/ \\_|     \\___/  \\_/\\_\\ \\___/ \\____/ \\____/   \\_/            \\_____/    |_/
      EPIQUEST 64
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      > Made by SKEPDIMI                           
      > Please play in fullscreen
      > Exit: Ctrl-C
      > Begin: RETURN                                             
    """

    @console.clearScreen()
    
    name = @console.prompt("What is your name, traveller?").capitalize
    
    @controller.set('user', User_model.new(name));
    user = @controller.get('user');

    @console.prompt("An honor to meet you, #{user.name}.\n# Let us begin our quest.\n> PRESS ENTER TO BEGIN");

    gameLoop()
  end

  def gameLoop
    current_location = @map.locations('_START')
    last_scene = @map.locations('_FINISH')

    # THIS IS THE MAIN GAME LOOP
    while current_location != last_scene
      started_time = Time.now

      next_location_id = current_location.enter() || '_FINISH' # Enter the current location, which will return the next scene's ID WHEN the player finishes the given scene
      current_location = @map.locations(next_location_id) # Current location is now the location that goes after the completed location
      
      @console.clearScreen()

      @controller.addTime(Time.now - started_time)
      
      puts "#{@controller.getTimeOfDay} (#{@controller.get('time')})"
    end

    current_location.enter()
  end
end
