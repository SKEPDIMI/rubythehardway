class Animal
  @dead = nil
  def initialize()
    @dead = false
  end

  attr_accessor :name
  
  def live()
    puts "i'm alive now."
  end
end

class Tetrapod < Animal
  def crawl()
    puts "crawl crawl crawl..."
  end
end

class Amniote < Tetrapod
  def fertalize()
    puts "I'm having a baby"
  end
end

class Mammal < Amniote
  def inhale()
    puts "Inhale"
    puts "Exhale"
  end
end

class Carnivora < Mammal
  def bite()
    puts "you have been bitten"
  end
end

class Califormia < Carnivora
  def growl()
    puts "#@name(#@species): grrr"
  end
end

class Dog < Califormia
  def initialize(name)
    @species = 'Dog'
    @name = name

    @owner = nil
  end
  attr_accessor :name
  def bork
    puts "#@name(#@species): bork"
  end
  def roll_over
    puts "#@name(#@species) rolls over"
  end
end

class Primate < Mammal
  def climb(c)
    puts "#@name(#@species) climbs onto #{c}"
  end
end

class Human < Primate
  def initialize(name)
    @species = 'Human'
    @name = name
    @pet = nil
  end

  attr_accessor :name
  attr_accessor :pet

  def greet()
    puts ("#@species: Hello, I am #@name.")
  end
  def speak(m)
    puts "#@name (#@species): #{m}"
  end
  def philosophize(t)
    puts "#@name (#@species): what does it mean to \"#{t}\"???"
  end

  def domesticate(d)
    puts "#@name has domesticated #{d.name}"
  end
end

tom = Human.new('Tom')
pete = Dog.new('Pete')

tom.inhale
tom.greet
tom.speak("It's so lonely here...");
pete.bork
tom.speak('Hey! Want to be friends?');
pete.growl
tom.climb("a tree");
pete.bork;pete.bork;pete.bork;
tom.speak("I guess I'll have to wait for him to go away... In the mean time");
tom.philosophize("philosophize");
tom.domesticate(pete)