require 'rails_helper'

feature 'Index displays a list of posts' do
  scenario 'the index displays correct created post information' do
    post_one = create(:post, caption: 'number one')
    post_two = create(:post, caption: 'number two')

    visit '/'
    expect(page).to have_content('number one')
    expect(page).to have_content('number two')
    expect(page).to have_css("img[src*='one']")
  end
end
