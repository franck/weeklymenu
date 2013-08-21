class Menu < ActiveRecord::Base
  has_many :days, -> { order('position') }, :dependent => :destroy
  
  validates :nb_days, presence: true
  validates :nb_meals_per_day, presence: true

  def generate(options={})
    default_options = { duplicates_number: 2 }
    options = default_options.merge(options)
    recipes_number = self.nb_days * self.nb_meals_per_day
    recipes = Recipe.random(recipes_number, duplicates_number: options[:duplicates_number])
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

  def add_day!
    day = Day.create(menu: self)
    day.move_to_bottom
    nb_meals_per_day.times do
      day.add_meal_with_recipe
    end
    self.nb_days += 1
    self.save
  end

  def remove_day!(day)
    d = self.days.find(day)
    d.destroy
    self.nb_days -= 1
    self.save
  end

  def reset!
    self.days.destroy_all
    self.generate
  end
end
