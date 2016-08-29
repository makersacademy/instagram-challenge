require 'rails_helper'

feature 'liking posts' do
  
  before do
    sign_up
    create_post
  end

  scenario 'a user can like a post, which updates the likes count' do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

  scenario 'a user can like a post only once' do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content '1 like'
    expect(page).not_to have_link 'Like'
  end

end
