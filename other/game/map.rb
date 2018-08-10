require_relative 'console'
require_relative 'locations/start'
require_relative 'locations/city'
require_relative 'locations/beach'

class Console_model
  include Console
end

class Location
  ## LOCATION CLASS
  # A location can be `enter`ed
  # When entered, we can expect the location to return the id of another location
  # All location values are unique

  def initialize(controller)
    @controller = controller
    @console = Console_model.new(controller)
  end
  def enter
    puts "THIS LOCATION's ENTER METHOD HAS NOT BEEN CONFIGURED YET"
    exit(1)
  end
  def id
    puts "THIS LOCATION's ID HAS NOT BEEN CONFIGURED YET"
    exit(1)
  end
end

class Start < Location
  include Start_model
end

class City < Location
  include City_model
end

class CityMarket < Location
  include CityMarket_model
end

class Beach < Location
  include Beach_model
end

class BeachFish < Location
  include BeachFish_model
end

class Finish < Location
  def enter()
    @console.display("Game ends here")
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

  def initialize(controller)
    @@locations = {
      '_START' => Start.new(controller),
      '_CITY' => City.new(controller),
        '_CITY_MARKET' => CityMarket.new(controller),
      '_BEACH' => Beach.new(controller),
      '_FINISH' => Finish.new(controller)
    }
  end

  def enter(id)
    @@locations[id].enter
  end

  def locations(id)
    return @@locations[id]
  end
end