module City_model
  def enter
    timeOfDay = @controller.timeOfDay
    puts "You arrive at the city entrance"
    
    response = @console.prompt('What do you do now?', ['Leave to the beach', 'Go to the market', 'Explore'])
    if response == 1
      return '_BEACH'
    elsif response == 2
      return '_CITY_MARKET'
    elsif response == 3
      return '_CITY_EXPLORE'
    end

    return '_FINISH'
  end

  def id
    return '_CITY'
  end
end

module CityMarket_model
  def enter
    timeOfDay = @controller.timeOfDay
    puts 'We arrive to the market.'

    if timeOfDay == 'night'
      puts "NOTICE: Market is close during the night"
      response = @console.prompt("What do you do now?", ["Head back to city entrance"])
      return '_CITY'
    else
      puts "The city market, packed as always."
      response = @console.prompt("What do you do now?", ["Visit fishing shop", "Leave back to city entrance"])
      if response == 1
        return '_CITY_MARKET_FISHING'
      elsif response == 2
        return '_CITY'
      end
    end
  end

  def id
    return '_CITY_MARKET'
  end
end