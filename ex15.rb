# Reading files! Woohoo!

file_name = ARGV.first || 'ex1.rb';
separator = "\n" + ("-" * 20) + "\n"

txt = open(file_name);

puts "Here is \"#{file_name}\":\n"
print separator
print txt.read;
print separator

puts "Would you like to read another file? (y / N) \n"
response = $stdin.gets.chomp

if response === 'y'
  puts "Please enter a file name:\n"
  response = $stdin.gets.chomp

  txt = open(response)
  print separator
  print txt.read
  print separator
end