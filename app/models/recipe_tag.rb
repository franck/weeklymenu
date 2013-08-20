class RecipeTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :recipe
  validates_uniqueness_of :tag_id, scope: :recipe_id
end
