class Day < ActiveRecord::Base
  belongs_to :menu
  has_one :recipe, through: :day_recipe
  has_one :day_recipe, :dependent => :destroy

  acts_as_list scope: :menu

  def name
    "Jour #{position}"
  end

end
