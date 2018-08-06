# Bear dungeon game!

def gold_room
  puts "This room is full of gold. How much do you take?"

  print "> "
  choice = $stdin.gets.chomp

  if choice.include?("0") || choice.include?("1")
    how_much = choice.to_i
  else
    dead("Learn to type a number")
  end

  if how_much < 50
    puts "You're not greedy, you win!"
    exit(0)
  else
    dead("You greedy bastard!")
  end
end

def bear_room
  puts "There is a bear in here with a bunch of honey"
  puts "He lies infront of the door. How will you move the bear?"

  bear_moved = false

  while true
    print "> "
    choice = $stdin.gets.chomp

    if choice === "take honey"
      dead("The bear looks at you and slaps you.")
    elsif choice === "taunt bear" && !bear_moved
      bear_moved = true
      puts "The bear has moved and is getting closer. Now is the time to open the door!"
    elsif choice === "taunt bear" && bear_moved
      dead("The bear attacks you and chews off your leg")
    elsif choice == "open door" && bear_moved
      gold_room
    elsif choice == "open door" && !bear_moved
      dead("The bear chews your leg off")
    else
      puts "I have no idea what that means"
    end
  end
end

def cthulhu_room
  puts "Here you see the great evil Cthulhu."
  puts "He, it, whatever stares at you and you go insane."
  puts "Do you flee for your life or eat your head?"

  print "> "
  choice = $stdin.gets.chomp

  if choice.include? "flee"
    start
  elsif choice.include? "head"
    dead("Well that was tasty!")
  else
    cthulhu_room
  end
end

def start
  puts "You are in a dark room."
  puts "There is a door to your right and left."
  puts "Which one do you take?"

  print "> "
  choice = $stdin.gets.chomp

  if choice == "left"
    bear_room
  elsif choice == "right"
    cthulhu_room
  else
    dead("You stumble around the room until you starve.")
  end
end

def dead (why)
  puts why, "Good job."
  exit(0)
end

start