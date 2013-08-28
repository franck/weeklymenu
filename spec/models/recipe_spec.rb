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
    context "with tags constraint" do
      let(:tag1) { create(:tag) }
      let(:tag2) { create(:tag) }
      let!(:recipe1) { create(:recipe) }
      let!(:recipe2) { create(:recipe, tags: [tag1]) }
      let!(:recipe3) { create(:recipe, tags: [tag2]) }
      let!(:recipe4) { create(:recipe, tags: [tag1, tag2]) }
      it "returns all recipes if no tags given" do
        Recipe.random(4).should =~ [recipe1, recipe2, recipe3, recipe4]
        Recipe.random(4, tags: nil).should =~ [recipe1, recipe2, recipe3, recipe4]
        Recipe.random(4, tags: []).should =~ [recipe1, recipe2, recipe3, recipe4]
      end
      it "return recipes with the given tag" do
        Recipe.random(2, tags: [tag1]).should =~ [recipe2, recipe4]
        Recipe.random(2, tags: [tag2]).should =~ [recipe3, recipe4]
      end
      it "returns recipes with the given tags" do
        Recipe.random(1, tags: [tag1, tag2]).should =~ [recipe4]
      end
      it "raises an error if requested number of recipes is less than the tagged recipes" do
        expect { Recipe.random(2, tags: [tag1, tag2]).should =~ [recipe4] }.to raise_error
      end
    end #with tags constraint
    context "with exclude options" do
      let!(:recipe1) { create(:recipe) }
      it "will never return a recipe included in the exclude array" do
        expect { Recipe.random(1, exclude: [recipe1]) }.to raise_error
      end
      context "with a not excluded recipe" do
        let!(:recipe2) { create(:recipe) }
        it "returns only this recipe not excluded" do
          Recipe.random(1, exclude: [recipe1]).should == [recipe2]
        end
      end
    end
  end

  describe "#with_tags" do
    let(:tag1) { create(:tag) }
    let(:tag2) { create(:tag) }
    let!(:recipe1) { create(:recipe) }
    let!(:recipe2) { create(:recipe, tags: [tag1]) }
    let!(:recipe3) { create(:recipe, tags: [tag2]) }
    let!(:recipe4) { create(:recipe, tags: [tag1, tag2]) }
    it "return recipes with the given tags" do
      Recipe.with_tags([tag1]).should =~ [recipe2, recipe4]
      Recipe.with_tags([tag2]).should =~ [recipe3, recipe4]
      Recipe.with_tags([tag1, tag2]).should =~ [recipe4]
    end
  end

end
