module Start_model
  def enter()
    timeOfDay = @controller.timeOfDay
    day = @controller.getData('day')

    if timeOfDay == 'morning' && day == 0
      @controller.at('console').display """
       You feel the soft breeze easing through your face
       As you begin to open your eyes, rays of sunlight overwhelm you
       It takes your eyes a second to adjust to the bright, sunny and light sky overhead you
        \nIt was all a dream after all.\n
       You lie under the shade of a tree, where you must haven falled asleep a long time ago
       With your body now rejuvinated, you take a deep breath before sitting upright from your laying position
       You are then met with a familiar landscape, of fields far beyond the eye can see, mountains raging in the far lands
       And then you see it, standing as tall as ever, The greatest city to have ever been built
       THE KINGDOM OF EPIQUORIA - 700 B.C.
      """
    else
      @controller.at('console').display "You lie under the same shade without a care in the world, free of the worries of the world"
    end

    response = @controller.at('console').prompt("What would you like to do now?", [
      "Sleep some more",
      "Head to the city"
    ]);

    if response == 1
      case
      when timeOfDay == 'morning' || timeOfDay == 'midday'
        @controller.at('console').display("You close your eyes and head back to sleep again...")
        @controller.addTime(14400) #4 hours
      when timeOfDay == 'afternoon'
        @controller.at('console').display("Seeing it's getting late you head back to sleep again...")
        @controller.addTime(7200) #2 hours
      when timeOfDay == 'evening'
        @controller.at('console').display("It's getting dark, but you still head back to sleep")
        @controller.addTime(3600) #1 hour
      when timeOfDay.include?('night')
        @controller.at('console').display("Seeing its dark you still head back to sleep")
        @controller.addTime(1800) #30 min
      end
      return '_START'
    elsif response == 2
      @controller.at('console').display('As you approach the walls of the city, you are greeted by guards at the entrance')
      @controller.at('console').display('You enter through the gates of the city')

      return '_CITY'
    end
  end

  def id
    return '_START'
  end
end