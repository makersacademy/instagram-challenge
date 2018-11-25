require 'rails_helper'
require_relative '../test_helpers'

RSpec.feature 'Commenting', type: :feature do
  scenario 'a user can comment' do
    user_sign_up
    create_new_post
    user_sign_out
    user2_sign_up
    visit '/posts'
    click_link 'Show'
    fill_in('comment_text', with: 'My test comment')
    click_button 'Create Comment'
    expect(page).to have_content("username456: My test comment")
  end
end
