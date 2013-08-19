class Recipe < ActiveRecord::Base
  def self.random(number=1)
    recipes = []
    while recipes.size < number do 
      offset = rand(Recipe.count)
      recipe = Recipe.offset(offset).first
      recipes << recipe unless recipes.include? recipe
    end
    return recipes.compact
  end
end
