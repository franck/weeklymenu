class Menu < ActiveRecord::Base
  has_many :days, -> { order('position') }
  
  validates :nb_days, presence: true
  validates :nb_meals_per_day, presence: true

  def generate
    recipes_number = self.nb_days * self.nb_meals_per_day
    recipes = Recipe.random(recipes_number, duplicates_number: 2)
    nb_days.times.each do
      day = Day.create
      meals = []
      nb_meals_per_day.times.each do
        day.meals << Meal.create(recipe: recipes.delete_at(0))
      end
      self.days << day
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
