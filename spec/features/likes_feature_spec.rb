require 'rails_helper'

feature 'liking posts' do
  
  before do
    user_sign_up
    create_post
  end

  scenario 'a user can like a post, wich updates the post likes count' do
    visit '/posts'
    click_button 'Like!'
    expect(page).to have_content('1 like')
  end

end