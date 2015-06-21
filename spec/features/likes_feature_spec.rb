require 'rails_helper'

feature 'liking a picture' do
  before { Picture.create title: "test"}

  scenario 'a user can like a picture' do
    visit '/'
    click_button 'Like'
    expect(current_path).to eq '/pictures'
    expect(picture.likes).to eq 1
  end
end