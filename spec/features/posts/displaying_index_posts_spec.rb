require 'rails_helper'

feature 'Displaying a list of posts' do
  background do
    user = create :user
    first_post = create(:post, caption: 'This is the first post', user_id: user.id)
    second_post = create(:post, caption: 'This is the second post', user_id: user.id)

    sign_in_with user
  end

  scenario 'index displays correct information of created posts' do
    expect(page).to have_content('This is the first post')
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='Brainslug']")
  end
end
