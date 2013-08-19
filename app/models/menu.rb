class Menu < ActiveRecord::Base
  has_many :days, -> { order('position') }

  def generate
    recipes = Recipe.random(nb_days * nb_meals_per_day, duplicates_number: 2)
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

  def nb_days
    5
  end

  def nb_meals_per_day
    2
  end

  def reset!
    self.days.destroy_all
    self.generate
  end
end
