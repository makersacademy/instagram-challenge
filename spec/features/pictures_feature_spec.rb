require 'rails_helper'

describe "Pictures" do
  context "no pictures have been added" do
    it 'should confirm none have been added' do
      visit '/pictures'
      expect(page).to have_content "No pictures have been added"
      expect(page).to have_link "Add a picture"
    end
  end

  context "pictures have been added" do
    before do
      Picture.create!(caption: "My first picture")
    end
    it "should display pictures" do
      visit '/pictures'
      expect(page).to have_content "My first picture"
      expect(page).not_to have_content "No pictures have been added"
    end
  end

  context "adding pictures" do
    scenario "prompts user to fill out a form, then displays the new picture" do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Caption', with: 'My first picture'
      click_button 'Create Picture'
      expect(page).to have_content 'My first picture'
      expect(current_path).to eq '/pictures'
    end
  end
end
