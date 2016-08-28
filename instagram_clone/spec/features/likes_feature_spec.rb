require 'rails_helper'

feature 'Likes' do
  before do
    sign_up
    create_post
  end

  scenario 'A user can like a post which increases the number of likes by 1' do
    visit '/posts'
    click_link 'Like this post'
    expect(page).to have_content '1 like'
  end

end
