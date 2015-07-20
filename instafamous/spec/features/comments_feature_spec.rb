require 'rails_helper'

feature 'Comments' do
  before do
    @user = User.create(email: 'test@test.com', password: '123456789')
    @user.pictures.create(caption: 'Photo 1')
    visit ('/')
    click_link('Sign up')
    fill_in("Email", with: 'test@example.com')
    fill_in("Password", with: 'testtest')
    fill_in("Password confirmation", with: 'testtest')
    click_button('Sign up')
  end

  scenario 'can be added to pictures' do
    visit('/')
    find('.comment').click
    fill_in 'Comment', with: 'Hey there'
    click_button('Create Comment')
    expect(current_path).to eq ('/')
    expect(page).to have_content('Hey there')
  end
end