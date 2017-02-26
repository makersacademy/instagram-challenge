require 'rails_helper'
require 'web_helper'

feature 'tagging posts' do
  scenario 'a user can tag their own posts' do
    create_user
    create_post
    sign_in
    click_link 'My lovely photo'
    fill_in 'Tag', with: 'awesome'
    click_button 'Add Tag'
    expect(current_path).to eq ('/posts/1')
    expect(page).to have_content('awesome')
  end
end
