#encoding: utf-8
describe "Manage Days" do
  before do
    visit '/'
    click_link "Créer un menu"
    click_button "Générer"
  end

  describe "#create" do
    it "adds a day to the menu" do
      page.should have_content "Jour 1"
      click_link 'Ajouter un jour'
      page.should have_content "Jour 2"
    end

  end
end
