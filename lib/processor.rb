class Processor

	DATA = {}

  def bond
    self.time_frame
    self.target_calories
    self.diet
    self.exclude
  end

  def time_frame
    puts "           ♦♦ What is a time frame for your diet? ♦♦          "
    puts "                 ♦♦ 1. Day       2. Week ♦♦       [1/2]       "
    time_frame = gets.chomp.downcase
  	if time_frame == '1'
      DATA[:time_frame] = 'day'
  	elsif time_frame == '2'
      DATA[:time_frame] = 'week'
  	else
      puts "♦♦ Please enter 1 to choose a 'day' or 2 for a 'week' ♦♦"
      self.time_frame
		end
  end

  def target_calories
    if DATA[:time_frame] == 'day'
      puts "♦♦ What is your daily target calories, please type in [500-3000] ♦♦"
      target_calories = gets.chomp.downcase
      self.target_calories if target_calories.to_i > 3000 || target_calories.to_i < 500
      DATA[:target_calories] = target_calories.to_i
    end

    if DATA[:time_frame] == 'week'
      puts "♦♦ What is your weekly target calories, please type in [3000-21000] ♦♦"
      target_calories = gets.chomp.downcase
      self.target_calories if target_calories.to_i > 21000 || target_calories.to_i < 3000
      DATA[:target_calories] = target_calories.to_i
    end
  end

  def diet
    puts "                         ♦♦ Do you have a diet preference? ♦♦                         "
    puts "♦♦ 1. none  2. vegeterian  3. pescaterian  4. vegan  [type in if other than listed] ♦♦"
    diet = gets.chomp.downcase
    case diet
    when '1'
      DATA[:diet] = ''
    when '2'
      DATA[:diet] = 'vegeterian'
    when '3'
      DATA[:diet] = 'pescaterian'
    when '4'
      DATA[:diet] = 'vegan'
    else
      DATA[:diet] = diet.split(' ').join('')
    end
  end

  def exclude
    puts "♦♦ Are you allergic to anything or there is a certain items you would like us to exclude? ♦♦"
    puts "                      ♦♦ Please list those items or type in 'none' ♦♦                     "
    exclude_input = gets.chomp.downcase
    exclude_input = exclude_input.split(' ')
    DATA[:exclude] = exclude_input
  end
end