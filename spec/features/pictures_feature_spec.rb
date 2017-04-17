require 'rails_helper'

feature 'pictures' do

  context 'no pictures have been added' do

    scenario 'should display a prompt to add a picture' do
      visit '/'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end

  end

  context 'pictures have been added' do

    before do
      Picture.create(title: 'Rolling fields')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('Rolling fields')
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'creating pictures' do
  scenario 'prompts user to fill out a form, select a picture to upload, then displays the new picture' do
    # file = fixture_file_upload('files/fnv.jpg', 'image/jpg')
    # Capybara.ignore_hidden_elements = false
    attach_file "picture_image", "spec/fixtures/files/fnv.jpg"
    visit '/pictures'
    click_link 'Add a picture'
    fill_in 'Title', with: 'The fields and the vales'
    click_button 'Create Picture'
    expect(page).to have_content 'The fields and the vales'
    expect(current_path).to eq '/pictures'
  end
end

end