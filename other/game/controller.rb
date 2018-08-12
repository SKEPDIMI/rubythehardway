require_relative 'util/data_controller'

class DataController
  include DataController_model
end

module Controller
  def initialize(game_data)
    @game_data = game_data
    @data_controller = DataController.new
    @connected = {}
  end
  def connect(agent, name)
    @connected[name] = agent
  end
  def at(name)
    return @connected[name]
  end
  def getData(prop)
    return @game_data[prop]
  end
  def setData(prop, value)
    @game_data[prop] = value
  end
  def addTime(seconds = 0) # Changes from real life seconds to game hours / days
    # 8.64 seconds in a day
    # 1 second in game time is 0.0001
    # 1 real second is 70% times faster in game

    seconds_in_day = 86400
    game_time_factor = 0.00017 #0.0001 (1 game sec) * 1.7 (70%)
    seconds_in_game_day = seconds_in_day * game_time_factor

    game_seconds = (seconds * game_time_factor) # Game seconds are %70 faster
    days_passed = (game_seconds * seconds_in_game_day).floor

    @game_data['time'] += game_seconds % seconds_in_game_day
    @game_data['days'] = (@game_data['time'] / 24).floor
  end
  def timeOfDay
    time = @game_data['time']
    case
    when time >= 23 && time <= 1 # 10PM - 1AM
      return 'midnight'
    when time >= 1 && time <= 11 # 1AM - 11AM
      return 'morning'
    when time >= 11 && time <= 13 # 11AM - 1PM
      return 'midday'
    when time >= 13 && time <= 18 # 1PM - 6PM
      return 'afternoon'
    when time >= 18 && time <= 23 # 6PM - 10PM
      return 'night'
    end
  end
  def addToInventory(item)
    if (item['type'] === '_money')
      @game_data['user'].money += item.price
    else
      inventory = @game_data['user'].inventory
      if inventory.length < 50
        @game_data['user'].inventory << {'_ref' => item['_ref'], '_id' => item['_id']}
      else
        response = @connected['console'].prompt("YOUR INVENTORY IS FULL! Would you like to make space or discard item?", [
          'Yes',
          'No'
        ])
        if response == 1
          deleted = @connected['console'].deleteFromInventory

          if deleted
            @game_data['user'].inventory << {'_ref' => item['_ref'], '_id' => item['_id']}
            @connected['console'].display("Saved item in inventory!")
          end
        end
      end
    end
  end
  def getInventoryPopulated
    u_inventory = (@game_data['user'].inventory).dup
    i_inventory = @data_controller.populate(u_inventory) # populated inventory

    return i_inventory
  end
  def addMoney(m)
    @game_data['user'].money += m
  end
  def deleteOneFromInventory(item)
    _inventory = @game_data['user'].inventory

    _inventory.each_with_index do |x, i|
      if x['_id'] === item['_id']
        _inventory.delete_at(i)
        break
      end
    end
  end
  def data_findOne(collection, q = {})
    return @data_controller.findOne(collection, q)
  end
  def data_findById(collection, id)
    return @data_controller.findById(collection, id)
  end
  def data_find(collection, q = {})
    return @data_controller.find(collection, q)
  end
end