module Snapper_model
  def initialize(controller)
    @@name = "Snapper the fish merchant"
    @@greetings = [
      'Get yer fish half the price when you'
    ]
    @@goodbyes = [
      "Goodbye!"
    ]
    @controller = controller
  end
  def greet
    @controller.at('console').dialogue(@@name, @@greetings[rand(0..@@greetings.length-1)])
  end
  def goodbye
    @controller.at('console').dialogue(@@name, @@goodbyes[rand(0..@@greetings.length-1)])
  end
  def business
    response = @controller.at('console').prompt('What business do you seek today?', [
      'Sell fish',
      'Buy fish',
      'None'
    ]);

    if response == 1 # We want to sell to Snapper
      sell = true
      while sell == true
        @controller.at('console').clearScreen()
        item = @controller.at('console').getFromInventory()
        @controller.at('console').clearScreen()

        if !item
          sell = false
          goodbye()
        else
          puts "SOLD #{item['name']}"
          
          @controller.addMoney(item['price']);
          @controller.deleteOneFromInventory(item);

          response = @controller.at('console').prompt('Sell again?', ['Yes', 'No'])
          if response == 2
            sell = false
            goodbye()
          end
        end
      end
    elsif response == 2 # We want to buy from Snapper
      buy = true
      while buy == true
        @controller.at('console').clearScreen()
        # @npc_snapper.buy
        # FOR TESTING:
        @controller.addToInventory({'_id' => 'a1'})
        @controller.at('console').display('Bought gold fish! Awesome!')
        response = @controller.at('console').prompt('Buy again?', ['Yes', 'No'])
        if response == 2
          buy = false
          # @npc_snapper.goodbye
        end
      end
    elsif response == 3
      # @npc_snapper.goobye
    end
  end
end
