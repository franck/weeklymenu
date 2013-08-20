#encoding: utf-8
require 'spec_helper'

describe "Tags" do

  describe "#create" do
    it "add a tag" do
      visit '/'
      click_link "Filtres"
      click_link "Ajouter un filtre"
      fill_in 'tag_name', with: 'Végétarien'
      click_button 'Enregistrer'
      page.should have_content "Végétarien"
    end
  end

  context "with a tag" do
    let!(:tag) { create(:tag) }
    describe "#destroy" do
      it "remove the tag" do
        visit '/'
        click_link 'Filtres'
        first('.remove-tag').click
        page.should have_no_content tag.name
      end
    end
  end


end
