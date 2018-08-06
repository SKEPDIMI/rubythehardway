# Now we write and delete them!?

filename = ARGV.first || 'example.txt';

puts "ERASE #{filename} ? \n"
puts "CTRL-C to cancel \n"
puts "ENTER to continue \n"

$stdin.gets

puts "Opening file...";
target = open(filename, 'w');

puts "Truncating.."

target.truncate(0);

puts "Deleted. Insert new content: \n"
new_text = $stdin.gets.chomp

if !new_text
  puts "OK"
  return
end

puts "Writing new content..."
target.write(new_text);

puts "Closing file";

target.close();

puts "OK"