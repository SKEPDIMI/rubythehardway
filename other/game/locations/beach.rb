module Beach_model
  def enter
    puts "You arrive at the beach"
    response = @controller.at('console').prompt("What do you do?", ["Fish", "Head to docks", "Go to city"]);

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
    user = @controller.getData('user')
    fishing_rod = user.fishing_rod

    if fishing_rod.health <= 0
      puts "You swing your fishing rod out into the water only to have it snap in half"
    else
      @controller.at('console').clearScreen()
      puts "You begin fishing"

      result = fishing_rod.launch()
      
      @controller.at('console').clearScreen()

      if !result
        @controller.at('console').display "Tough luck.. You didnt catch anything!"
      elsif result
        @controller.at('console').display "You caught a #{result['name']}! #{result['description']}"
        response = @controller.at('console').prompt("Keep item?", ["Yes", "No"])
        if response == 1
          @controller.addToInventory(result)
          
          @controller.at('console').display("Added #{result['name']} to inventory!")
        end
      end
      response = @controller.at('console').prompt("What do you do now?", ["Fish again", "Back to beach"])

      if response == 1
        return '_BEACH_FISH'
      elsif response == 2
        return '_BEACH'
      end
    end
  end
  def id
    return '_BEACH_FISH'
  end
end

module BeachDocks_model
  def enter
    timeOfDay = @controller.timeOfDay;

    user = @controller.getData('user');
    puts "You arrive at the docks"

    if timeOfDay.include? "night"
      @controller.at('console').display "The docks are closed at this time. Come back in the morning"
      return "_BEACH"
    else
      response = @controller.at('console').prompt("Where do you want do go?", [
        "Deep sea fishing (5 silver, 3 hours)",
        "Tamarin island (27 copper)",
        "Miradona (10 gold)",
        "Back to beach"
      ]);

      if response == 1
        if user.money < 500
          @controller.at('console').display "You dont have enough money (#{user.money/100} / 5 silver)"
          return "_BEACH_DOCKS"
        else
          @controller.addMoney(-500)
          return travelling_display('_BEACH_DEEPSEA', 'the deep sea', 1)
        end
      elsif response == 2
        if user.money < 27
          @controller.at('console').display "You dont have enough money (#{user.money} / 27 copper)"
          return "_BEACH_DOCKS"
        else
          @controller.addMoney(-27)
          return travelling_display('_TAMARINISLAND', 'Tamarin island', 2)
        end
      elsif response == 3
        if user.money < 10000
          @controller.at('console').display "You dont have enough money (#{user.money / 10000} / 10 gold)"
          return "_BEACH_DOCKS"
        else
          @controller.addMoney(-10000)
          return travelling_display('_MIRADONA', 'Miradona', (rand(5..6)).round)
        end
      elsif response == 4
        return '_BEACH'
      end
    end
  end
  def travelling_display(id, name, days)
    @controller.at('console').clearScreen()

    Whirly.start spinner: "clock" do
      Whirly.status = "Mounting boat.."
      sleep 5
      Whirly.status = "Waiting for line.."
      sleep 7
      Whirly.status = "Leaving dock!"
      sleep 8
    end

    i = 0
    while i < days
      @controller.at('console').clearScreen()
      if i % 2 == 0
        Whirly.start spinner: "earth" do
          Whirly.status = "Travelling to #{name}.."
          sleep 10
        end
      else
        Whirly.start spinner: "moon" do
          Whirly.status = "Travelling to #{name}.."
          sleep 10
        end
      end

      i+=1
    end

    return id
  end
  def id
    return '_BEACH_DOCKS'
  end
end