#encoding: utf-8
require 'spec_helper'

describe "Menu:" do
  let!(:recipe) { create(:recipe) }
  before do
    4.times { create(:recipe) }
  end

  describe "#create" do
    before do
      visit '/'
      stub_time(2013, 8, 17, 2, 0, 0)
      click_link 'Créer un menu'
    end
    it "generate a Menu for 5 days" do
      page.should have_content recipe.name
    end
    it "shows the menu in the index page" do
      click_link "Menus"
      page.should have_content "Menu du 17 août 2013"
    end
  end

  context "with a menu" do
    let!(:menu) { create(:menu, recipes: [recipe]) }
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
        page.should have_content recipe.name
        page.should have_content "Nouvelles recettes"
      end
    end
  end



end
