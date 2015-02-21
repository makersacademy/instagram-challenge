require 'rails_helper'

feature 'liking' do
  before { Post.create description: 'Awesome latte' }

  scenario 'allows a user to like a post' do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end
end