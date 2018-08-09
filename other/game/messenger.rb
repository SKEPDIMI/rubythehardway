module Messenger
  def display(message)
    puts "# #{message}"
  end
  
  def prompt(message, options = false, extra_message = false)
    # system("clear")
    if extra_message
      puts "# #{extra_message}"
    end
    print "# #{message}\n"

    if options # Make sure the user's option is valid
      options.each do |option|
        puts "* #{option}"
      end
  
      response = $stdin.gets.chomp.downcase
  
      options.each_with_index do |option, i|
        puts option
        if option.downcase.include? response
          return i + 1
        end
      end
  
      # The response is invalid
      prompt(message, options, "I'm not sure what that means")
    else
      return $stdin.gets.chomp.downcase || ''
    end
  end
end