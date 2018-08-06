class Person
  @@programming_languages = []

  def initialize (name, age, programming_languages)
    @name, @age, @@programming_languages = name, age, programming_languages
  end
  def greet
    puts "Hi! I'm #@name"
  end
  def birthday
    @age += 1
    puts "I'm now #@age"
  end
  def learn_programming (language)
    @@programming_languages << language
    puts "I know #@@programming_languages!"
  end
end

me = Person.new("John", 16, ["HTML"]);

me.greet();
me.birthday();
me.learn_programming("ruby");