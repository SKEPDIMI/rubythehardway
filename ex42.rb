# Class methods

class Person
  def initialize(name)
    @name = name
  end
  def name
    @name
  end
end

me = Person.new 'John'
puts me.name