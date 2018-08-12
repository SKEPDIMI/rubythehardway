require_relative '../util/func'

class Func
  include Func_model
end

module FishingRod_model
  def initialize(controller)
    @controller = controller
    @func = Func.new
    @health = 10
    @power = 5
    @bait = nil
  end

  def launch()

    # Here we look for a random fish
    # Fish have a rarity level from -1 to 5
    # They also have requirement like time or power

    timeOfDay = @controller.timeOfDay
    fish_record = @controller.data_find('fishing_loot');

    x = @func.generate_luck()
    
    available = fish_record.delete_if { |key, value| value['rarity'] > x } # Only fish with a rarity less / equal to our luck

    fish_record = @controller.data_find('fishing_loot');

    available.each do |key, value| # Will filter out our choice based off requirements
      requirements = value['requirements']

      if requirements # If fish has requirements to catch
        if requirements['time'] # If time is a requirement
          if !requirements['time'].include?(timeOfDay) # If we dont have this requirement, delete fish
            available.delete(key)
          end
        end
        if requirements['power'] # If power is a requirement
          if requirements['power'] > @power # if fish has more power than rod
            available.delete(key)
          end # If we dont have enough power, delete fish
        end
      end
    end

    values = available.values
    selected = values[rand(values.size)]
    
    Whirly.start spinner: "clock" do
      Whirly.status = "Adding bait.."
      sleep 3
      Whirly.status = "Throwing line.."
      sleep 3
      Whirly.status = "Patiently waiting.."
      sleep 6
      Whirly.status = "Pulling line.."
      sleep 4
    end

    return selected
  end

  attr_reader :health
end