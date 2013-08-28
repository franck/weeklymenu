require 'spec_helper'

describe Meal do

  describe "#create_with_recipe" do
    let!(:recipe) { create(:recipe) }
    it "create a meal with a random recipe" do
      Meal.create_with_recipe.recipe.should_not be_nil
    end
  end


  describe "#change_recipe" do
    let!(:recipe1) { create(:recipe) }
    let!(:recipe2) { create(:recipe) }
    let!(:meal) { create(:meal, recipe: recipe1) }
    it "change the recipe with a random one" do
      meal.change_recipe.should == recipe2
    end
  end
end
