#encoding: utf-8
require 'spec_helper'

describe Menu do

  it "create the menu if everything is OK" do
    Menu.new(nb_days: 5, nb_meals_per_day: 2).should be_valid
  end

  it "raises an error if nb_days is missing" do
    Menu.new(nb_days: '', nb_meals_per_day: 2).should_not be_valid
  end

  it "raises an error if nb_meals_per_day is missing" do 
    Menu.new(nb_days: '5', nb_meals_per_day: '').should_not be_valid
  end

  describe "#name" do
    it "creates a name based on the creation date" do
      time_now = Time.new(2013, 8, 17, 2, 0, 0)
      Time.stub(:now).and_return(time_now)
      Menu.create(nb_days: 1, nb_meals_per_day: 1).name.should == "Menu du 17 août 2013"
    end
  end

  context "with 10 recipes" do
    before do
      10.times { create(:recipe) }
    end
    describe "#generate" do
      it "adds 5 days with random recipes" do
        menu = Menu.new(nb_days: 5, nb_meals_per_day: 2)
        menu.generate
        menu.days.size.should == 5
      end
      it "adds 2 meals per days" do
        menu = Menu.new(nb_days: 5, nb_meals_per_day: 2)
        menu.generate
        menu.days.each do |day|
          day.meals.size.should == 2
        end
      end
    end

    describe "#reset!" do
      it "removes all recipes and add some new" do
        menu = Menu.new(nb_days: 5, nb_meals_per_day: 2)
        menu.generate
        menu.days.size.should == 5
        menu.reset!
        menu.days.size.should == 5
      end
    end
  end

end
