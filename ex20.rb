input_file = ARGV.first || 'example.txt';

def print_three(f)
  i = 0;
  while i < 3
    print_a_line(i, f);
    i += 1;
  end
end

def rewind(f)
  f.seek(0)
  puts f.readline
end

def print_a_line(line_count, f)
  puts "Line #{line_count}: #{f.gets.chomp}"
end

current_file = open(input_file);

puts "Now let's rewind \n";

rewind(current_file);

puts "Lets print 3 lines: \n";
print_three(current_file)