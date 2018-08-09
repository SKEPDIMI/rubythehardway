# Class inheritance / Composition
## MOST OF THE USES OF INHERITANCE CAN BE SIMPLIFIED OR REPLACED WITH COMPOSITION

# Inheritance
## The problem with inheritance is that sometimes you want the child to behave differently!

class Parent
  def implicit
    puts "Parent implicit!"
  end
  def override
    puts "Parent override!"
  end
  def altered
    puts "Parent altered!"
  end
end

class Child < Parent
  # i will inherit implicitly!
end

normal_child = Child.new
normal_child.implicit

# Override

class OverrideChild < Parent
  def override
    puts "Child override!"
  end
end

override_child = OverrideChild.new
override_child.override

# The third way to use inheritance is to the keyword super
class AlterChild < Parent
  def implicit
    puts "Alter!"
    super
    puts "Alter!"
  end
end

alter_child = AlterChild.new
alter_child.implicit

# All three together

class CompleteChild < Parent
  def override
    puts "Child override!"
  end
  def altered
    puts "Child altered!"
    super
    puts "Child altered!"
  end
end

complete = CompleteChild.new
complete.implicit
complete.override
complete.altered

## Using super with initialize

class SuperChild < Parent
  def initialize(stuff)
    @stuff = stuff
    super
  end
end

# Modules
## Use composition to package up code into modules
## User inheritance only when there are clearly related reusable pieces of code that fit into a single common concept

module Other
  def override()
    puts "other override"
  end
  def implicit()
    puts "other implicit"
  end
  def Other.altered()
    puts "other altered"
  end
end

class OtherChild
  include Other
  def override
    puts "Child other override"
  end
  def altered
    puts "Child other altered"
  end
end

other_child = OtherChild.new
other_child.implicit