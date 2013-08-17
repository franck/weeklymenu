class Menu < ActiveRecord::Base
  has_many :recipes

  def generate
    5.times do
      self.recipes << Recipe.random
    end
  end
end
