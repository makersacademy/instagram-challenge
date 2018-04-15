require 'rails_helper'

feature 'Displaying a list of posts' do
  scenario 'index displays correct information of created posts' do
    first_post = create(:post, caption: 'This is the first post')
    second_post = create(:post, caption: 'This is the second post')

    visit '/'
    expect(page).to have_content('This is the first post')
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='Brainslug']")
  end
end
