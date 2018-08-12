module City_model
  def enter
    timeOfDay = @controller.timeOfDay
    puts "You arrive at the city entrance"
    
    response = @controller.at('console').prompt('What do you do now?', ['Leave to the beach', 'Go to the market', 'Explore'])
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

    if timeOfDay.include? 'night'
      puts "NOTICE: Market is close during the night"
      response = @controller.at('console').prompt("What do you do now?", ["Head back to city entrance"])
      return '_CITY'
    else
      puts "The city market, packed as always."
      response = @controller.at('console').prompt("What do you do now?", [
        "Visit fish market",
        "Leave back to city entrance"
      ]);

      if response == 1
        return '_CITY_MARKET_FISH_SHOP'
      elsif response == 2
        return '_CITY'
      end
    end
  end

  def id
    return '_CITY_MARKET'
  end
end

module CityMarketFishing_model
  def enter
    puts "You enter the fish market"
    response = @controller.at('console').prompt("Where would you like to go?", [
      "Snapper's fish shop",
      "Barnum's fishing equipment",
      "Back to city entrance"
    ]);

    if response == 1
      return '_CITY_MARKET_FISH_SHOP'
    elsif response == 2
      return '_CITY_MARKET_FISH_EQUIPMENT'
    elsif response == 3
      return '_CITY'
    end
  end

  def id
    return '_CITY_MARKET_FISH'
  end
end

module CityMarketFishingShop_model
  def enter
    @npc_snapper = @controller.at('npcs').get('_SNAPPER');
    puts "You enter Snapper's fishing store"
    
    @npc_snapper.greet
    @npc_snapper.business

    response = @controller.at('console').prompt('What would you like to do now?', [
      'Stay in store',
      'Back to fish market'
    ]);

    if response == 1
      return '_CITY_MARKET_FISH_SHOP'
    elsif response == 2
      return '_CITY_MARKET_FISH'
    end
  end
  def id
    return '_CITY_MARKET_FISH_SHOP'
  end
end