# Hashes !

person = {
  'name' => 'John',
  'age' => 16,
  'height' => 5 * 12 + 7
}

puts "#{person['name']} is #{person['age']}";

person.delete('height');

cities = {
  'CA' => 'San Fransisco',
  'MI' => 'Detroit',
  'FL' => 'Jacksonville'
}

cities['NY'] = 'New York'

puts '-' * 10

cities.each do |state, abbrev|
  puts cities[state]
end