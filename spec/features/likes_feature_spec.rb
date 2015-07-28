require 'rails_helper'

feature 'liking photos' do
  before do
  	@user = User.create email: 'natso@gmail.com', password: '12345678', password_confirmation: '12345678'
    login_as @user
    @photo = Photo.create description:'nice', image_file_name:'gramophone.png', user_id: @user.id
  end

  scenario 'photo has 0 likes initially' do
    visit '/'
    expect(page).to have_content('0 likes')
  end

  scenario 'a user can like a photo', js: true do
    visit '/'
    click_link 'Like'
    save_and_open_page
    expect(page).to have_content('1 like')
  end
end