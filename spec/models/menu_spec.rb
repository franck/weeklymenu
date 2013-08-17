#encoding: utf-8
require 'spec_helper'

describe Menu do

  describe "#generate" do
    let!(:recipe) { create(:recipe) }
    it "adds 5 random recipes" do
      menu = Menu.new
      menu.generate
      menu.recipes.size.should == 5
    end
  end

  describe "#name" do
    it "creates a name based on the creation date" do
      time_now = Time.parse("2013-08-17")
      Menu.stub(:created_at).and_return(time_now)
      Menu.create.name.should == "Menu du 17 août 2013"
    end
  end

end
