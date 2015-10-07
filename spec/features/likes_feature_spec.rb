require 'rails_helper'

feature 'liking pictures' do
  before(:each) do
    user = build(:user)
    sign_up(user)
    visit '/pictures'
    click_link 'Add a new picture'
    fill_in 'Caption', with: 'Awesome narwhal'
    attach_file 'picture[image]', 'spec/assets/images/image01.png'
    click_button 'Create Picture'
  end

  scenario 'user likes a picture, which updates the likes count', js: true do
    visit '/pictures'
    find('.like').click
    expect(page).to have_content('1 like')
  end

end