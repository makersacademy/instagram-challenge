require 'rails_helper'


RSpec.feature 'Posts can be commented on and comments are displayed', type: :feature do
  let(:user) { User.create(name: "Tester", email: "test@example.com", password: "secret") }
  scenario 'User can see comments' do
    sign_in
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'First Post'
    click_button 'Submit'
    fill_in 'comment[body]', with: 'This is a comment, look at my comment'
    click_button 'Create Comment'
    expect(page).to have_current_path('/posts')
    expect(page).to have_content('This is a comment, look at my comment')
  end
end
