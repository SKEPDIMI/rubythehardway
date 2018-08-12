require_relative "../npcs/city/Snapper"

class NPC
  def initialize(controller)
    @controller = controller
  end
  def greet
    puts "THIS NPC HAS NOT BEEN CONFIGURED YET"
  end
  def goodbye
    puts "THIS NPC HAS NOT BEEN CONFIGURED YET"
  end
end

class Snapper < NPC
  include Snapper_model
end

module NPCs_model
  def initialize(controller)
    @@npcs = {
      '_SNAPPER' => Snapper.new(controller),
    }
    @controller = controller
  end

  def get(id)
    return @@npcs[id]
  end
end