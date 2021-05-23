require 'rails_helper'

feature 'Index displays all posts' do
  scenario 'can view all posts with correct information' do
    post_one = create(:post, caption: 'Post one')
    post_two = create(:post, caption: 'Post two')

    visit '/'
    expect(page).to(have_content('Post one'))
    expect(page).to(have_content('Post two'))
    expect(page).to(have_css("img[src*='sunrise.jpg']"))
  end
end
