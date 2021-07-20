require 'rails_helper'

feature 'A user can click on a post to display individual post' do
  scenario 'A user clicks on a post' do
    post = create(:post, caption: "My favourite cat")
    
    visit '/'
    find(:xpath, "/html/body/main/div/div[1]/a").click
    expect(page).to have_content("My favourite cat")
  end
end 
