#encoding: utf-8
require 'spec_helper'

describe "Menu:" do
  let!(:recipe) { create(:recipe) }
  before do
    9.times { create(:recipe) }
  end

  describe "#create" do
    before do
      visit '/'
      stub_time(2013, 8, 17, 2, 0, 0)
      click_link 'Créer un menu'
      select "5", from: "menu_nb_days"
      select "2", from: "menu_nb_meals_per_day"
      click_button "Générer"
    end
    it "generate a Menu for 5 days and 2 meals per day" do
      page.should have_content "Jour 1"
      page.should have_content "Déjeuner"
      page.should have_content "Diner"
      page.should have_content "Jour 2"
    end
    it "shows the menu in the index page" do
      click_link "Menus"
      page.should have_content "Menu du 17 août 2013"
    end
  end

  context "with a menu" do
    let(:meal) { create(:meal, recipe: recipe) }
    let(:day) { create(:day, meals: [meal]) }
    let!(:menu) { create(:menu, days: [day], nb_days: 5, nb_meals_per_day: 2) }
    before do
      visit '/'
    end
    describe "#show" do
      it "shows recipes of this menu" do
        click_link menu.name
        page.should have_content recipe.name
      end
    end
    describe "#destroy" do
      it "remove the menu" do
        click_link 'supprimer'
        page.should have_no_content menu.name
      end
    end

    describe "#reset" do
      it "picks new recipes" do
        click_link menu.name
        click_link 'Recommencer'
        page.should have_content "Jour 1"
      end
    end
  end



end
