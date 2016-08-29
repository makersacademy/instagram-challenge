require 'rails_helper'

feature 'Comments' do

  before do
    User.create(email: "test@test.com", password: "123456")
    Photo.create(caption: "this is a photo", user_id: User.last.id)
  end

  scenario 'users not logged in cannot leave comments' do
    visit '/photos'
    expect(page).not_to(have_link("Comment"))
    click_link 'this is a photo'
    expect(page).not_to(have_link("Comment"))
  end


  scenario 'logged in users can leave comments' do
    visit '/photos'
    click_link 'Sign up'
    fill_in 'Email', with: "test1@test.com"
    fill_in 'Password', with: "123456"
    fill_in 'Password confirmation', with: "123456"
    click_button 'Sign up'
    click_link 'Comment'
    fill_in 'Comment', with: "Amazing photo"
    click_button 'Leave Comment'
    expect(page).to(have_content("Amazing photo"))
  end


end
