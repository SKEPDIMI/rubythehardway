module Func_model
  def generate_luck
    n = rand(100)
    
    return n >= 50 ? -1 : n >= 40 ? 0 : n >= 30 ? 1 : n >= 20 ? 2 : n >= 5 ? 3 : n >= 1 ? 4 : 5
  end
  def toReadableMoney(copper)
    if copper < 100
      return "#{copper} copper"
    end
    silver = copper / 100
    gold = copper / 10000
    platinum = copper / 100000
    case
    when silver > 0 && gold < 1
      return "#{silver} silver"
    when gold > 0 && platinum < 1
      return "#{gold} gold"
    when platinum > 0
      return "#{platinum} platinum"
    end
  end
end