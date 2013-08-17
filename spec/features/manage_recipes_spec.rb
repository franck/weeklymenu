require 'spec_helper'

describe "Manage recipes:" do

  describe "#create" do
    it "add a recipe" do
      visit '/'
      click_link 'Recettes'
      click_link 'Ajouter une recette'
      fill_in 'recipe_name', with: 'Steak tartare'
      click_button 'Enregistrer'
      page.should have_content 'Steak tartare'
    end
  end

  describe "#update" do
    let!(:recipe) { create(:recipe) }
    it "edit the recipe" do
      visit '/'
      click_link 'Recettes'
      click_link "modifier"
      fill_in 'recipe_name', with: "Saumon riz gluant"
      click_button "Enregistrer"
      page.should have_content "Saumon riz gluant"
      page.should have_no_content recipe.name
    end
  end

end
