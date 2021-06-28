require 'rails_helper'

feature 'Liking posts' do
  
  background do
    user = create(:user)
    post = create(:post)
    visit '/users/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit '/'
    find(:xpath, "/html/body/main/div/div[1]/a").click
  end

  scenario 'a user can like a post' do
    click_button "Like"
    expect(page).to have_content("1 like")
  end 
end