
require 'rails_helper'

feature 'liking posts' do
  before do
    user_sign_up
    create_post
  end

  scenario 'a user can like a post, which updates the post likes count', js: true do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end


  scenario 'posts display the correct number of likes', js: true do
    visit '/posts'
    8.times do
      click_link 'Like'
      wait_for_ajax
    end
    expect(page).to have_content('8 likes')
  end
end
