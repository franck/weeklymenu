class MealTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :meal
  validates_uniqueness_of :tag_id, scope: :meal_id
end
