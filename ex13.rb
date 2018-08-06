# unpacked variables!

name, = ARGV

print "How are you, #{name || 'user'}?\n"
response = $stdin.gets.chomp

print "Great? Any plans for later today?\n"
reponse = ARGV

print(response)