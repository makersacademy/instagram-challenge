require 'rails_helper'

feature 'likes' do

  before { Image.create description: 'First picture', avatar_file_name: 'test.jpg' }

  scenario 'allow users to "love" images' do
    visit '/images'
    click_link 'Love'
    expect(page).to have_content 'Thanks for your like!'
    expect(page).to have_content 'Loves: 1'
  end
end
