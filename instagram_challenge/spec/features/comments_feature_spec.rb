require 'rails_helper'

feature 'commenting on a photo' do
  before {Photo.create caption: 'NYC'}

  scenario 'allows users to leave a review using a form' do
    visit '/photos'
    click_link 'Sign up'
    fill_in 'Email', with: 'steve@email.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'
     visit '/photos'
     click_link 'Comment on NYC'
     fill_in "Thoughts", with: "WOW!"
     click_button 'Leave Comment'
     expect(current_path).to eq '/photos'
     expect(page).to have_content('WOW!')
  end

end
