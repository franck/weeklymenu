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
    Meal.create(recipe: Recipe.random(1).first)
  end

  def change_recipe
    current_recipe = self.recipe
    self.recipe = Recipe.random(1, tags: self.tags, exclude: [current_recipe]).first
  end

  def reset!
    self.recipe = Recipe.random(1, tags: self.tags).first
    save
  end
end
