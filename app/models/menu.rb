class Menu < ActiveRecord::Base
  has_many :recipes, through: :menu_recipe
  has_many :menu_recipe

  def generate
    while(self.recipes.size < 5) do
      recipe = Recipe.random
      logger.debug("RECIPE: #{recipe.name}")
      self.recipes << recipe unless self.recipes.include? recipe
    end
  end

  def name
    "Menu du #{I18n.l(created_at, format: '%d %B %Y')}"
  end

  def reset!
    self.recipes.delete_all
    self.generate
  end
end
