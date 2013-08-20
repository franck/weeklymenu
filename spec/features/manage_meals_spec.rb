require 'spec_helper'

describe "Manage Meals:" do

  context "with a menu and a day" do
    let(:day) { create(:day) }
    let!(:menu) { create(:menu, days: [day]) }
    before { visit '/' }

    context "if no meal" do
      it "shows the add meal link" do
        click_link menu.name
        page.should have_content "Ajouter un repas"
      end
    end
    context "if one meal" do
      let!(:meal) { create(:meal, day: day) }
      it "shows the add meal link" do
        click_link menu.name
        page.should have_content "Ajouter un repas"
      end
      context "when I click on delete meal link" do
        it "remove the meal" do
          click_link menu.name
          find('.remove-meal').click
          page.should have_no_content "Diner"
        end
      end
    end
    context "if two meals" do
      let!(:meal1) { create(:meal, day: day) }
      let!(:meal2) { create(:meal, day: day) }
      it "does not show the add meal link" do
        click_link menu.name
        page.should have_no_content "Ajouter un repas"
      end
      context "when I click on delete meal link" do
        it "remove the meal" do
          click_link menu.name
          first('.remove-meal').click
          page.should have_no_content "Dejeuner"
          page.should have_content "Diner"
        end
        it "shows the add meal link" do
          click_link menu.name
          first('.remove-meal').click
          page.should have_content "Ajouter un repas"
        end
      end
    end

    context "when I click on add meal link" do
      let!(:recipe) { create(:recipe) }
      it "add a meal with a recipe" do
        click_link menu.name
        click_link "Ajouter un repas"
        page.should have_content "Diner"
        page.should have_content recipe.name
      end
    end
  end


end
