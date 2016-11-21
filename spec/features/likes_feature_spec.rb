require 'rails_helper'

feature 'endorsing reviews' do

  before do
    @user = User.create(email: 'abc@123.com', password: '123456')
    @user.pictures.create(description: 'Kitty cat')
  end

  scenario 'a user can like a picture, which updates the likes count' do
    visit '/pictures'
    click_link 'Kitty cat'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

end
