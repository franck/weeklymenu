require 'spec_helper'

describe Day do

  describe "#name" do
    it "is based on the position number" do
      menu = create(:menu)
      menu.days.create.name.should == "Jour 1"
      menu.days.create.name.should == "Jour 2"
    end
  end

  describe "#add_meal_with_recipe" do
    let!(:recipe) { create(:recipe) }
    let(:day) { create(:day) }
    it "add a meal" do
      expect{ day.add_meal_with_recipe }.to change { day.meals.size }.by(1)
    end
    it "the added meal as a recipe" do
      day.add_meal_with_recipe
      day.meals.last.recipe.should_not be_nil 
    end
  end

end
