#encoding: utf-8
describe "Manage Days" do
  before do
    visit '/'
    click_link "Créer un menu"
    select "2", from: "menu_nb_meals_per_day"
    click_button "Générer"
  end

  describe "#create" do
    it "adds a day to the menu" do
      page.should have_content "Jour 1"
      click_link 'Ajouter un jour'
      page.should have_content "Jour 2"
      within("#day-2") do
        page.should have_content "Déjeuner"
        page.should have_content "Diner"
      end
    end
  end

  describe "#destroy" do
    it "remove a day from the menu" do
      first('.remove-day').click 
      page.should have_no_content "Jour 1"
      page.should have_no_content "Diner"
    end
  end
end
