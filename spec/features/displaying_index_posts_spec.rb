require 'rails_helper'

feature 'Index displays a list of posts' do
  scenario 'index displays created posts' do
    post_1 = create(:post, text: 'Post 1')
    post_2 = create(:post, text: 'Post 2')

    visit '/'

    expect(page).to have_content('Post 1')
    expect(page).to have_content('Post 2')
    expect(page).to have_css("img[src*='test_img_1']")
  end
end