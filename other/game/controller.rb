module Controller
  def initialize(game_data)
    @data = game_data
    puts "CONTROLLER_DATA: "
    puts @data['time']
  end
  def get(prop)
    return @data[prop]
  end
  def set(prop, value)
    @data[prop] = value
  end
  def addTime(seconds = 0) # Changes from real life seconds to game time and adds to it
    @data['time'] += (seconds * 0.05)
    if (@data['time'] > 24)
      @data['time'] = 0
    end
  end
  def getTimeOfDay
    time = @data['time']
    case
    when time <= 1
      return 'midnight'
    when time >= 11 && time <= 13
      return 'midday'
    when time >= 1 && time <= 11
      return 'morning'
    when time >= 13 && time <= 18
      return 'afternoon'
    when time >= 18 && time <= 0
      return 'evening'
    end
  end
end