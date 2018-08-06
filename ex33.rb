i = 0
max = 6
numbers = []

while i < max
  puts "#{numbers} << #{i}"
  numbers << i
  i += 1
end

numbers.each{|num| puts num}