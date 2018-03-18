require 'rails_helper'

feature 'delete a post' do
  scenario 'removes post from database' do
    create_new_post
    click_link 'Delete'
    expect(page).to have_current_path '/posts'
    expect(page).not_to have_content 'what a terrible picture'
  end
end
