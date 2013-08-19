class Day < ActiveRecord::Base
  belongs_to :menu
  has_many :meals, -> { order('position desc') }

  acts_as_list scope: :menu

  def name
    "Jour #{position}"
  end

end
