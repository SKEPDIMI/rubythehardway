final_countdown = [
  3,
  2,
  1
]

fruits = [
  'apples',
  'oranges',
  'pears',
  'apricots'
]

change = [
  1,
  'pennies',
  2,
  'dimes'
]

for number in final_countdown
  puts number
end

fruits.each do |fruit|
  puts "I love #{fruit}"
end

change.each{|i| puts "I got #{i}"}

elements = []

min = 0;
max = 10;

(min..max).each do |i|
  puts "#{elements} << #{i}"
  elements << i
end

puts "Here are my elements: #{elements}"
