require 'rails_helper'

feature 'Viewing all posts on index' do 
  scenario do 
    post = create(:post)
    visit '/'
    expect(page).to have_content('This is my first post')
    expect(page).to have_content("img[src*='tree']")
   end 
end 