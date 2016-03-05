require 'rails_helper'

feature 'liking posts' do

  scenario 'a user can like a post, which updates the post like count', js: true do
    signup
    create_post
    visit '/'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

  scenario 'limits users to one like per photo', js: true do
    signup
    create_post
    visit '/'
    click_link 'Like'
    click_link 'Like'
    click_link 'Like'    
    expect(page).to have_content('1 like')
  end

end
