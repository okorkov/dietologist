class MealPlan

    extend Concerns::ClassMethods

    attr_reader :meal_hash

    @@all = []

    def initialize(time_frame, target_calories, diet, exclude)
        @time_frame = time_frame
        @target_calories = target_calories
        @diet = diet
        @exclude = exclude
        @@all << self
    end

    def meal_getter
        @exclude_string = ""
        @exclude.each {|item| @exclude_string += "#{item}%2C%20"}
        url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/mealplans/generate?timeFrame=#{@time_frame}&targetCalories=#{@target_calories}&diet=#{@diet}&exclude=#{@exclude_string}")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-key"] = ENV["X_RAPIDAPI_KEY"] #to obtain API key click on the link below
        #https://rapidapi.com/spoonacular/api/recipe-food-nutrition/endpoints 
        request["x-rapidapi-host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

        response = http.request(request)
        @meal_hash = JSON.parse(response.body)
        @meal_hash
    end

end