require 'rails_helper'
require 'features/feature_spec_helper'

feature 'likes' do

  before do
    sign_up
    new_post
  end

  scenario 'a user can like a post' do
    visit posts_path
    click_link '♡'
    expect(page).to have_content('♥ 1 like')
  end

  scenario 'a user can only like a post once' do
    visit posts_path
    click_link '♡'
    click_link '♡'
    expect(page).to have_content('♥ 1 like')
  end

end
