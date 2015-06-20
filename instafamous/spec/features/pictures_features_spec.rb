require 'rails_helper'

feature 'Pictures' do

  scenario 'show button on homepage to add a picture' do
    visit('/')
    expect(page).to have_content('No pictures in the network')
    expect(page).to have_button('Add Picture')
  end

  xscenario 'add a Picture' do
    visit('/')
    click_button('Add Picture')
    attach_file 'Image', '/spec/features/uploads/nuggets.jpeg'
    fill_in 'Caption', with: 'My first photo'
    click_button('Post')
    expect(current_path).to eq ('/')
    expect(page).to have_content('My first photo')
    expect(page).to have_css('.img-post')
  end

  context 'pictures added' do
    before do
      Picture.create(caption: 'Photo 1')
    end
    scenario 'show all the pictures on homepage' do
      visit ('/')
      expect(page).to have_content('Photo 1')
    end
  end
end