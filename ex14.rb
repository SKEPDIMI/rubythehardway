user_name = ARGV.first || 'user';
prompt = '> ';

puts "Hi, #{user_name}"
puts "Do you like me?", prompt

likes = $stdin.gets.chomp || 'yes'

# A comma for puts is like using it twice
puts "Where do you live?", prompt
lives = $stdin.gets.chomp || 'a house'

puts """
Alright so you said \"#{likes}\" when I asked about liking me
and you said you live in #{lives}..
"""