require 'rails_helper'

feature 'Likes' do

  before { Picture.create title: 'My picture' }

  scenario 'a user can like a picture, which will increase "likes" count', js: true do
    visit '/pictures'
    click_link 'Like'
    expect(page).to have_content('like')
  end

end
