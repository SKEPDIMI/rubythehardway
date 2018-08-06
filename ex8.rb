# Formatter!

string = "My name is %{name} and I am %{age} years old"

puts string % {name: "John", age: 16}

string = "I like to %{interest1} and %{interest2}"

puts string % {interest1: "code", interest2: "code some more"}

string = "%{one} %{two}"

puts string % {one: string, two: string}