require 'rails_helper'

feature 'commenting' do
  before {Photo.create title: 'Tomato'}

  scenario 'allows users to leave a comment using a form' do
    user = build :user
    sign_up(user)
    visit '/photos'
    click_link 'Tomato'
    click_link 'Comment'
    fill_in "Thoughts", with: "Excellent tomato"
    click_button 'Leave Comment'
    expect(page).to have_content('Excellent tomato')
  end

end