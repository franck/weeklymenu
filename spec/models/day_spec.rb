require 'spec_helper'

describe Day do

  describe "#name" do
    it "is based on the position number" do
      menu = create(:menu)
      menu.days.create.name.should == "Jour 1"
      menu.days.create.name.should == "Jour 2"
    end
  end

end
