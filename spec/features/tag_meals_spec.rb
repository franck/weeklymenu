require 'spec_helper'

describe "Tag meals" do
  let!(:tag) { create(:tag) }
  let(:meal) { create(:meal) }
  let(:day) { create(:day, meals: [meal]) }
  let!(:menu) { create(:menu, days: [day]) }

  before do
    visit '/'
    click_link menu.name
  end

  describe "drag and drop a tag to a meal", js: true do
    before do
      @source = page.find("#tag-#{tag.id}")
      @target = page.find("#meal-#{meal.id}")
      @source.drag_to(@target)
    end
    it "add the tag to the meal" do
      page.find("#meal-#{meal.id}").should have_content tag.name
    end
    it "add the tag event after a page reload" do
      click_link "Menus"
      click_link menu.name
      page.find("#meal-#{meal.id}").should have_content tag.name
    end
  end

  context "with a meal already tagged", js: true do
    let(:meal) { create(:meal, tags: [tag]) }
    let(:day) { create(:day, meals: [meal]) }
    let(:menu) { create(:menu, days: [day]) }
    before do
      visit '/'
      click_link menu.name
    end
    it "remove the tag from the meal" do
      page.find("#meal-#{meal.id}").find("#tag-#{tag.id}").click
      page.find("#meal-#{meal.id}").should have_no_content tag.name
    end
    it "removes the tag even after a page reload" do
      page.find("#meal-#{meal.id}").find("#tag-#{tag.id}").click
      click_link "Menu"
      click_link menu.name
      page.find("#meal-#{meal.id}").should have_no_content tag.name
    end
  end
end
