require 'rails_helper'

feature 'Likes' do
  before do
    sign_up
    create_post
  end

  scenario 'A user can like a post which increases the number of likes by 1' do
    visit '/posts'
    click_button 'Love this post'
    expect(page).to have_content '1 ♥'
  end

  scenario 'When there are no likes for a post, we see a "hollow" heart' do
    visit '/posts'
    expect(page).not_to have_content '1 ♥'
    expect(page).to have_content '0 ♡'
  end

end
