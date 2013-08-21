class Day < ActiveRecord::Base
  belongs_to :menu
  has_many :meals, -> { order('position desc') }, :dependent => :destroy

  acts_as_list scope: :menu

  def name
    "Jour #{position}"
  end

  def add_meal_with_recipe
    self.meals << Meal.create_with_recipe
  end

  def reset!
    logger.debug("DEBUG DAY")
    logger.debug("MEALS: #{self.meals.size}")
    self.meals.each do |meal|
      logger.debug("MEAL: #{meal.id}")
      meal.reset!
    end
    save
  end

end
