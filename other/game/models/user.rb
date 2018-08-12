require_relative 'rod'

class FishingRod
  include FishingRod_model
end

module User
  def initialize(controller, name = 'adventurer')
    @name = name
    @money = 0
    @fishing_rod = FishingRod.new(controller)
    @inventory = [ # FOR TESTING ONLY. THIS SHOULD BE EMPTY
      {'_ref' => 'fishing_loot', '_id' => "a8"},
      {'_ref' => 'fishing_loot', '_id' => "a5"}
    ]
    @xp = 0
    @level = 0
  end

  def name
    @name.capitalize
  end

  attr_accessor :name, :money, :fishing_rod, :xp, :level, :inventory
end