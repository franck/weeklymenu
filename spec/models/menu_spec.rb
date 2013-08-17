require 'spec_helper'

describe Menu do

  describe "#generate" do
    it "adds 5 random recipes" do
      menu = Menu.new
      menu.generate
      menu.recipes.size.should == 5
    end
  end

end
