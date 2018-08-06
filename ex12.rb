print "Give me a number\n"
number = gets.chomp.to_i

print "A bigger number is #{number + 1} :/\n"
print "Give me another one\n"
number = gets.chomp.to_i

print "A smaller number is #{number -1} :P"

print "\nGive me ONE LAST number \n"
number = gets.chomp.to_f

print"\nVoila! #{number + 0.1}"