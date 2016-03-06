require 'rails_helper'

feature 'liking pictures' do
  it 'a user can like a photo, which increments the like count', js: true do
  	sign_up_and_in("Russell", "Vaughan", "username", "russell@example.com")
    create_photo
    click_link 'Like' 
    expect(page).to have_content('1 Like')
  end

end