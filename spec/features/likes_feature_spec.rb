require 'rails_helper'

feature 'liking pictures' do
  before do
    @user = create :user
    @user.pictures.create(picture_file_name: 'associations')
  end
  scenario 'user can like a picture, which updates the like count' do
    visit '/pictures'
    click_link 'Like'
    expect(page).to have_content '1 like'
  end
end
