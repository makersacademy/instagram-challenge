require 'rails_helper'

feature 'Index displays a list of posts' do
  scenario 'the index displays correct created post information' do
    create(:post, description: 'Hello world!')
    create(:post, description: 'another post')
    user = create(:user)
    sign_in user

    expect(page).to have_content('Hello world!')
    expect(page).to have_content('another post')
    expect(page).to have_css("img[src*='8.jpeg']")
  end
end
