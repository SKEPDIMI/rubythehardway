puts "You enter a dark room with two doors. Do you choose door 1 or 2?"
print "> "

door = $stdin.gets.chomp

if door === "1"
  puts "There's a giant bear here eating a cheese cake. What do you do? 1.Take the cake 2.Scream at the bear"
  print "> "

  option = $stdin.gets.chomp

  if option === "1"
    puts "The bear eats your face off. Nice job."
  elsif option === "2"
    puts "The beat eats your legs off. Good job."
  else
    puts "You escape the bear with cheesecake. You win!"
  end
elsif door === "2"
  puts "You stare into the abyss and go insane"
else
  puts "Unknown command"
end