require 'rails_helper'



feature 'commenting' do

  scenario 'allows users to leave a comment using a form' do
    visit '/'
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
    click_link 'Add a picture'
    fill_in 'Caption', with: 'Hebrides'
     click_button 'Create Picture'
     click_link 'Comment on Hebrides'
     fill_in "Thoughts", with: "lovely picture"
     click_button 'Leave Comment'
     expect(page).to have_content('lovely picture')
  end

end
