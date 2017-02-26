require 'rails_helper'

feature 'liking photos' do
  before do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'bob@example.com'
    fill_in 'Password', with: 'testtest'
    fill_in 'Password confirmation', with: 'testtest'
    click_button 'Sign up'
    visit '/'
    click_link 'Add a photo'
    fill_in 'Description', with: 'Another test description'
    page.attach_file("photo_image", Rails.root + 'app/assets/images/burger_king.jpg')
    click_button 'Add Photo'
  end

  scenario 'a user can like a photo', js: true do
    visit '/'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

end
