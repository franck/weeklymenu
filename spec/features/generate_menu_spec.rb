#encoding: utf-8
require 'spec_helper'

describe "Menu:" do

  describe "#create" do
    let!(:recipe) { create(:recipe) }
    before do
      visit '/'
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
    let!(:recipe) { create(:recipe) }
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
  end



end
