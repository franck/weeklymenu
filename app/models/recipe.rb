class Recipe < ActiveRecord::Base
  belongs_to :menu

  def self.random
    offset = rand(Recipe.count)
    Recipe.offset(offset).first
  end
end
