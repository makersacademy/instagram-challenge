require 'rails_helper'

feature 'Index displays all posts' do
  scenario 'can view all posts with correct information' do
    post_one = create(:post, caption: 'One')
    post_two = create(:post, caption: 'Two')

    visit '/'
    expect(page).to(have_content('One'))
    expect(page).to(have_content('Two'))
    expect(page).to(have_css("img[src*='sunrise.jpg']"))
  end
end
