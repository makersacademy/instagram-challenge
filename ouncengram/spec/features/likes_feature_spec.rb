require 'rails_helper'

feature 'Likes' do

  scenario 'a user can like a photo' do
    visit '/'
    user_signup('email@email.com')
    create_photo('a photo', 'another photo')
    click_link 'Like'
    expect(page).to have_content '1 Like'
  end

end
