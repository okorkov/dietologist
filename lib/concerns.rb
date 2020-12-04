module Concerns

  module InstanceMethods

    def meals_info_day(hash)
      puts "♦♦ Here is a customized menu plan for you based on the information provided ♦♦"
      puts "♦♦♦ calories: #{hash["nutrients"]["calories"]}, protein: #{hash["nutrients"]["protein"]}, fat: #{hash["nutrients"]["fat"]}, carbohydrates: #{hash["nutrients"]['carbohydrates']} ♦♦♦ "
      puts "                       ♦♦ Including #{hash['meals'].size} recipes: ♦♦            "
      meal_position = 1
      hash['meals'].each do |meal|
        puts "♦♦ #{meal_position}. #{meal["title"]} | #{meal["servings"]} serving(s) with cooking time about #{meal['readyInMinutes']} minutes. ♦♦"
        puts ""
        meal_position += 1
      end
      puts "♦♦♦ Which recipe you would like to find out more about? enter a number [1-#{hash['meals'].size}] or type in 'exit' ♦♦♦"
      choose_recipe = gets.chomp.downcase
      meal_index = choose_recipe.to_i - 1
      if choose_recipe != 'exit'&& hash['meals'][meal_index] != nil
        id = hash['meals'][meal_index]['id']
        meal_details(id)
      else
        puts "♦♦♦♦♦♦♦♦♦      Goodbye       ♦♦♦♦♦♦♦♦♦"
      end

    end

    def meals_info_week(hash)
      puts "♦♦♦ We've created a diet plan for you for entire week that includes #{hash['items'].size} recipes ♦♦♦"
      puts ""
      counter = 1
      hash['items'].each do |day|
        values = day['value'].split(/[:,"]/)
        puts "♦♦ [#{counter}.] Day #{day['day']}. #{values[14]} ♦♦"
        counter += 1
      end
      puts "♦♦♦ Which recipe you would like to find out more about? enter a number [1-#{hash['items'].size}] or type in 'exit' ♦♦♦"
      choose_recipe = gets.chomp.downcase
      meal_index = choose_recipe.to_i - 1
      if choose_recipe != 'exit' && hash['items'][meal_index] != nil
        id_splitter = hash['items'][meal_index]['value'].split(/[:,"]/)
        id = id_splitter[3]
        meal_details(id)
      else
        puts "♦♦♦♦♦♦♦♦♦      Goodbye       ♦♦♦♦♦♦♦♦♦"
      end
    end

    def meal_details(id)
      dish = SummarizeRecipe.new(id)
      recipe_info_hash = dish.recipe_getter
      puts "♦♦♦♦♦♦ #{recipe_info_hash['title']} ♦♦♦♦♦♦"
      puts ""
      puts recipe_info_hash['summary']
      puts ""
      puts "♦♦♦ Press 1 to go back, or press 2 to exit ♦♦♦"
      option = gets.chomp.downcase
      if Processor::DATA[:time_frame] == 'day'
        meals_info_day(self.meal_hash) if option == '1'
        puts "♦♦♦♦♦♦♦♦♦      Goodbye       ♦♦♦♦♦♦♦♦♦" if option == '2'
      end
      if Processor::DATA[:time_frame] == 'week'
        meals_info_week(self.meal_hash) if option == '1'
        puts "♦♦♦♦♦♦♦♦♦      Goodbye       ♦♦♦♦♦♦♦♦♦" if option == '2'
      end
    end

	end

  module ClassMethods

    def all
      @@all
    end

	end
	
end
