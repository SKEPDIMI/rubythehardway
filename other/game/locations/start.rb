module Start_model
  def enter()
    timeOfDay = @controller.timeOfDay
    day = @controller.get('day')

    if timeOfDay == 'morning' && day == 0
      puts "You feel the soft breeze easing through your face"
      puts "As you begin to open your eyes, rays of sunlight overwhelm you"
      puts "It takes your eyes a second to adjust to the bright, sunny and light sky overhead you"
      @console.print_format("\nIt was all a dream after all.\n", 'italic')
      puts "You lie under the shade of a tree, where you must haven falled asleep a long time ago"
      puts "With your body now rejuvinated, you take a deep breath before sitting upright from your laying position"
      puts "You are then met with a familiar landscape, of fields far beyond the eye can see, mountains raging in the far lands"
      puts "And then you see it, standing as tall as ever, The greatest city to have ever been built"
      puts "THE KINGDOM OF EPIQUORIA - 700 B.C."
    else day == 1
      puts "You lie under the same shade without a care in the world, free of the worries of the world"
    end

    response = @console.prompt("What would you like to do now?", ["Sleep some more", "Head to the city"]);

    if response == 1
      case
      when timeOfDay == 'morning' || timeOfDay == 'midday'
        @console.prompt("You close your eyes and head back to sleep again...")
        @controller.addTime(14400) #4 hours
      when timeOfDay == 'afternoon'
        @console.prompt("Seeing it's getting late you head back to sleep again...")
        @controller.addTime(7200) #2 hours
      when timeOfDay == 'evening'
        @console.prompt("It's getting dark, but you still head back to sleep")
        @controller.addTime(3600) #1 hour
      when timeOfDay == 'night'
        @console.prompt("Seeing its dark you still head back to sleep")
        @controller.addTime(1800) #30 min
      end
      return '_START'
    elsif response == 2
      @console.display('As you approach the walls of the city, you are greeted by guards at the entrance')
      @console.prompt('You enter through the gates of the city')

      return '_CITY'
    end
  end

  def id
    return '_START'
  end
end