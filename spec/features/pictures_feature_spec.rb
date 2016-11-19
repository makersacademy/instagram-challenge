require 'rails_helper'

feature "Pictures" do
  context "no pictures have been added" do
    scenario "it should display a prompt to add a picture" do
      visit "/pictures"
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do
    before do
      @rick = User.create(name: "rick", email: "asda@example.com")
      @rick.pictures.create(description: 'Loch Lomond')
      puts @rick.id
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('Loch Lomond')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'create pictures' do
    scenario 'can add new pictures' do
      # skip "Need to figure out how to test this!"
      visit '/pictures'
      click_link 'Add a picture'
      expect(current_path).to eq '/pictures/new'
      fill_in "Description", with: "Loch Hope"
      click_button "Upload Picture"
      expect(page).to have_content "Loch Hope"
    end
  end
end
