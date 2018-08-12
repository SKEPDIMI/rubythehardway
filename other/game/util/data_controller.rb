require 'json'

module DataController_model
  def initialize
    @data = {} # This should not be changed after it has been initialized
    Dir[__dir__ + '/../data/*.json'].each do |filepath| # Turns @data into hash of collections based off the data directory
      filename = File.basename(filepath, ".json")
      file = open(filepath)
      @data[filename] = JSON.parse(file.read)
      @data[filename].freeze() # is immutable
    end
  end

  def findById(collection, id)
    data = @data[collection].dup

    data.each do |key, value|
      if key === id
        return value
      end
    end

    return {}
  end

  def findOne(collection, q = {})
    data = @data[collection].dup
    if q == {}
      data.each do |key, value|
        value['_ref'] = collection
        value['_id'] = key
      end
      return data
    end

    data.each do |id, data|
      match = false
      q.keys.each do |key| # For each key in query
        if data[key] == q[key] # If the query[key] is == to the data[key]
          match = true
        else
          match = false
          break
        end
      end
      if match
        data['_ref'] = collection
        data['_id'] = id
        return data
      end
    end

    return {}
  end

  def find(collection, q = {})
    data = @data[collection].dup

    if q == {}
      data.each do |key, value|
        value['_ref'] = collection
        value['_id'] = key
      end
      return data
    end
    results = {}

    data[collection].each do |id, data|
      match = false
      q.keys.each do |key| # For each key in query
        if data[key] == q[key] # If the query[key] is == to the data[key]
          match = true
        else
          match = false
          break
        end
      end
      if match
        data['_id'] = id
        data['_ref'] = collection
        results[id] = data
      end
    end

    return results
  end

  def populate(array)
    populated_array = []
    array.each do |item|
      # find id that matches in @data and add it to p_array

      p_item = findById(item['_ref'], item['_id'])
      populated_array << p_item
    end

    return populated_array
  end
end