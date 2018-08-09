module Messenger
  def log(message)
    print("\n")
    print("log >> #{message.upcase}")
    print("\n")
  end
  
  def clearScreen
    log "DONE"
    print "\e[2J\e[f"
    system "clear"
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
      options.each do |option| # Print all of the options for the user
        puts "* #{option}"
      end
  
      print("> ")
      response = $stdin.gets.chomp.downcase
  
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
      return $stdin.gets.chomp.downcase || ''
    end
  end
end