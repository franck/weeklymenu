require 'spec_helper'

describe Meal do

  describe "#create_with_recipe" do
    let!(:recipe) { create(:recipe) }
    it "create a meal with a random recipe" do
      Meal.create_with_recipe.recipe.should_not be_nil
    end
  end
end
