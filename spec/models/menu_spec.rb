#encoding: utf-8
require 'spec_helper'

describe Menu do


  describe "#name" do
    it "creates a name based on the creation date" do
      time_now = Time.new(2013, 8, 17, 2, 0, 0)
      Time.stub(:now).and_return(time_now)
      Menu.create.name.should == "Menu du 17 août 2013"
    end
  end

  context "with 5 recipes" do
    before do
      5.times { create(:recipe) }
    end
    describe "#generate" do
      it "adds 5 days with random recipes" do
        menu = Menu.new
        menu.generate
        menu.days.size.should == 5
      end
    end

    describe "#reset!" do
      it "removes all recipes and add some new" do
        menu = Menu.new
        menu.generate
        menu.days.size.should == 5
        menu.reset!
        menu.days.size.should == 5
      end
    end
  end

end
