class Tag < ActiveRecord::Base
  has_many :recipes, through: :recipe_tags
  has_many :recipe_tags

  has_many :meals, through: :meal_tags
  has_many :meal_tags

  validates :name, presence: true
end
