require 'rails_helper'

feature 'liking' do
  before do
    sign_up('steph@test.com', 'stephtest', 'stephtest')
    click_link 'Add a post'
    attach_file('post[image]', 'spec/features/holiday.jpg')
    fill_in 'Description', with: 'Lazy day'
    click_button 'Post'
    click_link 'Sign out'
  end

  it 'allows a user to like a post', js: true do
    sign_up('test@test.com', 'testtest', 'testtest')
    click_link 'Like'
    expect(page).to have_content '1 like'
  end

  it 'prevents a user liking a post unless they are signed in', js: true do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content '0 likes'
  end

end

def sign_up(email, password, password_confirmation)
  visit '/users/sign_up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end