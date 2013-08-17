#encoding: utf-8
require 'spec_helper'

describe "Menu:" do

  describe "#create" do
    let!(:recipe) { create(:recipe) }
    it "generate a Menu for 5 days" do
      visit '/'
      click_link 'Créer un menu'
      page.should have_content recipe.name
    end
  end


end
