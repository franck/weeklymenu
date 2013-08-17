require 'spec_helper'

describe Recipe do

  describe "#random" do
    context "without a recipe" do
      it "returns nil" do
        Recipe.random.should be_nil
      end
    end
    context "with at least a recipe" do
      let!(:recipe1) { create(:recipe) }
      it "pick a random recipe" do
        recipe1 = Recipe.random
        recipe1.should be_an_instance_of Recipe
      end
    end
  end
end
