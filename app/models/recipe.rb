require 'include_more_than'

class Recipe < ActiveRecord::Base
  has_many :tags, through: :recipe_tags
  has_many :recipe_tags, :dependent => :destroy


  def self.random(number=1, options={})
    default_options = { duplicates_number: 0 }
    options = default_options.merge(options)
    recipes = []
    while recipes.size < number do 
      offset = rand(Recipe.count)
      recipe = Recipe.offset(offset).first
      recipes << recipe unless recipes.include_more_than? recipe, options[:duplicates_number]
    end
    return recipes.compact
  end
end
