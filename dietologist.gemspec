require_relative 'lib/dietologist/version'

require_relative './lib/dietologist/version'

Gem::Specification.new do |s|
  s.name        = 'dietologist'
  s.version     = Dietologist::VERSION
  s.date        = '2020-12-01'
  s.summary     = "Custom Diet Plans"
  s.description = "Creates a customized diet plan based on your dietary restrictions or allergies"
  s.authors     = ["Alex Okarkau"]
  s.email       = 'aokarkau@gmail.com'
  s.files       = ["lib/cli.rb", "lib/concerns.rb", "lib/dietologist.rb", "lib/meal-plan.rb", "lib/processor.rb", "lib/summarize-recipe.rb","config/environment.rb"]
  s.homepage    = 'http://rubygems.org/gems/dietologist'
  s.license     = 'MIT'
  s.executables << 'dietologist'

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", ">= 0"
  s.add_development_dependency "nokogiri", ">= 0"
  s.add_development_dependency "pry", ">= 0"
end
