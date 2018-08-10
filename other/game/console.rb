module Console
  def initialize(controller)
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
    @start_time ||= Time.now
    print "> "
    response = $stdin.gets.chomp.downcase

    if response[0] === '#' # This will detect commands from the user
      stripped = response.gsub(/\s+/, "")
      if (stripped === '#time')
        log "Time is #{@controller.timeOfDay} (#{@controller.get('time')})"
      elsif (stripped == "#get")
        # Find arguments and return data
        user = @controller.get('user')
        if user == nil 
          log "No user has been initialized"
        else
          log """
          NAME: #{user.name}
          GOLD: #{user.gold}
          FISHING_ROD_HEALTH: #{user.fishing_rod_health}
          XP: #{user.xp}
          LEVEL: #{user.level}
          """
        end
      elsif stripped[0..7] == '#settime'
        arg = stripped.gsub('#settime', '')
        if arg == ''
          log "No argument provided"
        else
          time = arg.to_i
          if time > 24 || time < 0
            log "Time must be between 0 and 24"
          else
            @controller.set('time', time)
            log "Set time to #{time}"
          end
        end
      elsif stripped == '#exit'
        exit(0)
      else
        log "Unknown command: #{stripped}"
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
    puts "# #{message}"
  end
  
  def prompt(message, options = false, format = false)
    print_format("\n# #{message}\n", 'red')

    if options # Make sure the user's option is valid
      options.each do |option| # timeall of the options for the user
        puts "* #{option}"
      end
  
      response = get_input()
  
      options.each_with_index do |option, i|
        if option.downcase.include? response
          return i+1 # Return the index+1 of the selected option
        end
      end
  
      # The response is invalid
      clearScreen()
      print_format("I'm not sure what that means", 'italic')
      prompt(message, options)
    else
      return get_input()
    end
  end
end