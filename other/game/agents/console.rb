require_relative '../util/func'

class Func
  include Func_model
end

module Console_model
  def initialize(controller)
    @func = Func.new
    @controller = controller
    @start_time = false
  end

  def finish_time
    @controller.addTime(Time.now - @start_time)
    @start_time = false
  end

  def log(message)
    puts("log >> #{message.upcase}")
  end
  
  def get_input() # Gets input from the user, or checks and runs commands
    # Please dont use get_input()/prompt() inside get_input :)
    @start_time = Time.now

    print "\nresponse > "
    response = $stdin.gets.chomp.downcase
    if response[0] === '#' # This will detect commands from the user
      stripped = response.gsub(/\s+/, "")
      if (stripped === '#time')
        display "Time is #{@controller.timeOfDay} (#{@controller.getData('time')} on day #{@controller.getData('day')})"
      elsif (stripped == "#get")
        # Find arguments and return data
        user = @controller.getData('user')
        if user == nil 
          display "No user has been initialized"
        else
          display """
          NAME: #{user.name}
          MONEY: #{@func.toReadableMoney(user.money)}
          FISHING_ROD_HEALTH: #{user.fishing_rod.health}
          XP: #{user.xp}
          LEVEL: #{user.level}
          """
        end
      elsif stripped[0..7] == '#settime'
        arg = stripped.gsub('#settime', '')
        if arg == ''
          display "No argument provided"
        else
          time = arg.to_i
          if time > 24 || time < 0
            display "Time must be between 0 and 24"
          else
            @controller.set('time', time)
            display "Set time to #{time}"
          end
        end
      elsif stripped == '#gen_luck'
        x = @func.generate_luck
        puts x
      elsif stripped == '#exit'
        exit(0)
      elsif stripped == "#inventory"
        showInventory()
      else
        display "Unknown command: #{stripped}"
      end
    
      finish_time()
      return get_input()
    end

    finish_time()
    return response
  end

  def clearScreen
    puts %x{clear}
  end

  def print_format(message, format = false)
    case true
    when format == false
      puts message
    when format == 'red'
      puts "\e[31m#{message}\e[0m"
    when format == 'italic'
      puts "\e[3m#{message}\e[23m"
    when format == 'underline'
      puts "\e[4m#{message}\e[24m"
    end
  end
  
  def display(message)
    print_format("\n# #{message}\n", 'red')
    $stdin.gets.chomp
  end
  
  def prompt(message, options = false, format = false)
    if options # Make sure the user's option is valid
      while true
        clearScreen()
        print_format("\n# #{message}\n", 'red')
        options.each do |option| # timeall of the options for the user
          puts "* #{option}"
        end
        response = get_input()
  
        if response.gsub(/\s+/, "") == ""
          display "> Empty response"
          next
        end
    
        options.each_with_index do |option, i|
          if option.downcase.include? response
            return i+1 # Return the index+1 of the selected option
          end
        end
      end
  
      # The response is invalid
      clearScreen()
      print_format("I'm not sure what that means", 'italic')
      prompt(message, options)
    else
      while true
        clearScreen()
        print_format("\n# #{message}\n", 'red')
        response = get_input()

        if response.gsub(/\s+/, "") == ""
          display "> Empty response"
          next
        end

        return response
      end
    end
  end

  def dialogue(name, message)
    puts "@#{name}: \"#{message}\""
  end

  def showInventory
    user = @controller.getData('user')
    if user == nil 
      log "No user has been initialized"
    else
      user = @controller.getData('user')
      inventory = @controller.getInventoryPopulated
      if inventory.length == 0
        puts "*-= INVENTORY IS EMPTY 0/50 =-*"
        return false
      else
        display_text = "*-= INVENTORY #{inventory.length}/50 =-*\n"
        inventory.each_with_index do |item, i|
          price = @func.toReadableMoney(item['price'])
          display_text += "|#{i + 1}| [#{item['name']}] | \"#{item['description']} \" | price: #{price} |\n"
        end
        display(display_text)
        return inventory
      end
    end
  end
  def getFromInventory
    while true
      inventory = showInventory()
      if !inventory
        display "NO ITEMS TO SELECT"
        return false
      else
        puts "-- SELECT AN ITEM --"
        puts "-- DO !cancel TO EXIT --"
        response = get_input()
        if response == "!cancel"
          return false
        end
        response = response.to_i
        chosen = inventory[response-1]
        if response === 0 || !chosen
          display "Item at this index does not exist"
        else
          clearScreen()
          response = prompt("Chose #{chosen['name']}. Continue?", ["Yes", "No"]);

          if response == 1
            return chosen
          end
        end
      end
    end
  end
  def deleteFromInventory
    while true
      inventory = showInventory()
      if !inventory
        display "NO ITEMS TO SELECT"
        return false
      else
        puts "-- DELETE AN ITEM --"
        puts "-- DO !cancel TO EXIT --"
        response = get_input()
        if response == "!cancel"
          return false
        end
        response = response.to_i
        chosen = inventory[response-1]
        if response === 0 || !chosen
          display("Item at this index does not exist")
        else
          clearScreen()
          response = prompt("Chose #{chosen['name']}. Continue?", ["Yes", "No"]);

          if response == 1
            @controller.deleteOneFromInventory(chosen)
            return true
          end
        end
      end
    end
  end
end