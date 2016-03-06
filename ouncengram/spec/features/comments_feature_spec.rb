require 'rails_helper'

feature 'Comments' do

  scenario 'a user can comment on a photo' do
    visit '/'
    user_signup('email@email.com')
    create_photo('a photo', 'another photo')
    click_link 'Comment'
    fill_in 'Thoughts', with: 'A comment'
    click_button 'Comment'
    expect(page).to have_content 'A comment'
  end

end
