name = ARGV.first || 'user';

def file_read
  puts "Please enter the file to read"
  file_name = $stdin.gets.chomp

  if !File.exist?(file_name)
    puts "This file does not exist"
    file_read
  else
    puts "opening file..."
    file = File.open(file_name)
    puts """
    ----------
    #{file.read}
    ----------
    """

    puts "read another file? (y / N)\n"
    response = $stdin.gets.chomp.downcase

    if response === 'y'
      file_read
    end
  end
end

def file_copy
  puts "Please enter the file to copy\n"
  file_name = $stdin.gets.chomp

  if !File.exist?(file_name)
    puts "\"#{file_name}\" does not exist"
    file_copy
    return false
  end

  puts "Please enter the file to be overwritten"
  file2_name = $stdin.gets.chomp

  if !File.exist?(file2_name)
    puts "\"#{file2_name}\" does not exist"
    file_copy
    return false
  end

  file1 = open(file_name);
  file1_txt = file1.read;

  output = open(file2_name, 'w');
  output.write(file1_txt);
  
  puts "Copied successfully"

  puts "copy another file? (y / N)\n"
  response = $stdin.gets.chomp.downcase
  if response === 'y'
    file_copy
  end
end

def file_write
  puts "Please enter the file to write to"
  file_name = $stdin.gets.chomp

  if !File.exist?(file_name)
    puts "This file does not exist"
    file_write
  else
    file = File.open(file_name, 'r+')
    old_txt = file.read

    puts "--------------\n#{old_txt}\n"
    puts "(new text)>"

    new_text = $stdin.gets.chomp

    file.write(new_text);
    puts "Written to file successfully."

    puts "write to another file? (y / N)\n"
    response = $stdin.gets.chomp.downcase
    if response === 'y'
      file_write
    end
  end
end

def file_delete
  puts "Please enter the file to write to"
  file_name = $stdin.gets.chomp

  if !File.exist?(file_name)
    puts "This file does not exist"
    file_delete
  else
    File.delete(file_name)
    puts "Deleted file successfully"

    puts "delete another file? (y / N)\n"
    response = $stdin.gets.chomp.downcase
    if response === 'y'
      file_delete
    end
  end
end

commands = [
  "READ",
  "COPY",
  "WRITE",
  "DELETE"
]

puts "Welcome, user. What would you like to do? \n"
print commands.join(', ') + "\n"

response = $stdin.gets.chomp.upcase

if !commands.include? response
  puts "UNKNOWN COMMAND"
else 
  if response === "READ"
    file_read
  elsif response === "COPY"
    file_copy
  elsif response === "WRITE"
    file_write
  elsif response === "DELETE"
    file_delete
  else
    puts "unkown command"
  end
end