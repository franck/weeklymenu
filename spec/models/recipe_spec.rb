require 'spec_helper'

describe Recipe do

  describe "#random" do
    context "without a recipe" do
      it "returns emty array" do
        Recipe.random.should == []
        Recipe.random(1).should == []
      end
    end
    context "with at least a recipe" do
      let!(:recipe1) { create(:recipe) }
      let!(:recipe2) { create(:recipe) }
      it "pick a random recipe" do
        recipe1 = Recipe.random
        recipe1.should be_an_instance_of Array
      end
      it "picks two different recipes if asked for 2 recipes and with 0 duplicates" do
        Recipe.random(2, duplicates_number: 0).should =~ [recipe1, recipe2]
      end
    end
  end
end
