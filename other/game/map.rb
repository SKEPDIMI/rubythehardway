require_relative 'messenger'

class Messenger_model
  include Messenger
end

class Location
  ## LOCATION CLASS
  # A location can be `enter`ed
  # When entered, we can expect the location to return the id of another location
  # All location values are unique

  def initialize
    @messenger = Messenger_model.new
  end
  def enter
    puts "Not yet configured scene"
    exit(1)
  end
end

class Start < Location
  @name = 'Fields'

  def enter()
    puts"You feel the soft breeze easing through your face"
    puts "As you begin to open your eyes, rays of sunlight overwhelm you"
    puts "It takes your eyes a second to adjust to the bright, sunny and light sky overhead you"
    @messenger.print_format("\nIt was all a dream after all.\n", 'italic')
    puts "You lie under the shade of a tree, where you must haven falled asleep a long time ago"
    puts "With your body now rejuvinated, you take a deep breath before sitting upright from your laying position"
    puts "You are then met with a familiar landscape, of fields far beyond the eye can see, mountains raging in the far lands"
    puts "And then you see it, standing as tall as ever, The greatest city to have ever been built"
    puts "THE KINGDOM OF EPIQUORIA - 700 B.C."
    
    response = @messenger.prompt("What would you like to do now?", ["Sleep some more", "Head to the city"]);

    if response == 1
      puts "You head back to sleep."
      @messenger.clearScreen()
      return '_START'
    elsif response == 2
      return '_CITY'
    end
  end

  def id
    return '_START'
  end
end

class City < Location
  def enter
    @messenger.clearScreen()
    @messenger.display('As you approach the walls of the city, you are greeted by guards at the entrance')
    @messenger.display('You enter through the gates of the city')
    response = @messenger.prompt('What do you do now?', ['Leave to the beach', 'Go to the market', 'Explore'])

    return '_FINISH'
  end

  def id
    return '_CITY'
  end
end

class Finish < Location
  def enter()
    @messenger.display("Game ends here")
    exit(0)
  end

  def id
    return '_FINISH'
  end
end

module Map
  ## MAP MODULE
  # The map will contain a hash, making it possible to access locations from the engine
  # e.g:
  # map.enter('_START') # Will call the .enter method of a location
  # map.locations('_START') # will return an instance of the Start location

  @@locations = {
    '_START' => Start.new,
    '_CITY' => City.new,
    '_FINISH' => Finish.new
  }
  def enter(id)
    @@locations[id].enter
  end

  def locations(id)
    return @@locations[id]
  end
end