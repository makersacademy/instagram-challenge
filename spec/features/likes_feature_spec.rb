require 'rails_helper'

feature 'liking posts' do
  before do
    sign_up
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/scenery.jpg')
    fill_in 'Caption', with: 'great view!'
    click_button 'Create Post'
    click_link 'Sign out'
  end

  xscenario 'a user can endorse a review, which updates the review endorsement count' do
    sign_up(email: "bob@bob.com", password: "password", password_confirmation: "password")
    click_link 'great view!'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

end
