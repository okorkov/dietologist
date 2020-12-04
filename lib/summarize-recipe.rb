class SummarizeRecipe

  extend Concerns::ClassMethods

  attr_reader :recipe_summury

  @@all = []
    
  def initialize(id)
  	@id = id
  	@@all << self
  end

  def recipe_getter
  	url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/#{@id}/summary")

  	http = Net::HTTP.new(url.host, url.port)
  	http.use_ssl = true
  	http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  	request = Net::HTTP::Get.new(url)
  	request["x-rapidapi-key"] = ENV["X_RAPIDAPI_KEY"] #to obtain API key click on the link below
  	#https://rapidapi.com/spoonacular/api/recipe-food-nutrition/endpoints 
  	request["x-rapidapi-host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'

  	response = http.request(request)
  	@recipe_summury = JSON.parse(response.body)

  	@recipe_summury["summary"].gsub!('<b>', '') 
  	@recipe_summury["summary"].gsub!('</b>', '')
  	@recipe_summury["summary"].gsub!('<a href=', '')
  	@recipe_summury["summary"].gsub!('</a>', '')
  	@recipe_summury
  end

end