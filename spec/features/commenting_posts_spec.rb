require 'rails_helper'

feature 'Commenting on posts' do
  
  background do
    user = create(:user)
    post = create(:post)
    visit '/users/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  scenario 'a user can comment on a post' do
    fill_in "comment[text]", with: "My comment"
    click_button "Add comment"
    expect(page).to have_content("My comment")
  end 
end