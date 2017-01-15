require 'rails_helper'

feature 'liking pictures' do
  scenario 'a user can like a picture, which updates the likes count' do
    sign_up
    create_picture
    visit '/pictures'
    click_link '😻'
    expect(page).to have_content('1 like')
  end
end
