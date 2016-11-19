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
      @picture = @rick.pictures.create(description: 'Loch Lomond')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('Loch Lomond')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'create pictures' do
    scenario 'can add new pictures' do
      #http://www.charliemassry.com/posts/29-testing-paperclip-with-rspec-capybara-and-factory-girl
      visit '/pictures'
      click_link 'Add a picture'
      expect(current_path).to eq '/pictures/new'
      fill_in "Description", with: "Loch Hope"
      attach_file "picture_image", "spec/asset_specs/photos/photo.jpg"
      click_button "Upload Picture"
      expect(current_path).to eq '/pictures'
      expect(page).to have_content "Loch Hope"
      expect(page).to have_selector("img")
    end
  end

  context 'reading pictures' do
    before do
      @rick = User.create(name: "rick", email: "asda@example.com")
      @picture = @rick.pictures.create(description: 'Loch Lomond')
    end

    scenario 'can view an individual picture' do
      visit '/pictures'
      click_link "View Loch Lomond"
      expect(current_path).to eq "/pictures/#{@picture.id}"
      expect(page).to have_content "Loch Lomond"
      click_link "Back to pictures"
      expect(current_path).to eq "/pictures"
    end
  end
end
