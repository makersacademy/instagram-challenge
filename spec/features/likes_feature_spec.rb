require 'rails_helper'

feature 'liking pictures' do
  before do
    sign_up
    upload_picture
    click_link 'Sign out'
    sign_up(email:'test2@example.com', password:'testpassword')
    click_link 'Like'
  end

  scenario 'a user can like a picture, which updates the like count', js: true do
    expect(page).to have_content('1 like')
  end

end
