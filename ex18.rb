# Functions!!!

# *args will take all arguments and put them in args

def print_two(*args)
  arg1, arg2 = args
  puts "arg1: #{arg1}, arg2 #{arg2}"
end

def print_two_again(arg1, arg2)
  puts "arg1: #{arg1}, arg2: #{arg2}"
end

def print_one(arg)
  puts "arg: #{arg}"
end

def print_none()
  puts "..."
end

print_two("John", "diaz");
print_two_again("JOHN", "DIAZ");
print_one("JOHN");
print_none();