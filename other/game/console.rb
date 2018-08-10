module Console
  def initialize(controller)
    @controller = controller
  end

  def log(message)
    print("\n")
    print("log >> #{message.upcase}")
    print("\n")
  end
  
  def get_input()
    print "> "
    response = $stdin.gets.chomp.downcase

    if response[0] === '#' # This will detect commands from the user
      stripped = response.gsub(/\s+/, "")
      if (stripped === '#time')
        puts "Time is #{@controller.getTimeOfDay} (#{@controller.get('time')})"
      elsif (stripped[0,3] "#get")
        # Find arguments and return data
      end
      return get_input()
    end

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