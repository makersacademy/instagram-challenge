require 'rails_helper'

feature 'liking a picture' do
  scenario 'a user can like a picture' do
    picture = Picture.create title: "test"
    visit '/'
    click_link 'Like'
    expect(current_path).to eq '/pictures'
    expect(picture.likes.count).to eq 1
  end
end