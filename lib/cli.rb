require_relative './concerns.rb'

class Dietologist::CLI 

    attr_reader :meal_hash
   
    include Concerns::InstanceMethods
    extend Concerns::ClassMethods

    def initialize
        @processor = Processor.new
    end

    def start
        puts "       ♦♦♦♦♦♦    Welcome to the Dietologist    ♦♦♦♦♦♦         "
        puts " ♦♦♦ We're going to create a customized diet plan for you ♦♦♦ "
        @processor.bond
        @data = Processor::DATA
        @meal_plan = MealPlan.new(@data[:time_frame], @data[:target_calories], @data[:diet], @data[:exclude])
        @meal_hash = @meal_plan.meal_getter
        meals_info_day(@meal_hash) if @data[:time_frame] == 'day'
        meals_info_week(@meal_hash) if @data[:time_frame] == 'week'
    end
end

