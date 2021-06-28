require 'rails_helper'

feature 'Liking posts' do
  
  background do
    user = create(:user)
    post = create(:post)
    visit '/'
    find(:xpath, "/html/body/main/div/div[1]/a").click
  end

  scenario 'a user can like a post' do
    click_button "Like"
    expect(page).to have_content("1 like")
  end 
end