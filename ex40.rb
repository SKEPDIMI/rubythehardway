# Modules!

require "./other/modules/fruits.rb";
MyFruits.apple

# Classes!

class MyStuff
  def initialize()
    # @ === this
    @tangerine = MyFruits::TANGERINE
  end

  attr_reader :tangerine

  def apple()
    MyFruits.apple
  end
end

myStuffs = MyStuff.new
myStuffs.apple
puts myStuffs.tangerine

# Now an example

class Song
  def initialize(name, author, lyrics)
    @name, @author, @lyrics = name, author, lyrics
  end

  def play()
    puts "\n NOW PLAYING \"#@name\" by \"#{@author['name']}\":\n" 
    puts "\n #@lyrics"
  end
end

playlist = [];

playlist << Song.new(
  "I know its over",
  {'name' => 'The Smiths'},
  "OOO Mother I can feel \n The soil falling over my head..."
);

playlist << Song.new(
  "Nightcall",
  {'name' => 'Kavinsky'},
  "I'm giving you a nightcall to tell you how I feel \n I want to drive you through the night down the hills"
);

playlist << Song.new(
  "Instant Crush",
  {'name' => 'Daft Punk'},
  "I didn't want to be the one to forget \n I thought of everything I'd ever regret"
);

playlist.each do |song|
  puts "-" * 10
  song.play
end

# More examples here
class Y
  def initialize()
    @k = 'Master_class'
  end
  def rule()
    if(@k === 'Master_class')
      puts "I am the master"
    else
      puts "You cannot rule"
    end
  end
  def A()
    i = 0
    begin
      puts "A"
      i += 0.5
    end while i < 3
  end
end

class X < Y
  def initialize(j = 'Slave_class')
    @k = j === 'Master_class' ? 'Slave_class' : j
  end
  def N(j)
    puts "N#{j}"
  end
  def _is_(x)
    @k = x
  end
end

foo = X.
      new();

foo.
N('OOOO');

foo.
_is_('Master_class');

foo.rule

foo.A