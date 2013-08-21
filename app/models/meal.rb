#encoding: utf-8
class Meal < ActiveRecord::Base
  belongs_to :day
  has_one :recipe, through: :meal_recipe
  has_one :meal_recipe, :dependent => :destroy

  has_many :tags, through: :meal_tags
  has_many :meal_tags, :dependent => :destroy

  acts_as_list scope: :day

  def name
    if position == 1
      "Diner"
    else
      "Déjeuner"
    end
  end

  def self.create_with_recipe
    Meal.create(recipe: Recipe.random.first)
  end
end
