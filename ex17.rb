# Copying files!
from_file, to_file = ARGV;
puts "Copying from #{from_file} to #{to_file}";

file1 = open(from_file);
txt = file1.read;

puts "The input file is #{txt.length} bytes";

if !File.exist?(to_file)
  puts "The output file does not exist"
  return
end

puts "To hit CTRL-C. To continue hit RETURN";
$stdin.gets;

file2 = open(to_file, 'w');
file2.write(txt);

puts "Copied file successfully";

file1.close;
file2.close;