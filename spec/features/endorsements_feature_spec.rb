require 'rails_helper'
require 'web_helpers'

feature 'liking posts' do
  before do
    sign_up("test@gmail.com", "password")
    create_post("description")
  end

  scenario 'a user can like a post, which updates the post endorsement count' do
    visit '/photographs'
    click_link 'Like post'
    expect(page).to have_content('1 Like')
  end
end
