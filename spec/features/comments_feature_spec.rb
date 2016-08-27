require 'rails_helper'
require 'features/feature_spec_helper'

feature 'comments' do

  before do
    sign_up
    new_post
  end

  scenario 'a user can write a comment on a post' do
    visit posts_path
    click_link '✎'
    fill_in 'comment[comment_text]', with: "I love Jack's Point!"
    click_button 'Post'
    expect(page).to have_content "I love Jack's Point!"
  end

end
