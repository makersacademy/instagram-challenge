require 'rails_helper'

feature 'editing a photo' do

  scenario 'edit button on the page' do
  post_photo
  expect(page).to have_link 'Edit this photo'
  end

  scenario 'allows a user to edit a photo' do
    post_photo
    click_link 'Edit this photo'
    fill_in 'Description', with: 'a new test description'
    click_button 'Update Photo'
    expect(current_path).to eq '/'
    expect(page).to have_content 'a new test description'
  end
end
