module Beach_model
  def enter
    puts "You arrive at the beach"
    response = @console.prompt("What do you do?", ["Fish", "Head to docks", "Go to city"]);

    if response == 1
      return "_BEACH_FISH"
    elsif response == 2
      return "_BEACH_DOCKS"
    elsif response == 3
      return "_CITY"
    end
  end
  def id
    return '_BEACH'
  end
end

module BeachFish_model
  def enter
    puts "You sit by the hedge of a small rock cliff by the water"
    user = @controller.get('user')

    if user.fishing_rod_health <= 0
      puts "You swing your fishing rod out into the water only to have it snap in half"
    else
      puts "You begin fishing"
    end
  end
  def id
    return '_BEACH_FISH'
  end
end