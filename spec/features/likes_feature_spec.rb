require 'rails_helper'

feature 'liking a post' do
  before do
    add_new_post
  end

  scenario 'a user can like a post which updates the likes count', js: true do
    visit '/posts'
    click_link "♡"
    expect(page).to have_content '♥ 1 like'
  end

end
