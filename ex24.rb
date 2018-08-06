puts "Let's practive everything"
puts "You'd need to know \'bout escapes with \\ that newline and \t tabs"

poem = <<END
\tThe lovely world
with logic so form planted
cannot discern \n the needs of love
nor comprehend passion from intuition
and requires an explanation
\n\t\twhere there is none

END

puts "-" * 10
puts poem
puts "-" * 10

five = 10 - 2 + 3 - 6
puts "FIVE === #{five}"

def formula(started = 0)
  jelly_beans = started * 500
  jars = jelly_beans / 1000
  crates = jars / 100
  # return an array
  return jelly_beans, jars, crates
end

start

# Set names to the array returned ( order matters )
beans, jars, crates = formula(start);

puts "We have #{crates} crates from #{beans} beans."