require 'rails_helper'

feature 'liking pictures' do
  before do
    user = build(:user)
    sign_up(user)
    visit '/pictures'
    click_link 'Add a new picture'
    fill_in 'Caption', with: 'Awesome narwhal'
    attach_file 'picture[image]', 'spec/assets/images/image01.png'
    click_button 'Create Picture'
  end

  scenario 'a user can like a picture, which updates the likes count' do
    visit '/pictures'
    click_link 'Like picture'
    expect(page).to have_content('1 like')
  end
end