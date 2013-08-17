class Menu < ActiveRecord::Base
  has_many :recipes

  def generate
    5.times do
      self.recipes << Recipe.random
    end
  end

  def name
    "Menu du #{I18n.l(created_at, format: '%d %B %Y')}"
  end
end
