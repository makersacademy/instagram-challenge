require 'rails_helper'

feature 'mewments' do
  context 'no mewments have been added' do
    scenario 'should display a prompt to add a mewment' do
      visit '/mewments'
      expect(page).to have_content 'Start preening your whiskers, kitty cats!'
      expect(page).to have_link 'Post a picture'
    end
  end
  context 'Posting a mewment' do
    scenario 'Uploading an image and adding a caption' do
    visit('/mewments')
    click_link 'Post a picture'
    fill_in('Caption', with: "Feline so Cathletic")
    attach_file('Image', File.absolute_path("./spec/images/Cathletes.jpg"), visible: false)
    click_button('Create Mewment')
    expect(page).to have_css("img[src*='']")
    end
  end
end
