class Recipe < ActiveRecord::Base
  def self.random(number=1, options={})
    default_options = { uniq: false }
    options = default_options.merge(options)
    recipes = []
    while recipes.size < number do 
      offset = rand(Recipe.count)
      recipe = Recipe.offset(offset).first
      if options[:uniq] == true
        recipes << recipe unless recipes.include? recipe
      else
        recipes << recipe
      end
    end
    return recipes.compact
  end
end
