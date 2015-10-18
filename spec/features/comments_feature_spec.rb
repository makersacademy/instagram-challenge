require 'rails_helper'

feature 'commenting' do

  def sign_up_with(email)
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: email)
    fill_in('Password', with: 'testttest')
    fill_in('Password confirmation', with: 'testttest')
    click_button('Sign up')
  end

  before {Photo.create caption: 'sunrise'}

  scenario 'allows users to leave a comment using a form' do
     sign_up_with('test@example.com')
     click_link 'Leave a comment'
     fill_in "Comment", with: "nice photo"
     click_button 'Leave Comment'

     expect(current_path).to eq '/photos'
     expect(page).to have_content('nice photo')
  end
end