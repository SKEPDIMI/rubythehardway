module User
  def initialize(name = 'adventurer')
    @name = name
    @gold = 0
    @fishing_rod_health = 100
    @experience = 0
    @level = 0
  end

  def name
    @name.capitalize
  end
end