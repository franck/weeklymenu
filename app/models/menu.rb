class Menu < ActiveRecord::Base
  has_many :days, -> { order('position') }

  def generate
    recipes = Recipe.random(5)
    recipes.each do |recipe|
      self.days << Day.create(recipe: recipe)
    end
  end

  def name
    "Menu du #{I18n.l(created_at, format: '%d %B %Y')}"
  end

  def reset!
    self.days.destroy_all
    self.generate
  end
end
