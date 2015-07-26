require 'rails_helper'

feature 'liking photos' do
  before do
    @user = User.create username: 'fakeuser', email: 'fake@gmail.com', password: '12345678', password_confirmation: '12345678'
    login_as @user
  end

  it 'a user can endorse a review, which increments the endorsement count', js: true do
    add_photo
    expect(page).to have_content('Grumpy cat')
    click_link 'like'
    expect(page).to have_content("likes 1")
  end

end