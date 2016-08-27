require 'rails_helper'
require 'features/feature_spec_helper'

feature 'posts' do
  before do
    sign_up
  end

  scenario 'a user makes a post' do
    new_post
    expect(page).to have_content('Amazing. #jackspoint #queenstown')
    expect(page).to have_css("img[src*='jackspoint.jpeg']")
  end

  scenario 'a new post contains the user_name of the user' do
    new_post
    expect(page).to have_content('tc')
  end

end
