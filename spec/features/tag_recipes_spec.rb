require 'spec_helper'

describe "Tag recipes:" do
  let!(:recipe) { create(:recipe) }
  let!(:tag) { create(:tag) }

  before do
    visit '/'
    click_link "Recettes"
  end

  describe "drag and drop a tag into a recipe", js: true do
    before do
      source = page.find("#tag-#{tag.id}")
      target = page.find("#recipe-#{recipe.id}")
      source.drag_to(target)
    end
    it "associates the tag to the recipe" do
      within("#recipe-#{recipe.id}") do
        page.should have_content tag.name
      end
    end
    it "associates the tag after page reload" do
      click_link "Recettes"
      within("#recipe-#{recipe.id}") do
        page.should have_content tag.name
      end
    end
    it "does not associates the tag to the recipe if already present" do
      source = page.find("#tags").find("#tag-#{tag.id}")
      target = page.find("#recipe-#{recipe.id}")
      source.drag_to(target)
      within("#recipe-#{recipe.id}") do
        page.should have_content tag.name
        page.should have_no_content "#{tag.name} #{tag.name}"
      end
    end
  end

  describe "remove tag", js: true do
    let!(:recipe2) { create(:recipe, tags: [tag]) }
    before do
      click_link "Recettes"
    end
    it "remove the tag from the recipe" do
      page.find("#recipe-#{recipe2.id}").find("#tag-#{tag.id}").click
      within("#recipe-#{recipe2.id}") do
        page.should have_no_content tag.name
      end
    end
    it "removes the tag even after a page reload" do
      page.find("#recipe-#{recipe2.id}").find("#tag-#{tag.id}").click
      click_link "Recettes"
      within("#recipe-#{recipe2.id}") do
        page.should have_no_content tag.name
      end
    end
  end
  

end
