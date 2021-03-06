require 'include_more_than'

class Recipe < ActiveRecord::Base
  has_many :tags, through: :recipe_tags
  has_many :recipe_tags, :dependent => :destroy

  scope :with_tags, ->(tags) { includes(:tags).where(tags: { id: tags.map(&:id) }).group('recipes.id').having("COUNT('recipes.id') = #{tags.size}").references(:tags) }


  def self.random(number=1, options={})
    default_options = { duplicates_number: 0 }
    options = default_options.merge(options)
    recipes = []
    watchdog = 0
    while recipes.size < number do 
      watchdog += 1
      raise "not enough recipes" if watchdog > number*5
      # TAGS
      if options[:tags] && options[:tags].any?
        recipes_number = Recipe.with_tags(options[:tags]).to_a.size
        raise "not enough recipes" if recipes_number < number
        offset = rand(recipes_number)
        recipe = Recipe.with_tags(options[:tags]).offset(offset).first
      else
        offset = rand(Recipe.count)
        recipe = Recipe.offset(offset).first
      end

      # recipe in the exclude array ?
      if options[:exclude] && options[:exclude].include?(recipe)
        next
      end

      # recipe already in the result array ?
      if recipes.include_more_than? recipe, options[:duplicates_number]
        next
      end

      recipes << recipe
    end
    return recipes.compact
  end

end
